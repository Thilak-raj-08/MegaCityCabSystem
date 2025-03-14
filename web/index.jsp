<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mega City Cab</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    </head>

    <body>
        <!-- Header Section -->
        <header class="shadow-md fixed top-0 left-0 w-full z-50 bg-gradient-to-r from-blue-950 to-teal-800">
            <div class="container mx-auto px-6 py-4 flex justify-between items-center">
                <!-- Logo -->
                <div class="flex items-center">
                    <span class="text-xl font-bold text-white">Mega City Cab</span>
                </div>

                <!-- Navigation Menu (Desktop) -->
                <nav class="hidden md:flex space-x-4">
                    <a href="index.jsp" class="text-black bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">Home</a>
                    <a href="bookacab.jsp" class="text-white hover:bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">Book a Cab</a>
                    <a href="viewbookings.jsp" class="text-white hover:bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">View Bookings</a>
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
                    <a href="index.jsp" class="text-blue-950 bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">Home</a>
                    <a href="bookacab.jsp" class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">Book a Cab</a>
                    <a href="viewbookings.jsp" class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">View Bookings</a>
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
        <section class="bg-gradient-to-r from-blue-950 to-teal-800 text-white pt-32 pb-20">
            <div class="container mx-auto px-6 flex flex-col md:flex-row items-center justify-between">
                <!-- Text Content -->
                <div class="md:w-1/2">
                    <h1 class="text-4xl md:text-5xl font-extrabold leading-tight mb-4">
                        Your Trusted Cab Service<br /> in Colombo City 
                    </h1>
                    <p class="text-lg md:text-xl text-gray-300 mb-6">
                        Thousands of satisfied customers rely on Mega City Cab every month. We offer fast, reliable, and comfortable
                        rides around the city ?.
                    </p>
                    <div class="flex space-x-4">
                        <a href="bookacab.jsp"
                           class="px-6 py-3 bg-yellow-500 text-black rounded-lg shadow-lg text-lg font-semibold transform hover:scale-105 transition duration-300">Book
                            Now</a>
                        <a href="#learn-more"
                           class="px-6 py-3 bg-transparent border-2 border-white rounded-lg text-lg font-semibold hover:bg-white hover:text-blue-950 transform transition duration-300">Learn
                            More</a>
                    </div>
                </div>

                <!-- Image Content -->
                <div class="md:w-1/2 mt-10 md:mt-0">
                    <img src="Images/1.png" alt="Cab Service" class="w-full max-w-md md:block hidden rounded-xl shadow-lg">
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="py-16 bg-gray-200">
            <div class="container mx-auto px-6 text-center">
                <h2 class="text-3xl md:text-4xl font-bold text-gray-800 mb-6">Why Choose <span class="text-yellow-500">Mega City Cab?</span></h2>
                <p class="text-gray-600 mb-12">Experience the best cab service in Colombo with fast, reliable, and affordable rides.</p>

                <!-- Features Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-10">

                    <!-- Feature 1 -->
                    <div class="bg-white p-6 rounded-xl shadow-md hover:shadow-lg transition">
                        <div class="text-blue-600 text-5xl mb-4">
                            <i class="fa-solid fa-taxi"></i>
                        </div>
                        <h3 class="text-xl font-semibold text-gray-800">Easy Booking</h3>
                        <p class="text-gray-600 mt-2">Book your cab in just a few clicks with our user-friendly system.</p>
                    </div>

                    <!-- Feature 2 -->
                    <div class="bg-white p-6 rounded-xl shadow-md hover:shadow-lg transition">
                        <div class="text-blue-600 text-5xl mb-4">
                            <i class="fa-solid fa-clock"></i>
                        </div>
                        <h3 class="text-xl font-semibold text-gray-800">24/7 Service</h3>
                        <p class="text-gray-600 mt-2">We?re available around the clock to ensure you always have a ride.</p>
                    </div>

                    <!-- Feature 3 -->
                    <div class="bg-white p-6 rounded-xl shadow-md hover:shadow-lg transition">
                        <div class="text-blue-600 text-5xl mb-4">
                            <i class="fa-solid fa-wallet"></i>
                        </div>
                        <h3 class="text-xl font-semibold text-gray-800">Affordable Pricing</h3>
                        <p class="text-gray-600 mt-2">Transparent fares with no hidden charges for a stress-free journey.</p>
                    </div>

                    <!-- Feature 4 -->
                    <div class="bg-white p-6 rounded-xl shadow-md hover:shadow-lg transition">
                        <div class="text-blue-600 text-5xl mb-4">
                            <i class="fa-solid fa-shield-halved"></i>
                        </div>
                        <h3 class="text-xl font-semibold text-gray-800">Safe & Reliable</h3>
                        <p class="text-gray-600 mt-2">Experienced drivers and well-maintained vehicles for your safety.</p>
                    </div>

                    <!-- Feature 5 -->
                    <div class="bg-white p-6 rounded-xl shadow-md hover:shadow-lg transition">
                        <div class="text-blue-600 text-5xl mb-4">
                            <i class="fa-solid fa-location-dot"></i>
                        </div>
                        <h3 class="text-xl font-semibold text-gray-800">Real-Time Tracking</h3>
                        <p class="text-gray-600 mt-2">Track your cab live and stay updated on arrival times.</p>
                    </div>

                    <!-- Feature 6 -->
                    <div class="bg-white p-6 rounded-xl shadow-md hover:shadow-lg transition">
                        <div class="text-blue-600 text-5xl mb-4">
                            <i class="fa-solid fa-globe"></i>
                        </div>
                        <h3 class="text-xl font-semibold text-gray-800">Multi-Language Support</h3>
                        <p class="text-gray-600 mt-2">Available in English, Sinhala, and Tamil for a better user experience.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- About Section -->
        <section class="py-16 bg-white">
            <div class="container mx-auto px-6 md:px-12">
                <div class="flex flex-col md:flex-row items-center gap-10">
                    <!-- Left Side: Image -->
                    <div class="md:w-1/2">
                        <img src="Images/2.png" alt="Mega City Cab Service" class="w-full h-auto rounded-lg shadow-lg">
                    </div>

                    <!-- Right Side: Text Content -->
                    <div class="md:w-1/2 text-center md:text-center">
                        <h2 class="text-3xl md:text-4xl font-bold text-center text-gray-800 mb-6">About Mega City Cab ?</h2>
                        <p class="text-gray-600 text-center mb-10">We're here to provide safe, reliable, and affordable transportation
                            throughout Colombo.</p>
                        <p class="text-lg text-gray-700 mb-4">
                            Our mission is to revolutionize urban transportation by offering fast, convenient, and affordable cab
                            services to the people of Colombo. We?re dedicated to providing our customers with a reliable ride to their
                            destinations, whether it?s a short trip across the city or an airport transfer.</p>
                        <p class="text-lg text-gray-700 mb-6">
                            With thousands of happy customers using our service each month, we aim to grow and make transportation in Colombo easier for everyone.
                        </p>
                        <!-- Company Stats -->
                        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
                            <div class="bg-gray-50 p-6 rounded-lg shadow-lg">
                                <h3 class="text-2xl font-semibold text-gray-800 mb-2">10,000+</h3>
                                <p class="text-gray-600">Happy Customers</p>
                            </div>
                            <div class="bg-gray-50 p-6 rounded-lg shadow-lg">
                                <h3 class="text-2xl font-semibold text-gray-800 mb-2">24/7</h3>
                                <p class="text-gray-600">Available for Service</p>
                            </div>
                            <div class="bg-gray-50 p-6 rounded-lg shadow-lg">
                                <h3 class="text-2xl font-semibold text-gray-800 mb-2">100+</h3>
                                <p class="text-gray-600">Vehicles in Fleet</p>
                            </div>
                        </div>

                    </div>


                </div>
            </div>
        </section>

        <!-- System Usage Guidelines Section -->
        <section id="usage-guidelines" class="py-16 bg-gray-200">
            <div class="container mx-auto px-6 max-w-3xl">
                <h2 class="text-3xl md:text-4xl font-bold text-center text-gray-800 mb-6">How to Use Mega City Cab ?</h2>
                <p class="text-gray-600 text-center mb-10">Follow these easy steps to book a ride and manage your bookings with Mega City Cab.</p>

                <!-- Step-by-Step Guide -->
                <div class="mb-12">
                    <h3 class="text-2xl font-semibold text-gray-800 text-center mb-6">Step-by-Step Guide</h3>
                    <div class="space-y-8">
                        <div class="flex items-start space-x-4">
                            <div class="flex-shrink-0">
                                <span class="text-xl font-semibold text-white bg-yellow-500 rounded-full w-8 h-8 flex items-center justify-center">1</span>
                            </div>
                            <div>
                                <h4 class="text-lg font-semibold text-gray-800">Login to the System</h4>
                                <p class="text-gray-600">To start using our services, you?ll need to log in to your account.</p>
                            </div>
                        </div>

                        <div class="flex items-start space-x-4">
                            <div class="flex-shrink-0">
                                <span class="text-xl font-semibold text-white bg-yellow-500 rounded-full w-8 h-8 flex items-center justify-center">2</span>
                            </div>
                            <div>
                                <h4 class="text-lg font-semibold text-gray-800">Book a Cab Using the Booking Form</h4>
                                <p class="text-gray-600">Fill in your pickup location, destination, date & time, and select your preferred cab type.</p>
                            </div>
                        </div>

                        <div class="flex items-start space-x-4">
                            <div class="flex-shrink-0">
                                <span class="text-xl font-semibold text-white bg-yellow-500 rounded-full w-8 h-8 flex items-center justify-center">3</span>
                            </div>
                            <div>
                                <h4 class="text-lg font-semibold text-gray-800">Manage Your Booking</h4>
                                <p class="text-gray-600">After booking, you can view and modify your booking using the booking number. You can also cancel or edit your booking if necessary.</p>
                            </div>
                        </div>

                        <div class="flex items-start space-x-4">
                            <div class="flex-shrink-0">
                                <span class="text-xl font-semibold text-white bg-yellow-500 rounded-full w-8 h-8 flex items-center justify-center">4</span>
                            </div>
                            <div>
                                <h4 class="text-lg font-semibold text-gray-800">Check Your Fare and Print the Bill</h4>
                                <p class="text-gray-600">You can easily view the estimated fare, and once your ride is completed, you can print or download your bill.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- FAQ Section -->
                <div>
                    <h3 class="text-2xl font-semibold text-gray-800 text-center mb-6">Frequently Asked Questions</h3>
                    <div class="space-y-6">
                        <!-- FAQ 1 -->
                        <div class="bg-gray-50 p-6 rounded-lg shadow-lg">
                            <h4 class="text-xl font-semibold text-gray-800">How do I book a ride?</h4>
                            <p class="text-gray-600 mt-2">To book a ride, simply go to the 'Book a Cab' section, fill in the required details, and choose your preferred cab type. Then click 'Confirm Booking' to finalize your ride.</p>
                        </div>

                        <!-- FAQ 2 -->
                        <div class="bg-gray-50 p-6 rounded-lg shadow-lg">
                            <h4 class="text-xl font-semibold text-gray-800">Can I modify my booking after confirmation?</h4>
                            <p class="text-gray-600 mt-2">Yes, you can modify your booking anytime before the cab arrives. Simply enter your booking number in the 'Manage Booking' section to view or modify your details.</p>
                        </div>

                        <!-- FAQ 3 -->
                        <div class="bg-gray-50 p-6 rounded-lg shadow-lg">
                            <h4 class="text-xl font-semibold text-gray-800">What happens if I need to cancel my ride?</h4>
                            <p class="text-gray-600 mt-2">You can cancel your ride from the 'Manage Booking' section before the cab arrives. Any cancellation fee will be calculated based on your location and booking details.</p>
                        </div>

                        <!-- FAQ 4 -->
                        <div class="bg-gray-50 p-6 rounded-lg shadow-lg">
                            <h4 class="text-xl font-semibold text-gray-800">How is the fare calculated?</h4>
                            <p class="text-gray-600 mt-2">The fare is based on your pickup location, destination, and the type of cab you choose. You can use the 'Fare Calculator' on the website to get an estimated fare before confirming your booking.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Driver & Car Information Section -->
        <section id="drivers-vehicles" class="py-16 bg-gradient-to-r from-blue-950 to-teal-800 pt-32 pb-20">
            <div class="container mx-auto px-6 max-w-5xl">
                <h2 class="text-3xl md:text-4xl font-bold text-center text-white mb-6">Our Drivers & Vehicles</h2>
                <p class="text-white text-center mb-10">Meet our experienced drivers and well-maintained fleet of vehicles that are always ready to serve you.</p>

                <!-- Drivers Information -->
                <div class="mb-12">
                    <h3 class="text-2xl font-semibold text-white text-center mb-4">Our Trained Drivers</h3>
                    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
                        <!-- Driver Card 1 -->
                        <div class="bg-gray-50 p-6 rounded-lg shadow-lg text-center">
                            <img src="https://randomuser.me/api/portraits/men/7.jpg" alt="Driver 1" class="w-32 h-32 mx-auto mb-4 rounded-full">
                            <h4 class="text-xl font-semibold text-gray-800 mb-2">John Doe</h4>
                            <p class="text-gray-600">Certified Driver with 5+ years of experience</p>
                            <p class="mt-4 text-sm text-gray-500">All our drivers undergo rigorous background checks and safety training to ensure your ride is in trusted hands.</p>
                        </div>

                        <!-- Driver Card 2 -->
                        <div class="bg-gray-50 p-6 rounded-lg shadow-lg text-center">
                            <img src="https://randomuser.me/api/portraits/men/1.jpg" alt="Driver 2" class="w-32 h-32 mx-auto mb-4 rounded-full">
                            <h4 class="text-xl font-semibold text-gray-800 mb-2">Jane Smith</h4>
                            <p class="text-gray-600">Professional with 7+ years of safe driving</p>
                            <p class="mt-4 text-sm text-gray-500">Our drivers prioritize safety and punctuality, offering you a seamless travel experience every time.</p>
                        </div>

                        <!-- Driver Card 3 -->
                        <div class="bg-gray-50 p-6 rounded-lg shadow-lg text-center">
                            <img src="https://randomuser.me/api/portraits/men/4.jpg" alt="Driver 3" class="w-32 h-32 mx-auto mb-4 rounded-full">
                            <h4 class="text-xl font-semibold text-gray-800 mb-2">David Lee</h4>
                            <p class="text-gray-600">Experienced driver with excellent customer service</p>
                            <p class="mt-4 text-sm text-gray-500">Our drivers are friendly, professional, and always committed to providing a top-notch ride for every passenger.</p>
                        </div>
                    </div>
                </div>

                <!-- Vehicles Information -->
                <div>
                    <h3 class="text-2xl font-semibold text-white text-center mb-4">Our Fleet of Vehicles</h3>
                    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
                        <!-- Vehicle Card 1 -->
                        <div class="bg-gray-50 p-6 rounded-lg shadow-lg text-center">
                            <img src="Images/Standard Sedan.webp" alt="Vehicle 1" class="w-full h-48 object-cover rounded-lg mb-4">
                            <h4 class="text-xl font-semibold text-gray-800 mb-2">Standard Sedan</h4>
                            <p class="text-gray-600">Comfortable and affordable ride for 4 passengers</p>
                            <p class="mt-4 text-sm text-gray-500">Our standard sedans are well-maintained, air-conditioned, and perfect for short to medium-distance trips.</p>
                        </div>

                        <!-- Vehicle Card 2 -->
                        <div class="bg-gray-50 p-6 rounded-lg shadow-lg text-center">
                            <img src="Images/Premium SUV.webp" alt="Vehicle 2" class="w-full h-48 object-cover rounded-lg mb-4">
                            <h4 class="text-xl font-semibold text-gray-800 mb-2">Premium SUV</h4>
                            <p class="text-gray-600">Luxury ride for 6 passengers with extra comfort</p>
                            <p class="mt-4 text-sm text-gray-500">Our premium SUVs offer ample space and high-end comfort, ideal for business travelers and families.</p>
                        </div>

                        <!-- Vehicle Card 3 -->
                        <div class="bg-gray-50 p-6 rounded-lg shadow-lg text-center">
                            <img src="Images/Luxury Sedan.webp" alt="Vehicle 3" class="w-full h-48 object-cover rounded-lg mb-4">
                            <h4 class="text-xl font-semibold text-gray-800 mb-2">Luxury Sedan</h4>
                            <p class="text-gray-600">First-class experience for 4 passengers</p>
                            <p class="mt-4 text-sm text-gray-500">For a truly premium experience, our luxury sedans offer the highest level of comfort and style.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials Section -->
        <section id="testimonials" class="py-16 bg-gray-200">
            <div class="container mx-auto px-6 max-w-3xl">
                <h2 class="text-3xl md:text-4xl font-bold text-center text-gray-800 mb-12">What Our Customers Say</h2>

                <!-- Testimonial Cards -->
                <div class="space-y-8">
                    <!-- Testimonial 1 -->
                    <div class="bg-gray-50 p-8 rounded-lg shadow-lg">
                        <div class="flex items-center space-x-4 mb-4">
                            <img class="w-16 h-16 rounded-full" src="https://randomuser.me/api/portraits/men/40.jpg" alt="John Doe">
                            <div>
                                <h4 class="text-xl font-semibold text-gray-800">John D.</h4>
                                <p class="text-gray-600">Regular Customer</p>
                            </div>
                        </div>
                        <p class="text-gray-700">"Mega City Cab made my daily commute so much easier. The drivers are friendly, and I can rely on them to get me to my destination on time. Highly recommended!"</p>
                    </div>

                    <!-- Testimonial 2 -->
                    <div class="bg-gray-50 p-8 rounded-lg shadow-lg">
                        <div class="flex items-center space-x-4 mb-4">
                            <img class="w-16 h-16 rounded-full" src="https://randomuser.me/api/portraits/women/42.jpg" alt="Jane Smith">
                            <div>
                                <h4 class="text-xl font-semibold text-gray-800">Jane S.</h4>
                                <p class="text-gray-600">First-time User</p>
                            </div>
                        </div>
                        <p class="text-gray-700">"I had an amazing experience with Mega City Cab. The app was easy to use, and I was able to track my cab in real-time. I?ll definitely use it again!"</p>
                    </div>

                    <!-- Testimonial 3 -->
                    <div class="bg-gray-50 p-8 rounded-lg shadow-lg">
                        <div class="flex items-center space-x-4 mb-4">
                            <img class="w-16 h-16 rounded-full" src="https://randomuser.me/api/portraits/men/43.jpg" alt="Michael Lee">
                            <div>
                                <h4 class="text-xl font-semibold text-gray-800">Michael L.</h4>
                                <p class="text-gray-600">Frequent Traveler</p>
                            </div>
                        </div>
                        <p class="text-gray-700">"The service is excellent! Booking a ride is so simple, and the prices are affordable. I trust Mega City Cab for all my travel needs around Colombo."</p>
                    </div>

                    <!-- Testimonial 4 -->
                    <div class="bg-gray-50 p-8 rounded-lg shadow-lg">
                        <div class="flex items-center space-x-4 mb-4">
                            <img class="w-16 h-16 rounded-full" src="https://randomuser.me/api/portraits/women/44.jpg" alt="Sarah Lee">
                            <div>
                                <h4 class="text-xl font-semibold text-gray-800">Sarah L.</h4>
                                <p class="text-gray-600">Occasional User</p>
                            </div>
                        </div>
                        <p class="text-gray-700">"I?m impressed with the quality of service. The drivers are professional, and the booking process is straightforward. I?ll definitely be using Mega City Cab again."</p>
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

