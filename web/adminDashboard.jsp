<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
    if (username == null) {
        response.sendRedirect("admin.jsp?error=Please login first");
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
        <title>Mega City Cab</title>
    </head>

    <body class="text-gray-800 font-inter">

        <!-- start: Sidebar -->
        <div class="fixed left-0 top-0 w-64 h-full bg-gray-900 p-4 z-50 sidebar-menu transition-transform">
            <a href="#" class="flex items-center pb-4 border-b border-b-gray-800">
                <img src="Images/Logo.jpg" alt="" class="w-8 h-8 rounded object-cover">
                <span class="text-lg font-bold text-white ml-3">Mega City Cab</span>
            </a>
            <ul class="mt-4">
                <li class="mb-1 group active">
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
                <li class="mb-1 group">
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
                    <li class="text-gray-600 mr-2 font-medium">Home</li>
                </ul>

                <!-- Update the welcome message to display the username -->
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

            <%@ page import="java.sql.*" %>
            <%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
            <%@ page contentType="text/html;charset=UTF-8" language="java" %>

            <div class="p-6">
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-6">
                    <!-- Total Bookings -->
                    <div class="bg-white border border-gray-100 shadow-md shadow-black/5 p-6 rounded-md">
                        <div class="flex justify-between mb-4">
                            <div>
                                <div class="flex items-center mb-1">
                                    <div class="text-2xl font-semibold">
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
                                                String query = "SELECT COUNT(*) AS totalBookings FROM Bookings";
                                                stmt = conn.prepareStatement(query);
                                                rs = stmt.executeQuery();
                                                if (rs.next()) {
                                        %>
                                        <%= rs.getInt("totalBookings")%>
                                        <%
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            } finally {
                                                if (rs != null) {
                                                    rs.close();
                                                }
                                                if (stmt != null) {
                                                    stmt.close();
                                                }
                                                if (conn != null) {
                                                    conn.close();
                                                }
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="text-sm font-medium text-gray-400">Total Bookings</div>
                            </div>
                            <div class="w-12 h-12 flex items-center justify-center bg-gray-100 rounded-md">
                                <i class="ri-taxi-line text-2xl text-gray-500"></i>
                            </div>
                        </div>
                    </div>

                    <!-- Total Customers -->
                    <div class="bg-white border border-gray-100 shadow-md shadow-black/5 p-6 rounded-md">
                        <div class="flex justify-between mb-4">
                            <div>
                                <div class="flex items-center mb-1">
                                    <div class="text-2xl font-semibold">
                                        <%
                                            try {
                                                Class.forName("com.mysql.cj.jdbc.Driver");
                                                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                                                String query = "SELECT COUNT(*) AS totalCustomers FROM Customers";
                                                stmt = conn.prepareStatement(query);
                                                rs = stmt.executeQuery();
                                                if (rs.next()) {
                                        %>
                                        <%= rs.getInt("totalCustomers")%>
                                        <%
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            } finally {
                                                if (rs != null) {
                                                    rs.close();
                                                }
                                                if (stmt != null) {
                                                    stmt.close();
                                                }
                                                if (conn != null) {
                                                    conn.close();
                                                }
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="text-sm font-medium text-gray-400">Total Customers</div>
                            </div>
                            <div class="w-12 h-12 flex items-center justify-center bg-gray-100 rounded-md">
                                <i class="ri-user-6-line text-2xl text-gray-500"></i>
                            </div>
                        </div>
                    </div>

                    <!-- Total Drivers -->
                    <div class="bg-white border border-gray-100 shadow-md shadow-black/5 p-6 rounded-md">
                        <div class="flex justify-between mb-4">
                            <div>
                                <div class="flex items-center mb-1">
                                    <div class="text-2xl font-semibold">
                                        <%
                                            try {
                                                Class.forName("com.mysql.cj.jdbc.Driver");
                                                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                                                String query = "SELECT COUNT(*) AS totalDrivers FROM Drivers";
                                                stmt = conn.prepareStatement(query);
                                                rs = stmt.executeQuery();
                                                if (rs.next()) {
                                        %>
                                        <%= rs.getInt("totalDrivers")%>
                                        <%
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            } finally {
                                                if (rs != null) {
                                                    rs.close();
                                                }
                                                if (stmt != null) {
                                                    stmt.close();
                                                }
                                                if (conn != null) {
                                                    conn.close();
                                                }
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="text-sm font-medium text-gray-400">Total Drivers</div>
                            </div>
                            <div class="w-12 h-12 flex items-center justify-center bg-gray-100 rounded-md">
                                <i class="ri-steering-2-line text-2xl text-gray-500"></i>
                            </div>
                        </div>
                    </div>

                    <!-- Total Revenue -->
                    <div class="bg-white border border-gray-100 shadow-md shadow-black/5 p-6 rounded-md">
                        <div class="flex justify-between mb-4">
                            <div>
                                <div class="flex items-center mb-1">
                                    <div class="text-2xl font-semibold">
                                        <%
                                            try {
                                                Class.forName("com.mysql.cj.jdbc.Driver");
                                                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                                                // Query to calculate total revenue for completed bookings
                                                String query = "SELECT SUM(b.FinalAmount) AS totalRevenue "
                                                        + "FROM Bills b "
                                                        + "JOIN Bookings bk ON b.BookingID = bk.BookingID "
                                                        + "WHERE bk.Status = 'Completed'";

                                                stmt = conn.prepareStatement(query);
                                                rs = stmt.executeQuery();

                                                if (rs.next()) {
                                        %>
                                        Rs.<%= rs.getDouble("totalRevenue")%>
                                        <%
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            } finally {
                                                if (rs != null) {
                                                    rs.close();
                                                }
                                                if (stmt != null) {
                                                    stmt.close();
                                                }
                                                if (conn != null) {
                                                    conn.close();
                                                }
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="text-sm font-medium text-gray-400">Total Revenue</div>
                            </div>
                            <div class="w-12 h-12 flex items-center justify-center bg-gray-100 rounded-md">
                                <i class="ri-money-dollar-circle-line text-2xl text-gray-500"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Bookings -->
                <div class="bg-white border border-gray-100 shadow-md shadow-black/5 p-6 rounded-md">
                    <div class="flex justify-between mb-4 items-start">
                        <div class="font-medium text-xl">Recent Bookings</div>
                        <a href="adminBookings.jsp" class="bg-gray-900 text-white px-4 py-2 rounded text-sm hover:bg-gray-800 transition-colors">
                            View All
                        </a>
                    </div>

                    <div class="overflow-x-auto">
                        <table class="min-w-full bg-white">
                            <thead>
                                <tr style="background-color: #111827;" class="text-white">
                                    <th class="py-3 px-6 text-left text-sm">Booking ID</th>
                                    <th class="py-3 px-6 text-left text-sm">Customer</th>
                                    <th class="py-3 px-6 text-left text-sm">Car</th>
                                    <th class="py-3 px-6 text-left text-sm">Pickup Location</th>
                                    <th class="py-3 px-6 text-left text-sm">Destination</th>
                                    <th class="py-3 px-6 text-left text-sm">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                                        String query = "SELECT Bookings.*, Customers.FullName AS CustomerName, Cars.CarModel FROM Bookings "
                                                + "LEFT JOIN Customers ON Bookings.CustomerID = Customers.CustomerID "
                                                + "LEFT JOIN Cars ON Bookings.CarID = Cars.CarID "
                                                + "ORDER BY BookingDate DESC LIMIT 5";
                                        stmt = conn.prepareStatement(query);
                                        rs = stmt.executeQuery();

                                        while (rs.next()) {
                                %>
                                <tr class="border-b">
                                    <td class="py-3 px-6 text-sm"><%= rs.getInt("BookingID")%></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("CustomerName")%></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("CarModel")%></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("PickupLocation")%></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("Destination")%></td>
                                    <td class="py-3 px-6 text-sm"><span class="px-2 py-1 rounded-full 
                                                                        <%= rs.getString("Status").equals("Pending") ? "bg-yellow-100 text-yellow-800"
                                                : rs.getString("Status").equals("Completed") ? "bg-green-100 text-green-800"
                                                : "bg-red-100 text-red-800"%>">
                                            <%= rs.getString("Status")%>
                                        </span></td>
                                </tr>
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        if (rs != null) {
                                            rs.close();
                                        }
                                        if (stmt != null) {
                                            stmt.close();
                                        }
                                        if (conn != null) {
                                            conn.close();
                                        }
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