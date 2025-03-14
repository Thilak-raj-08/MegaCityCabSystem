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
            <li class="mb-1 group active">
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
            <li class="mb-1 group ">
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
                <li class="text-gray-600 mr-2 font-medium">Cars</li>
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
                    <div class="font-medium text-xl">Car List</div>
                    <button onclick="toggleModal('add')" class="bg-gray-900 text-white px-4 py-2 rounded text-sm hover:bg-gray-800 transition-colors">
                        Add New Car
                    </button>
                </div>
                <div class="overflow-x-auto">
                    <table class="min-w-full bg-white">
                        <thead>
                            <tr style="background-color: #111827;" class="text-white">
                                <th class="py-3 px-6 text-left text-sm">Car ID</th>
                                <th class="py-3 px-6 text-left text-sm">Model</th>
                                <th class="py-3 px-6 text-left text-sm">Car Number</th>
                                <th class="py-3 px-6 text-left text-sm">Type</th>
                                <th class="py-3 px-6 text-left text-sm">Driver</th>
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
                                    String query = "SELECT Cars.*, Drivers.FullName AS DriverName FROM Cars LEFT JOIN Drivers ON Cars.DriverID = Drivers.DriverID";
                                    stmt = conn.prepareStatement(query);
                                    rs = stmt.executeQuery();

                                    while (rs.next()) {
                            %>
                            <tr class="border-b">
                                <td class="py-3 px-6 text-sm"><%= rs.getInt("CarID") %></td>
                                <td class="py-3 px-6 text-sm"><%= rs.getString("CarModel") %></td>
                                <td class="py-3 px-6 text-sm"><%= rs.getString("CarNumber") %></td>
                                <td class="py-3 px-6 text-sm"><%= rs.getString("CarType") %></td>
                                <td class="py-3 px-6 text-sm"><%= rs.getString("DriverName") != null ? rs.getString("DriverName") : "Unassigned" %></td>
                                <td class="py-3 px-6 text-sm"> <span class="px-3 py-1 rounded-full text-sm font-medium 
                                              <%= rs.getString("Status").equals("Available") ? "bg-green-100 text-green-800"
                : rs.getString("Status").equals("Booked") ? "bg-red-100 text-red-800"
                : rs.getString("Status").equals("Maintenance") ? "bg-yellow-100 text-yellow-800" : ""%>">
                                            <%= rs.getString("Status")%>
                                        </span></td>
                                <td class="py-3 px-6 text-2xl">
                                    <i class="ri-edit-box-line hover:text-gray-600 cursor-pointer" onclick="editCar('<%= rs.getInt("CarID") %>', '<%= rs.getString("CarModel") %>', '<%= rs.getString("CarNumber") %>', '<%= rs.getString("CarType") %>', '<%= rs.getInt("DriverID") %>', '<%= rs.getString("Status") %>')"></i>
                                    <i class="ri-delete-bin-line text-red-600 hover:text-red-800 cursor-pointer ml-2" onclick="deleteCar('<%= rs.getInt("CarID") %>')"></i>
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

    <!-- Car Modal -->
    <div id="carModal" class="hidden fixed inset-0 z-50 overflow-y-auto">
        <div class="fixed inset-0 bg-black/50 backdrop-blur-sm"></div>
        <div class="flex min-h-screen items-center justify-center p-4">
            <div class="relative w-full max-w-2xl bg-white rounded-lg shadow-xl">
                <div class="flex items-center justify-between p-4 border-b border-gray-200">
                    <h3 class="text-xl font-semibold text-gray-900" id="modalTitle">New Car</h3>
                    <button onclick="toggleModal('close')" class="text-gray-400 hover:text-gray-600">
                        <i class="ri-close-line text-2xl"></i>
                    </button>
                </div>

                <form method="POST" action="AdminCarServlet" class="p-6 space-y-6">
                    <input type="hidden" name="action" id="action" value="add">
                    <input type="hidden" name="carId" id="carId">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <!-- Car Model -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="ri-car-line mr-2"></i>Car Model
                            </label>
                            <input type="text" name="carModel" id="carModel" required
                                   class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                        </div>

                        <!-- Car Number -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="ri-number-1 mr-2"></i>Car Number
                            </label>
                            <input type="text" name="carNumber" id="carNumber" required
                                   class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                        </div>

                        <!-- Car Type -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="ri-caravan-line mr-2"></i>Car Type
                            </label>
                            <select name="carType" id="carType" required
                                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                                <option value="Standard">Standard</option>
                                <option value="Premium">Premium</option>
                                <option value="SUV">SUV</option>
                            </select>
                        </div>

                        <!-- Driver -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="ri-steering-2-line mr-2"></i>Driver
                            </label>
                            <select name="driverId" id="driverId"
                                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                                <option value="">Unassigned</option>
                                <%
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                                        String driverQuery = "SELECT DriverID, FullName FROM Drivers";
                                        stmt = conn.prepareStatement(driverQuery);
                                        rs = stmt.executeQuery();

                                        while (rs.next()) {
                                %>
                                <option value="<%= rs.getInt("DriverID") %>"><%= rs.getString("FullName") %></option>
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

                        <!-- Status -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="ri-checkbox-circle-line mr-2"></i>Status
                            </label>
                            <select name="status" id="status" required
                                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                                <option value="Available">Available</option>
                                <option value="Booked">Booked</option>
                                <option value="Maintenance">Maintenance</option>
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
                            Save Car
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function toggleModal(action) {
            const modal = document.getElementById('carModal');
            if (action === 'close') {
                modal.classList.add('hidden');
            } else {
                modal.classList.toggle('hidden');
                if (action === 'add') {
                    document.getElementById('modalTitle').innerText = 'New Car';
                    document.getElementById('action').value = 'add';
                    document.getElementById('carId').value = '';
                    document.getElementById('carModel').value = '';
                    document.getElementById('carNumber').value = '';
                    document.getElementById('carType').value = 'Standard';
                    document.getElementById('driverId').value = '';
                    document.getElementById('status').value = 'Available';
                }
            }
        }

        function editCar(carId, carModel, carNumber, carType, driverId, status) {
            toggleModal('edit');
            document.getElementById('carId').value = carId;
            document.getElementById('carModel').value = carModel;
            document.getElementById('carNumber').value = carNumber;
            document.getElementById('carType').value = carType;
            document.getElementById('driverId').value = driverId;
            document.getElementById('status').value = status;
            document.getElementById('modalTitle').innerText = 'Edit Car';
            document.getElementById('action').value = 'edit';
        }

        function deleteCar(carId) {
            if (confirm('Are you sure you want to delete this car?')) {
                window.location.href = 'AdminCarServlet?action=delete&carId=' + carId;
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