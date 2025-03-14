<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
    if (username == null) {
        response.sendRedirect("admin.jsp?error=Please login first");
        return;
    }
%><!DOCTYPE html>
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
            <li class="mb-1 group">
                <a href="adminDashboard.jsp"
                   class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100">
                    <i class="ri-home-2-line mr-3 text-lg"></i>
                    <span class="text-sm">Home</span>
                </a>
            </li>
            <li class="mb-1 group active">
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
                <li class="text-gray-600 mr-2 font-medium">Bookings</li>
            </ul>

            <!-- Update the welcome message to display the username -->
                <ul class="ml-auto flex items-center text-sm">
                    <li class="mr-2 text-gray-600 font-sm">
                         <%= username%>
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
            <div class="bg-white border border-gray-100 shadow-md shadow-black/5 p-6 rounded-md">
                <div class="flex justify-between mb-4 items-start">
                    <div class="font-medium text-xl">Booking List</div>
                    <button onclick="toggleModal('add')" class="bg-gray-900 text-white px-4 py-2 rounded text-sm hover:bg-gray-800 transition-colors">
                        Add New Booking
                    </button>
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
                                <th class="py-3 px-6 text-left text-sm">Distance (KM)</th>
                                <th class="py-3 px-6 text-left text-sm">Fare</th>
                                <th class="py-3 px-6 text-left text-sm">Status</th>
                                <th class="py-3 px-6 text-left text-sm">Actions</th>
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
                                    String query = "SELECT Bookings.*, Customers.FullName AS CustomerName, Cars.CarModel FROM Bookings " +
                                                  "LEFT JOIN Customers ON Bookings.CustomerID = Customers.CustomerID " +
                                                  "LEFT JOIN Cars ON Bookings.CarID = Cars.CarID";
                                    stmt = conn.prepareStatement(query);
                                    rs = stmt.executeQuery();

                                    while (rs.next()) {
                            %>
                            <tr class="border-b">
                                <td class="py-3 px-6 text-sm"><%= rs.getInt("BookingID") %></td>
                                <td class="py-3 px-6 text-sm"><%= rs.getString("CustomerName") %></td>
                                <td class="py-3 px-6 text-sm"><%= rs.getString("CarModel") %></td>
                                <td class="py-3 px-6 text-sm"><%= rs.getString("PickupLocation") %></td>
                                <td class="py-3 px-6 text-sm"><%= rs.getString("Destination") %></td>
                                <td class="py-3 px-6 text-sm"><%= rs.getDouble("DistanceKM") %></td>
                                <td class="py-3 px-6 text-sm"><%= rs.getDouble("Fare") %></td>
                                <td class="py-3 px-6 text-sm"><span class="px-2 py-1 text-sm rounded-full 
                                        <%= rs.getString("Status").equals("Pending") ? "bg-yellow-100 text-yellow-800" : 
                                           rs.getString("Status").equals("Completed") ? "bg-green-100 text-green-800" : 
                                           "bg-red-100 text-red-800" %>">
                                        <%= rs.getString("Status") %>
                                    </span></td>
                                <td class="py-3 px-6 text-2xl">
                                    <i class="ri-edit-box-line hover:text-gray-600 cursor-pointer" onclick="editBooking('<%= rs.getInt("BookingID") %>', '<%= rs.getInt("CustomerID") %>', '<%= rs.getInt("CarID") %>', '<%= rs.getString("PickupLocation") %>', '<%= rs.getString("Destination") %>', '<%= rs.getDouble("DistanceKM") %>', '<%= rs.getDouble("Fare") %>', '<%= rs.getString("Status") %>')"></i>
                                    <i class="ri-delete-bin-line text-red-600 hover:text-red-800 cursor-pointer ml-2" onclick="deleteBooking('<%= rs.getInt("BookingID") %>')"></i>
                                </td>
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

    <!-- Booking Modal -->
    <div id="bookingModal" class="hidden fixed inset-0 z-50 overflow-y-auto">
        <div class="fixed inset-0 bg-black/50 backdrop-blur-sm"></div>
        <div class="flex min-h-screen items-center justify-center p-4">
            <div class="relative w-full max-w-2xl bg-white rounded-lg shadow-xl">
                <div class="flex items-center justify-between p-4 border-b border-gray-200">
                    <h3 class="text-xl font-semibold text-gray-900" id="modalTitle">New Booking</h3>
                    <button onclick="toggleModal('close')" class="text-gray-400 hover:text-gray-600">
                        <i class="ri-close-line text-2xl"></i>
                    </button>
                </div>

                <form method="POST" action="AdminBookingsServlet" class="p-6 space-y-6">
                    <input type="hidden" name="action" id="action" value="add">
                    <input type="hidden" name="bookingId" id="bookingId">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <!-- Customer -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="ri-user-line mr-2"></i>Customer
                            </label>
                            <select name="customerId" id="customerId" required
                                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                                <option value="">Select Customer</option>
                                <%
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                                        String customerQuery = "SELECT CustomerID, FullName FROM Customers";
                                        stmt = conn.prepareStatement(customerQuery);
                                        rs = stmt.executeQuery();

                                        while (rs.next()) {
                                %>
                                <option value="<%= rs.getInt("CustomerID") %>"><%= rs.getString("FullName") %></option>
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
                            </select>
                        </div>

                        <!-- Car -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="ri-car-line mr-2"></i>Car
                            </label>
                            <select name="carId" id="carId" required
                                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                                <option value="">Select Car</option>
                                <%
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                                        String carQuery = "SELECT CarID, CarModel FROM Cars";
                                        stmt = conn.prepareStatement(carQuery);
                                        rs = stmt.executeQuery();

                                        while (rs.next()) {
                                %>
                                <option value="<%= rs.getInt("CarID") %>"><%= rs.getString("CarModel") %></option>
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
                            </select>
                        </div>

                        <!-- Pickup Location -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="ri-map-pin-line mr-2"></i>Pickup Location
                            </label>
                            <input type="text" name="pickupLocation" id="pickupLocation" required
                                   class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                        </div>

                        <!-- Destination -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="ri-map-pin-line mr-2"></i>Destination
                            </label>
                            <input type="text" name="destination" id="destination" required
                                   class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                        </div>

                        <!-- Distance (KM) -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="ri-roadster-line mr-2"></i>Distance (KM)
                            </label>
                            <input type="number" step="0.01" name="distanceKM" id="distanceKM" required
                                   class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                        </div>

                        <!-- Fare -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="ri-money-dollar-circle-line mr-2"></i>Fare
                            </label>
                            <input type="number" step="0.01" name="fare" id="fare" required
                                   class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                        </div>

                        <!-- Status -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="ri-checkbox-circle-line mr-2"></i>Status
                            </label>
                            <select name="status" id="status" required
                                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                                <option value="Pending">Pending</option>
                                <option value="Completed">Completed</option>
                                <option value="Cancelled">Cancelled</option>
                            </select>
                        </div>
                    </div>

                    <div class="flex justify-end space-x-3 border-t border-gray-200 pt-6">
                        <button type="button" onclick="toggleModal('close')"
                                class="px-4 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-md">
                            Cancel
                        </button>
                        <button type="submit"
                                class="px-4 py-2 text-white bg-gray-900 hover:bg-gray-800 rounded-md">
                            Save Booking
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function toggleModal(action) {
            const modal = document.getElementById('bookingModal');
            if (action === 'close') {
                modal.classList.add('hidden');
            } else {
                modal.classList.toggle('hidden');
                if (action === 'add') {
                    document.getElementById('modalTitle').innerText = 'New Booking';
                    document.getElementById('action').value = 'add';
                    document.getElementById('bookingId').value = '';
                    document.getElementById('customerId').value = '';
                    document.getElementById('carId').value = '';
                    document.getElementById('pickupLocation').value = '';
                    document.getElementById('destination').value = '';
                    document.getElementById('distanceKM').value = '';
                    document.getElementById('fare').value = '';
                    document.getElementById('status').value = 'Pending';
                }
            }
        }

        function editBooking(bookingId, customerId, carId, pickupLocation, destination, distanceKM, fare, status) {
            toggleModal('edit');
            document.getElementById('bookingId').value = bookingId;
            document.getElementById('customerId').value = customerId;
            document.getElementById('carId').value = carId;
            document.getElementById('pickupLocation').value = pickupLocation;
            document.getElementById('destination').value = destination;
            document.getElementById('distanceKM').value = distanceKM;
            document.getElementById('fare').value = fare;
            document.getElementById('status').value = status;
            document.getElementById('modalTitle').innerText = 'Edit Booking';
            document.getElementById('action').value = 'edit';
        }

        function deleteBooking(bookingId) {
            if (confirm('Are you sure you want to delete this booking?')) {
                window.location.href = 'AdminBookingsServlet?action=delete&bookingId=' + bookingId;
            }
        }
    </script>

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
            from { transform: translateX(100%); }
            to { transform: translateX(0); }
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