<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Bookings</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <style>
            /* Custom CSS for responsive and scrollable table */
            .table-container {
                overflow-x: auto;
                white-space: nowrap;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .table-container table {
                width: 100%;
                border-collapse: collapse;
            }
            .table-container th,
            .table-container td {
                padding: 12px 16px;
                text-align: left;
                border-bottom: 1px solid #e2e8f0;
            }
            .table-container th {
                background-color: #f7fafc;
                font-weight: 600;
                color: #4a5568;
            }
            .table-container tr:hover {
                background-color: #f7fafc;
            }
            .table-container a {
                margin-right: 8px;
            }
            @media (max-width: 768px) {
                .table-container {
                    border: 1px solid #e2e8f0;
                }
            }
        </style>
    </head>
    <body class="bg-gray-100">
        <!-- Header Section -->
        <header class="shadow-md fixed top-0 left-0 w-full z-50 bg-gradient-to-r from-blue-950 to-teal-800">
            <div class="container mx-auto px-6 py-4 flex justify-between items-center">
                <!-- Logo -->
                <div class="flex items-center ">
                    <span class="text-xl font-bold text-white">Mega City Cab</span>
                </div>

                <!-- Navigation Menu -->
                <nav class="hidden md:flex space-x-4">
                    <a href="index.jsp" class="text-white hover:bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">Home</a>
                    <a href="bookacab.jsp" class="text-white hover:bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">Book a Cab</a>
                    <a href="viewbookings.jsp" class="text-black bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">View Bookings</a>
                    <a href="about.jsp" class="text-white hover:bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">About Us</a>
                    <a href="contact.jsp" class="text-white hover:bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">Contact</a>
                </nav>

                <!-- Call-to-Action Buttons (Desktop) -->
                <div class="hidden md:flex items-center space-x-4">
                    <%-- Check if the user is logged in --%>
                    <%
                        String userName = (session != null) ? (String) session.getAttribute("userName") : null;
                    %>
                    <% if (userName != null) {%>
                    <div class="flex items-center space-x-2 bg-white/10 px-4 py-2 rounded-lg shadow-md text-white">
                        <i class="fa-regular fa-user"></i>
                        <h1 class="text-sm font-semibold"><%= userName%></h1>
                    </div>
                    <a href="logout.jsp" class="flex items-center px-6 py-2 bg-yellow-500 text-white rounded-full text-sm">
                        <i class="fa-solid fa-arrow-right-from-bracket"></i>
                    </a>
                    <% } else { %>
                    <a href="login.jsp" class="px-8 py-3 bg-transparent border-2 border-white text-white rounded-full text-sm shadow-lg transform hover:scale-110 hover:bg-white hover:text-blue-950 transition-all duration-300">Login / Register</a>
                    <% } %>
                </div>

                <!-- Mobile Menu Button -->
                <button id="mobile-menu-btn" class="md:hidden text-white focus:outline-none">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7" />
                    </svg>
                </button>
            </div>

            <!-- Mobile Navigation Menu -->
            <div id="mobile-menu" class="hidden bg-gray-50 md:hidden">
                <nav class="flex flex-col space-y-4 px-6 py-4">
                    <a href="index.jsp" class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">Home</a>
                    <a href="bookacab.jsp" class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">Book a Cab</a>
                    <a href="viewbookings.jsp" class="text-blue-950 bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">View Bookings</a>
                    <a href="about.jsp" class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">About Us</a>
                    <a href="contact.jsp" class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">Contact</a>
                </nav>

                <!-- Call-to-Action Buttons (Mobile) -->
                <div class="flex flex-col space-y-4 px-6 py-4">
                    <% if (userName != null) {%>
                    <div class="flex items-center space-x-2 bg-white/10 px-4 py-2 rounded-lg shadow-md text-black">
                        <i class="fa-regular fa-user"></i>
                        <h1 class="text-sm font-semibold"><%= userName%></h1>
                    </div>
                    <a href="logout.jsp" class="flex items-center px-6 py-2 bg-yellow-500 text-white rounded-full text-sm">
                        <i class="fa-solid fa-arrow-right-from-bracket"></i>
                    </a>
                    <% } else { %>
                    <a href="login.jsp" class="px-8 py-3 bg-transparent border-2 border-white text-black rounded-full text-sm shadow-lg transform hover:scale-110 hover:bg-white hover:text-blue-950 transition-all duration-300">Login / Register</a>
                    <% }%>
                </div>
            </div>
        </header>

        <!-- Hero Section -->
        <section class="bg-gradient-to-r from-blue-950 to-teal-800 text-white">
            <div class="container mx-auto px-4 py-20 flex flex-col items-center text-center">
                <br><br>
                <!-- Main Heading -->
                <h1 class="text-4xl md:text-5xl font-bold mb-4">Your Bookings</h1>
                <!-- Subtext -->
                <p class="text-lg md:text-xl mb-8 max-w-2xl">View and manage all your cab bookings in one place.</p>
            </div>
        </section>

        <!-- Main Content -->
        <div class="container mx-auto px-4 py-20">
            <div class="bg-white p-6 rounded-lg shadow-md">
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Booking ID</th>
                                <th>Pickup Location</th>
                                <th>Destination</th>
                                <th>Distance (KM)</th>
                                <th>Fare (Rs.)</th>
                                <th>Booking Date</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                // Retrieve customerId as an Integer
                                Integer customerId = (Integer) session.getAttribute("customerId");
                                boolean hasBookings = false; // Flag to check if bookings exist

                                if (customerId != null) {
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mega_city_cab", "root", "root");
                                        String query = "SELECT * FROM Bookings WHERE CustomerID = ?";
                                        PreparedStatement stmt = conn.prepareStatement(query);
                                        stmt.setInt(1, customerId); // Use the Integer directly
                                        ResultSet rs = stmt.executeQuery();

                                        // Check if there are any bookings
                                        if (!rs.isBeforeFirst()) {
                                            // No bookings found
                            %>
                            <tr>
                                <td colspan="8" class="text-center py-4 text-gray-600">No bookings available.</td>
                            </tr>
                            <%
                            } else {
                                // Bookings found
                                hasBookings = true;
                                while (rs.next()) {
                            %>
                            <tr>
                                <td><%= rs.getInt("BookingID")%></td>
                                <td><%= rs.getString("PickupLocation")%></td>
                                <td><%= rs.getString("Destination")%></td>
                                <td><%= rs.getDouble("DistanceKM")%></td>
                                <td><%= rs.getDouble("Fare")%></td>
                                <td><%= rs.getTimestamp("BookingDate")%></td>
                                <td><span class="px-2 py-1 rounded-full 
                                        <%= rs.getString("Status").equals("Pending") ? "bg-yellow-100 text-yellow-800" : 
                                           rs.getString("Status").equals("Completed") ? "bg-green-100 text-green-800" : 
                                           "bg-red-100 text-red-800" %>">
                                        <%= rs.getString("Status") %>
                                    </span></td>
                                <td>
                                    <a href="makePayment.jsp?bookingId=<%= rs.getInt("BookingID")%>" class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600">Pay Now</a>
                                    <a href="${pageContext.request.contextPath}/CancelBookingServlet?bookingId=<%= rs.getInt("BookingID")%>" class="bg-red-500 text-white px-4 py-2 rounded-md hover:bg-red-600">Cancel Booking</a>
                                </td>
                            </tr>
                            <%
                                        }
                                    }
                                    rs.close();
                                    stmt.close();
                                    conn.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            } else {
                                // If customerId is null (user not logged in)
                            %>
                            <tr>
                                <td colspan="8" class="text-center py-4 text-gray-600">Please log in to view your bookings.</td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <footer class="text-white py-12 bg-gradient-to-r from-blue-950 to-teal-800">
            <div class="container mx-auto px-6 max-w-screen-lg">
                <!-- Quick Links, Contact Info, Social Media -->
                <div class="flex flex-wrap justify-between gap-y-8 mb-8">
                    <!-- Quick Links -->
                    <div class="w-full md:w-1/4">
                        <h3 class="text-2xl font-semibold mb-4">Quick Links</h3>
                        <ul class="space-y-3">
                            <li><a href="index.jsp" class="text-gray-300 hover:text-yellow-500 transition duration-300">Home</a></li>
                            <li><a href="bookacab.jsp" class="text-gray-300 hover:text-yellow-500 transition duration-300">Book a Cab</a></li>
                            <li><a href="about.jsp" class="text-gray-300 hover:text-yellow-500 transition duration-300">About Us</a></li>
                            <li><a href="contact.jsp" class="text-gray-300 hover:text-yellow-500 transition duration-300">Contact</a></li>
                        </ul>
                    </div>

                    <!-- Contact Information -->
                    <div class="w-full md:w-1/4">
                        <h3 class="text-2xl font-semibold mb-4">Contact Info</h3>
                        <ul class="space-y-3">
                            <li>
                                <a href="tel:+94123456789" class="text-gray-300 hover:text-yellow-500 transition duration-300 flex items-center">
                                    <i class="fas fa-phone-alt mr-2"></i> +94 123 456 789
                                </a>
                            </li>
                            <li>
                                <a href="mailto:info@megacitycab.com" class="text-gray-300 hover:text-yellow-500 transition duration-300 flex items-center">
                                    <i class="fas fa-envelope mr-2"></i> info@megacitycab.com
                                </a>
                            </li>
                            <li>
                                <a href="https://www.google.com/maps?q=123+Colombo+Street" class="text-gray-300 hover:text-yellow-500 transition duration-300 flex items-center">
                                    <i class="fas fa-map-marker-alt mr-2"></i> 123 Colombo Street, Sri Lanka
                                </a>
                            </li>
                        </ul>
                    </div>

                    <!-- Social Media -->
                    <div class="w-full md:w-1/4">
                        <h3 class="text-2xl font-semibold mb-4">Follow Us</h3>
                        <div class="flex space-x-4">
                            <a href="https://facebook.com" target="_blank" class="text-gray-300 hover:text-yellow-500 transition duration-300">
                                <i class="fab fa-facebook-f text-2xl"></i>
                            </a>
                            <a href="https://instagram.com" target="_blank" class="text-gray-300 hover:text-yellow-500 transition duration-300">
                                <i class="fab fa-instagram text-2xl"></i>
                            </a>
                            <a href="https://twitter.com" target="_blank" class="text-gray-300 hover:text-yellow-500 transition duration-300">
                                <i class="fab fa-twitter text-2xl"></i>
                            </a>
                            <a href="https://linkedin.com" target="_blank" class="text-gray-300 hover:text-yellow-500 transition duration-300">
                                <i class="fab fa-linkedin-in text-2xl"></i>
                            </a>
                        </div>
                    </div>

                    <!-- Newsletter Subscription -->
                    <div class="w-full md:w-1/4">
                        <h3 class="text-2xl font-semibold mb-4">Subscribe</h3>
                        <p class="text-gray-300 mb-4">Get the latest updates and offers directly in your inbox.</p>
                        <form class="flex flex-col space-y-3">
                            <input type="email" placeholder="Your email" class="p-2 rounded-md bg-gray-700 text-white focus:outline-none focus:ring-2 focus:ring-yellow-500">
                            <button type="submit" class="bg-yellow-500 text-blue-950 py-2 px-4 rounded-md font-semibold hover:bg-yellow-600 transition duration-300">
                                Subscribe
                            </button>
                        </form>
                    </div>
                </div>

                <!-- Copyright Section -->
                <div class="text-center text-white mt-8 border-t border-gray-700 pt-6">
                    <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
                </div>
            </div>
        </footer>
        <script src="Js/Main.js"></script>
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
    </body>
</html>