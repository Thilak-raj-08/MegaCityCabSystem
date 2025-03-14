<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Us - Mega City Cab</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    </head>

    <body>
        <!-- Header Section -->
        <header class="shadow-md fixed top-0 left-0 w-full z-50 bg-gradient-to-r from-blue-950 to-teal-800">
            <div class="container mx-auto px-6 py-4 flex justify-between items-center">
                <!-- Logo -->
                <div class="flex items-center">
                    <span class="text-xl font-bold text-white">Mega City Cab</span>
                </div>

                <!-- Navigation Menu -->
                <nav class="hidden md:flex space-x-4">
                    <a href="index.jsp" class="text-white hover:bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">Home</a>
                    <a href="bookacab.jsp" class="text-white hover:bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">Book a Cab</a>
                    <a href="viewbookings.jsp" class="text-white hover:bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">View Bookings</a>
                    <a href="about.jsp" class="text-white hover:bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">About Us</a>
                    <a href="contact.jsp" class="text-black bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">Contact</a>
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
            <div id="mobile-menu" class="hidden md:hidden bg-gray-50">
                <nav class="flex flex-col space-y-4 px-6 py-4">
                    <a href="index.jsp" class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">Home</a>
                    <a href="bookacab.jsp" class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">Book a Cab</a>
                    <a href="viewbookings.jsp" class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">View Bookings</a>
                    <a href="about.jsp" class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">About Us</a>
                    <a href="contact.jsp" class="text-blue-950 bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">Contact</a>
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
                <h1 class="text-4xl md:text-5xl font-bold mb-4">Contact Us</h1>
                <!-- Subtext -->
                <p class="text-lg md:text-xl mb-8 max-w-2xl">We're here to help! Reach out to us for any queries or support.</p>
            </div>
        </section>


        <!-- Contact Section -->
        <section class="py-16 bg-gray-100">
            <div class="container mx-auto px-6 max-w-5xl">
                <h2 class="text-3xl font-semibold text-center text-gray-800 mb-8">Get in Touch</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-10">
                    <!-- Contact Form -->
                    <div class="bg-white p-8 rounded-lg shadow-lg">
                        <h3 class="text-2xl font-semibold text-gray-800 mb-6">Send Us a Message</h3>
                        <form class="space-y-6" action="ContactServlet" method="POST">
                            <!-- Name -->
                            <div>
                                <label for="name" class="block text-sm font-medium text-gray-700">Your Name</label>
                                <input type="text" id="name" name="name" required class="mt-2 w-full px-4 py-2 border rounded-md focus:ring-blue-500 focus:border-blue-500" placeholder="Enter your name">
                            </div>
                            <!-- Email -->
                            <div>
                                <label for="email" class="block text-sm font-medium text-gray-700">Your Email</label>
                                <input type="email" id="email" name="email" required class="mt-2 w-full px-4 py-2 border rounded-md focus:ring-blue-500 focus:border-blue-500" placeholder="Enter your email">
                            </div>
                            <!-- Phone -->
                            <div>
                                <label for="phone" class="block text-sm font-medium text-gray-700">Your Phone</label>
                                <input type="tel" id="phone" name="phone" required class="mt-2 w-full px-4 py-2 border rounded-md focus:ring-blue-500 focus:border-blue-500" placeholder="Enter your phone number">
                            </div>
                            <!-- Message -->
                            <div>
                                <label for="message" class="block text-sm font-medium text-gray-700">Your Message</label>
                                <textarea id="message" name="message" rows="1" required class="mt-2 w-full px-4 py-2 border rounded-md focus:ring-blue-500 focus:border-blue-500" placeholder="Enter your message"></textarea>
                            </div>
                            <!-- Submit Button -->
                            <div class="text-center">
                                <button type="submit" class="bg-yellow-500 text-white py-3 px-8 rounded-lg text-xl font-semibold transition duration-300 hover:bg-yellow-600">Send Message</button>
                            </div>
                        </form>
                    </div>

                    <!-- Contact Information -->
                    <div class="bg-white p-8 rounded-lg shadow-lg">
                        <h3 class="text-2xl font-semibold text-gray-800 mb-6">Contact Information</h3>
                        <div class="space-y-6">
                            <!-- Address -->
                            <div class="flex items-start space-x-4">
                                <div class="text-blue-600 text-2xl">
                                    <i class="ri-map-pin-line"></i>
                                </div>
                                <div>
                                    <h4 class="text-lg font-semibold text-gray-800">Address</h4>
                                    <p class="text-gray-600">123 Colombo Street, Colombo, Sri Lanka</p>
                                </div>
                            </div>
                            <!-- Phone -->
                            <div class="flex items-start space-x-4">
                                <div class="text-blue-600 text-2xl">
                                    <i class="ri-phone-line"></i>
                                </div>
                                <div>
                                    <h4 class="text-lg font-semibold text-gray-800">Phone</h4>
                                    <p class="text-gray-600">+94 123 456 789</p>
                                </div>
                            </div>
                            <!-- Email -->
                            <div class="flex items-start space-x-4">
                                <div class="text-blue-600 text-2xl">
                                    <i class="ri-mail-line"></i>
                                </div>
                                <div>
                                    <h4 class="text-lg font-semibold text-gray-800">Email</h4>
                                    <p class="text-gray-600">info@megacitycab.com</p>
                                </div>
                            </div>
                            <!-- Social Media -->
                            <div class="flex items-start space-x-4">
                                <div class="text-blue-600 text-2xl">
                                    <i class="ri-share-line"></i>
                                </div>
                                <div>
                                    <h4 class="text-lg font-semibold text-gray-800">Follow Us</h4>
                                    <div class="flex space-x-4 mt-2">
                                        <a href="https://facebook.com" target="_blank" class="text-gray-600 hover:text-blue-600">
                                            <i class="ri-facebook-fill text-2xl"></i>
                                        </a>
                                        <a href="https://instagram.com" target="_blank" class="text-gray-600 hover:text-blue-600">
                                            <i class="ri-instagram-line text-2xl"></i>
                                        </a>
                                        <a href="https://twitter.com" target="_blank" class="text-gray-600 hover:text-blue-600">
                                            <i class="ri-twitter-fill text-2xl"></i>
                                        </a>
                                        <a href="https://linkedin.com" target="_blank" class="text-gray-600 hover:text-blue-600">
                                            <i class="ri-linkedin-fill text-2xl"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer Section -->
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
    </body>

</html>

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