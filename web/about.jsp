<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mega City Cab</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
                    <a href="about.jsp" class="text-black bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">About Us</a>
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
            <div id="mobile-menu" class="hidden md:hidden bg-gray-50">
                <nav class="flex flex-col space-y-4 px-6 py-4">
                    <a href="index.jsp" class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">Home</a>
                    <a href="bookacab.jsp" class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">Book a Cab</a>
                    <a href="viewbookings.jsp" class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">View Bookings</a>
                    <a href="about.jsp" class="text-blue-950 bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">About Us</a>
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
                <h1 class="text-4xl md:text-5xl font-bold mb-4">About Mega City Cab</h1>
                <!-- Subtext -->
                <p class="text-lg md:text-xl mb-8 max-w-2xl">Your trusted partner for safe, reliable, and affordable transportation in Colombo.</p>
            </div>
        </section>

        <!-- About Section -->
        <section class="py-16 bg-gray-100">
            <div class="container mx-auto px-6 max-w-5xl">
                <h2 class="text-3xl font-semibold text-center text-gray-800 mb-8">Our Story</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-10">
                    <!-- Left Side: Image -->
                    <div class="flex justify-center">
                        <img src="Images/2.png" alt="About Us" class="w-full max-w-md rounded-lg shadow-lg">
                    </div>
                    <!-- Right Side: Text Content -->
                    <div class="space-y-6">
                        <p class="text-lg text-gray-700">
                            Mega City Cab was founded in 2020 with a mission to revolutionize urban transportation in Colombo. We started with a small fleet of vehicles and a big dream: to provide fast, reliable, and affordable cab services to everyone in the city.
                        </p>
                        <p class="text-lg text-gray-700">
                            Over the years, we've grown into one of the most trusted cab services in Colombo, serving thousands of satisfied customers every month. Our commitment to safety, punctuality, and customer satisfaction has made us a favorite among locals and tourists alike.
                        </p>
                        <p class="text-lg text-gray-700">
                            We believe in making transportation hassle-free and accessible to all. Whether you're commuting to work, heading to the airport, or exploring the city, Mega City Cab is here to ensure you reach your destination comfortably and on time.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Mission and Vision Section -->
        <section class="py-16 bg-white">
            <div class="container mx-auto px-6 max-w-5xl">
                <h2 class="text-3xl font-semibold text-center text-gray-800 mb-8">Our Mission & Vision</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-10">
                    <!-- Mission -->
                    <div class="bg-gray-50 p-8 rounded-lg shadow-lg">
                        <h3 class="text-2xl font-semibold text-gray-800 mb-4">Our Mission</h3>
                        <p class="text-lg text-gray-700">
                            To provide safe, reliable, and affordable transportation solutions that enhance the quality of life for our customers and contribute to the sustainable development of Colombo.
                        </p>
                    </div>
                    <!-- Vision -->
                    <div class="bg-gray-50 p-8 rounded-lg shadow-lg">
                        <h3 class="text-2xl font-semibold text-gray-800 mb-4">Our Vision</h3>
                        <p class="text-lg text-gray-700">
                            To become the leading cab service provider in Sri Lanka, known for our exceptional customer service, innovative technology, and commitment to sustainability.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Team Section -->
        <section class="py-16 bg-gray-100">
            <div class="container mx-auto px-6 max-w-5xl">
                <h2 class="text-3xl font-semibold text-center text-gray-800 mb-8">Meet Our Team</h2>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <!-- Team Member 1 -->
                    <div class="bg-white p-6 rounded-lg shadow-lg text-center">
                        <img src="https://randomuser.me/api/portraits/men/1.jpg" alt="John Doe" class="w-32 h-32 mx-auto mb-4 rounded-full">
                        <h3 class="text-xl font-semibold text-gray-800 mb-2">John Doe</h3>
                        <p class="text-gray-600">CEO & Founder</p>
                        <p class="mt-4 text-sm text-gray-500">John is passionate about transforming urban transportation and ensuring customer satisfaction.</p>
                    </div>
                    <!-- Team Member 2 -->
                    <div class="bg-white p-6 rounded-lg shadow-lg text-center">
                        <img src="https://randomuser.me/api/portraits/women/2.jpg" alt="Jane Smith" class="w-32 h-32 mx-auto mb-4 rounded-full">
                        <h3 class="text-xl font-semibold text-gray-800 mb-2">Jane Smith</h3>
                        <p class="text-gray-600">Operations Manager</p>
                        <p class="mt-4 text-sm text-gray-500">Jane oversees daily operations and ensures our services run smoothly.</p>
                    </div>
                    <!-- Team Member 3 -->
                    <div class="bg-white p-6 rounded-lg shadow-lg text-center">
                        <img src="https://randomuser.me/api/portraits/men/3.jpg" alt="David Lee" class="w-32 h-32 mx-auto mb-4 rounded-full">
                        <h3 class="text-xl font-semibold text-gray-800 mb-2">David Lee</h3>
                        <p class="text-gray-600">Customer Support Lead</p>
                        <p class="mt-4 text-sm text-gray-500">David is dedicated to providing exceptional support to our customers.</p>
                    </div>
                </div>
            </div>
        </section>

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