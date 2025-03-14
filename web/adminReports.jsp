<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Check if the user is logged in
    String username = (session != null) ? (String) session.getAttribute("username") : null;
    if (username == null) {
        response.sendRedirect("admin.jsp?error=Please login first");
        return;
    }

    // Handle CSV export request
    if ("exportCSV".equals(request.getParameter("action"))) {
        String reportType = request.getParameter("reportType");
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=" + reportType + "_report.csv");

        try (PrintWriter writer = response.getWriter()) {
            String dbURL = "jdbc:mysql://localhost:3306/mega_city_cab";
            String dbUser = "root";
            String dbPassword = "root";
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                String query = "";
                switch (reportType) {
                    case "revenue":
                        query = "SELECT DATE_FORMAT(b.CreatedAt, '%Y-%m') AS Month, SUM(b.FinalAmount) AS TotalRevenue "
                                + "FROM Bills b "
                                + "WHERE b.PaymentStatus = 'Paid' "
                                + "GROUP BY DATE_FORMAT(b.CreatedAt, '%Y-%m') "
                                + "ORDER BY Month DESC";
                        break;
                    case "bookings":
                        query = "SELECT b.BookingID, c.FullName AS CustomerName, ca.CarModel, b.Status, bi.FinalAmount "
                                + "FROM Bookings b "
                                + "JOIN Customers c ON b.CustomerID = c.CustomerID "
                                + "LEFT JOIN Cars ca ON b.CarID = ca.CarID "
                                + "LEFT JOIN Bills bi ON b.BookingID = bi.BookingID "
                                + "ORDER BY b.BookingDate DESC";
                        break;
                }

                stmt = conn.prepareStatement(query);
                rs = stmt.executeQuery();

                // Write CSV headers
                ResultSetMetaData metaData = rs.getMetaData();
                int columnCount = metaData.getColumnCount();
                for (int i = 1; i <= columnCount; i++) {
                    writer.append(metaData.getColumnName(i));
                    if (i < columnCount) writer.append(",");
                }
                writer.append("\n");

                // Write CSV data
                while (rs.next()) {
                    for (int i = 1; i <= columnCount; i++) {
                        writer.append(rs.getString(i));
                        if (i < columnCount) writer.append(",");
                    }
                    writer.append("\n");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        }
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Admin Reports - Mega City Cab</title>
</head>

<body class="text-gray-800 font-inter">

    <!-- start: Sidebar -->
    <div class="fixed left-0 top-0 w-64 h-full bg-gray-900 p-4 z-50 sidebar-menu transition-transform">
        <a href="#" class="flex items-center pb-4 border-b border-b-gray-800">
            <img src="Images/Logo.jpg" alt="" class="w-8 h-8 rounded object-cover">
            <span class="text-lg font-bold text-white ml-3">Mega City Cab</span>
        </a>
        <ul class="mt-4">
                <li class="mb-1 group ">
                    <a href="adminDashboard.jsp"
                       class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100">
                        <i class="ri-home-2-line mr-3 text-lg"></i>
                        <span class="text-sm">Home</span>
                    </a>
                </li>
                <li class="mb-1 group">
                    <a href="adminBookings.jsp"
                       class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100">
                        <i class="ri-taxi-line mr-3 text-lg"></i>
                        <span class="text-sm">Bookings</span>
                    </a>
                </li>
                <li class="mb-1 group">
                    <a href="adminCustomers.jsp"
                       class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100">
                        <i class="ri-user-6-line mr-3 text-lg"></i>
                        <span class="text-sm">Customers</span>
                    </a>
                </li>
                <li class="mb-1 group">
                    <a href="adminDrivers.jsp"
                       class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100">
                        <i class="ri-steering-2-line mr-3 text-lg"></i>
                        <span class="text-sm">Drivers</span>
                    </a>
                </li>
                <li class="mb-1 group">
                    <a href="adminCar.jsp"
                       class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100">
                        <i class="ri-car-line mr-3 text-lg"></i>
                        <span class="text-sm">Cars</span>
                    </a>
                </li>
                <li class="mb-1 group">
                    <a href="adminBilling.jsp"
                       class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100">
                        <i class="ri-money-dollar-circle-line mr-3 text-lg"></i>
                        <span class="text-sm">Billing</span>
                    </a>
                </li>
                <li class="mb-1 group">
                    <a href="adminPayments.jsp"
                       class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100">
                        <i class="ri-bank-card-line mr-3 text-lg"></i>
                        <span class="text-sm">Payments</span>
                    </a>
                </li>
                <li class="mb-1 group">
                    <a href="adminContacts.jsp"
                       class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100">
                        <i class="ri-contacts-line mr-3 text-lg"></i>
                        <span class="text-sm">Contacts</span>
                    </a>
                </li>
                <li class="mb-1 group active">
                    <a href="adminReports.jsp"
                       class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100">
                        <i class="ri-file-chart-line mr-3 text-lg"></i>
                        <span class="text-sm">Reports</span>
                    </a>
                </li>
            </ul>
    </div>
    <div class="fixed top-0 left-0 w-full h-full bg-black/50 z-40 md:hidden sidebar-overlay"></div>
    <!-- end: Sidebar -->

    <!-- start: Main -->
    <main class="w-full md:w-[calc(100%-256px)] md:ml-64 bg-gray-50 min-h-screen transition-all main">
        <div class="py-2 px-6 bg-white flex items-center shadow-md shadow-black/5 sticky top-0 left-0 z-30">
            <button type="button" class="text-lg text-gray-600 sidebar-toggle">
                <i class="ri-menu-line"></i>
            </button>
            <ul class="flex items-center text-sm ml-4">
                <li class="mr-2">
                    <a href="#" class="text-gray-400 hover:text-gray-600 font-medium">MCC Dashboard</a>
                </li>
                <li class="text-gray-600 mr-2 font-medium">/</li>
                <li class="text-gray-600 mr-2 font-medium">Reports</li>
            </ul>

            <!-- Welcome message -->
            <ul class="ml-auto flex items-center text-sm">
                <li class="mr-2 text-gray-600 font-sm">
                    Welcome, <%= username%>
                </li>
                <li class="mr-1">
                    <a href="LogoutServlet">
                        <button type="button"
                                class="text-gray-400 w-8 h-8 rounded flex items-center justify-center hover:bg-gray-50 hover:text-gray-600">
                            <i class="ri-logout-circle-r-line"></i>
                        </button>
                    </a>
                </li>
            </ul>
        </div>

        <div class="p-6">
            <!-- Revenue Report -->
            <div class="bg-white border border-gray-100 shadow-md shadow-black/5 p-6 rounded-md mb-6">
                <div class="flex justify-between mb-4 items-start">
                    <div class="font-medium text-xl">Revenue Report</div>
                    <form method="post" action="adminReports.jsp">
                        <input type="hidden" name="action" value="exportCSV">
                        <input type="hidden" name="reportType" value="revenue">
                        <button type="submit" class="bg-gray-900 text-white px-4 py-2 rounded text-sm hover:bg-gray-800 transition-colors">
                            Export CSV
                        </button>
                    </form>
                </div>
                <div class="overflow-x-auto">
                    <table class="min-w-full bg-white">
                        <thead>
                            <tr style="background-color: #111827;" class="text-white">
                                <th class="py-3 px-6 text-left text-sm">Month</th>
                                <th class="py-3 px-6 text-left text-sm">Total Revenue</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String dbURL = "jdbc:mysql://localhost:3306/mega_city_cab";
                                String dbUser = "root";
                                String dbPassword = "root";
                                Connection conn = null;
                                PreparedStatement stmt = null;
                                ResultSet rs = null;

                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                                    // Query to calculate monthly revenue
                                    String query = "SELECT DATE_FORMAT(b.CreatedAt, '%Y-%m') AS Month, SUM(b.FinalAmount) AS TotalRevenue "
                                            + "FROM Bills b "
                                            + "WHERE b.PaymentStatus = 'Paid' "
                                            + "GROUP BY DATE_FORMAT(b.CreatedAt, '%Y-%m') "
                                            + "ORDER BY Month DESC";
                                    stmt = conn.prepareStatement(query);
                                    rs = stmt.executeQuery();

                                    while (rs.next()) {
                            %>
                            <tr class="border-b">
                                <td class="py-3 px-6 text-sm"><%= rs.getString("Month")%></td>
                                <td class="py-3 px-6 text-sm">Rs.<%= rs.getDouble("TotalRevenue")%></td>
                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    if (rs != null) rs.close();
                                    if (stmt != null) stmt.close();
                                    if (conn != null) conn.close();
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Bookings Report -->
            <div class="bg-white border border-gray-100 shadow-md shadow-black/5 p-6 rounded-md mb-6">
                <div class="flex justify-between mb-4 items-start">
                    <div class="font-medium text-xl">Bookings Report</div>
                    <form method="post" action="adminReports.jsp">
                        <input type="hidden" name="action" value="exportCSV">
                        <input type="hidden" name="reportType" value="bookings">
                        <button type="submit" class="bg-gray-900 text-white px-4 py-2 rounded text-sm hover:bg-gray-800 transition-colors">
                            Export CSV
                        </button>
                    </form>
                </div>
                <div class="overflow-x-auto">
                    <table class="min-w-full bg-white">
                        <thead>
                            <tr style="background-color: #111827;" class="text-white">
                                <th class="py-3 px-6 text-left text-sm">Booking ID</th>
                                <th class="py-3 px-6 text-left text-sm">Customer</th>
                                <th class="py-3 px-6 text-left text-sm">Car</th>
                                <th class="py-3 px-6 text-left text-sm">Status</th>
                                <th class="py-3 px-6 text-left text-sm">Fare</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                                    // Query to fetch booking details
                                    String query = "SELECT b.BookingID, c.FullName AS CustomerName, ca.CarModel, b.Status, bi.FinalAmount "
                                            + "FROM Bookings b "
                                            + "JOIN Customers c ON b.CustomerID = c.CustomerID "
                                            + "LEFT JOIN Cars ca ON b.CarID = ca.CarID "
                                            + "LEFT JOIN Bills bi ON b.BookingID = bi.BookingID "
                                            + "ORDER BY b.BookingDate DESC";
                                    stmt = conn.prepareStatement(query);
                                    rs = stmt.executeQuery();

                                    while (rs.next()) {
                            %>
                            <tr class="border-b">
                                <td class="py-3 px-6 text-sm"><%= rs.getInt("BookingID")%></td>
                                <td class="py-3 px-6 text-sm"><%= rs.getString("CustomerName")%></td>
                                <td class="py-3 px-6 text-sm"><%= rs.getString("CarModel")%></td>
                                <td class="py-3 px-6 text-sm"><span class="px-2 py-1 rounded-full 
                                    <%= rs.getString("Status").equals("Pending") ? "bg-yellow-100 text-yellow-800" : 
                                       rs.getString("Status").equals("Completed") ? "bg-green-100 text-green-800" : 
                                       "bg-red-100 text-red-800" %>">
                                    <%= rs.getString("Status") %>
                                </span></td>
                                <td class="py-3 px-6 text-sm">Rs.<%= rs.getDouble("FinalAmount")%></td>
                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    if (rs != null) rs.close();
                                    if (stmt != null) stmt.close();
                                    if (conn != null) conn.close();
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>

    <!-- Toast Notifications -->
    <div class="fixed bottom-4 right-4 space-y-2 z-[9999]">
        <% if (request.getParameter("success") != null) {%>
        <div class="toast flex items-center px-4 py-2 rounded-md text-white bg-green-500 animate-slide-in">
            <i class="ri-checkbox-circle-fill mr-2"></i>
            <%= request.getParameter("success")%>
            <button onclick="this.parentElement.remove()" class="ml-4">
                <i class="ri-close-line"></i>
            </button>
        </div>
        <% } %>

        <% if (request.getParameter("error") != null) {%>
        <div class="toast flex items-center px-4 py-2 rounded-md text-white bg-red-500 animate-slide-in">
            <i class="ri-error-warning-fill mr-2"></i>
            <%= request.getParameter("error")%>
            <button onclick="this.parentElement.remove()" class="ml-4">
                <i class="ri-close-line"></i>
            </button>
        </div>
        <% }%>
    </div>

    <style>
        .animate-slide-in {
            animation: slideIn 0.3s ease-out forwards;
        }

        @keyframes slideIn {
            from {
                transform: translateX(100%);
            }
            to {
                transform: translateX(0);
            }
        }
    </style>

    <script>
        // Auto-remove toasts after 5 seconds
        document.addEventListener('DOMContentLoaded', () => {
            document.querySelectorAll('.toast').forEach(toast => {
                setTimeout(() => {
                    toast.style.transform = 'translateX(100%)';
                    setTimeout(() => toast.remove(), 300);
                }, 5000);
            });
        });
    </script>
    <script src="Js/script.js"></script>
</body>

</html>