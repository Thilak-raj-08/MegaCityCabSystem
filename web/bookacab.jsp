<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mega City Cab</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5tUOI4AyuO-vpChKnt41AW1I8NKAOKEY&libraries=places,directions"></script>
        <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
        <script src="https://unpkg.com/leaflet.gridlayer.googlemutant@latest/dist/Leaflet.GoogleMutant.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
        <style>
            .leaflet-container {
                height: 350px;
                width: 100%;
                margin-bottom: 1rem;
                position: sticky;
            }
        </style>
    </head>

    <body>
        <!-- Header Section -->
        <header class="shadow-md fixed top-0 left-0 w-full z-50 bg-gradient-to-r from-blue-950 to-teal-800">
            <div class="container mx-auto px-6 py-4 flex justify-between items-center">
                <!-- Logo -->
                <div class="flex items-center ">
                    <span class="text-xl font-bold text-white">Mega City Cab</span>
                </div>

                <!-- Navigation Menu -->
                <nav class="hidden md:flex space-x-4">
                    <a href="index.jsp"
                       class="text-white hover:bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">Home</a>
                    <a href="bookacab.jsp"
                       class="text-black bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">Book
                        a Cab</a>
                    <a href="viewbookings.jsp" class="text-white hover:bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">View Bookings</a>
                
                    <a href="about.jsp"
                       class="text-white hover:bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">About
                        Us</a>
                    <a href="contact.jsp"
                       class="text-white hover:bg-yellow-500 hover:text-blue-950 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300">Contact</a>
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
                    <a href="index.jsp"
                       class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">Home</a>
                    <a href="bookacab.jsp"
                       class="text-blue-950 bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">Book
                        a Cab
                    </a>
                    <a href="viewbookings.jsp" class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">View Bookings</a>
                    <a href="about.jsp"
                       class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">About
                        Us
                    </a>
                    <a href="contact.jsp"
                       class="text-black hover:bg-yellow-500 hover:text-blue-950 block px-3 py-2 rounded-md text-base font-medium transition-all duration-300">Contact</a>
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
                <h1 class="text-4xl md:text-5xl font-bold mb-4">Book Your Cab in 3 Simple Steps</h1>
                <!-- Subtext -->
                <p class="text-lg md:text-xl mb-8 max-w-2xl">Experience hassle-free rides with Mega City Cab. Enjoy fast, reliable, and safe transportation in Colombo anytime you need it.</p>
            </div>
        </section>

        <!-- Book a Cab Form Section -->
        <section class="py-16 bg-gray-200">
            <div class="max-w-screen-lg mx-auto px-6">
                <!-- Flex container for side-by-side forms -->
                <div class="flex flex-col md:flex-row md:space-x-6">
                    <!-- Left Form -->
                    <form action="bookacab.html" method="POST" class="bg-white p-8 rounded-lg shadow-lg space-y-6 flex-1">
                        <h1 class="text-2xl font-bold text-center mb-6">Fare Calculator</h1>
                        <div id="map" class="leaflet-container"></div>
                        <div class="text-center mt-4">
                            <p class="text-gray-700">Pickup: <span id="pickupName" class="font-semibold">Not set</span></p>
                            <p class="text-gray-700">Destination: <span id="destinationName" class="font-semibold">Not set</span></p>
                            <button type="button" onclick="calculateFare()" class="w-full bg-purple-500 text-white py-2 px-4 rounded-lg mt-4 hover:bg-purple-600">Calculate Fare</button>
                            <h2 id="result" class="text-xl font-bold mt-4"></h2>
                        </div>
                    </form>

                    <!-- Right Form -->
                    <form action="BookaCabServlet" method="POST" class="bg-white p-8 rounded-lg shadow-lg space-y-6 flex-1">
                        <input type="hidden" name="fare" id="fare">
                        <input type="hidden" id="distance" name="distance">
                        <input type="hidden" name="customerId" id="customerId" value="<%= session.getAttribute("customerId") %>">
                        <!-- Pickup Location and Destination -->
                        <div class="flex flex-col md:flex-row md:space-x-6">
                            <div class="flex-1">
                                <label class="block mb-2 text-sm font-semibold">Pickup Location:</label>
                                <input type="text" id="pickupSearch" name="pickupSearch" placeholder="Search pickup location"  class="w-full p-2 border rounded mb-2">
                                <label class="block mb-2 text-sm font-semibold">Destination Location:</label>
                                <input type="text" id="destinationSearch" name="destinationSearch" placeholder="Search destination" class="w-full p-2 border rounded mb-2">
                            </div>
                        </div>
                        <!-- Car Type -->
                        <div>
                            <label for="carType" class="block text-sm font-medium text-gray-700">Car Type</label>
                            <select id="carType" name="carType" required
                                    class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                                <option value="" disabled selected>Select a car type</option>
                                <option value="Standard">Standard Sedan</option>
                                <option value="SUV">Premium SUV</option>
                                <option value="Premium">Luxury Sedan</option>
                            </select>
                        </div>
                        <!-- Booking Date -->
                        <div>
                            <label for="bookingDate" class="block text-sm font-medium text-gray-700">Booking Date & Time</label>
                            <input type="datetime-local" id="bookingDate" name="bookingDate" required
                                   class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                        </div>
                        <!-- Submit Button -->
                        <div class="text-center">
                            <button type="button" onclick="calculateFareAndSubmit()"
                                    class="w-full bg-yellow-500 text-blue-950 py-2 px-4 rounded-md font-semibold hover:bg-yellow-600 transition duration-300">
                                Confirm Booking
                            </button>
                        </div>
                    </form>
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

        <script>
            // Map and Fare Calculation Logic
            let map, pickupMarker, destinationMarker, routeLayer;
            let pickupLocation = null, destinationLocation = null;

            function initMap() {
                map = L.map('map').setView([7.8731, 80.7718], 8);
                L.gridLayer.googleMutant({type: 'roadmap'}).addTo(map);

                const pickupSearch = new google.maps.places.Autocomplete(document.getElementById('pickupSearch'));
                pickupSearch.addListener('place_changed', () => setLocation(pickupSearch, true));

                const destinationSearch = new google.maps.places.Autocomplete(document.getElementById('destinationSearch'));
                destinationSearch.addListener('place_changed', () => setLocation(destinationSearch, false));
            }

            function setLocation(searchInput, isPickup) {
                const place = searchInput.getPlace();
                if (!place.geometry)
                    return;

                const location = {lat: place.geometry.location.lat(), lng: place.geometry.location.lng()};
                if (isPickup) {
                    pickupLocation = location;
                    if (pickupMarker)
                        pickupMarker.remove();
                    pickupMarker = L.marker(location).addTo(map).bindPopup(place.name).openPopup();
                    document.getElementById("pickupName").textContent = place.name;
                } else {
                    destinationLocation = location;
                    if (destinationMarker)
                        destinationMarker.remove();
                    destinationMarker = L.marker(location).addTo(map).bindPopup(place.name).openPopup();
                    document.getElementById("destinationName").textContent = place.name;
                }
                map.setView(location, 15);
            }

            function calculateFareAndSubmit() {
                if (!pickupLocation || !destinationLocation) {
                    alert("Please set both pickup and destination locations.");
                    return;
                }

                const directionsService = new google.maps.DirectionsService();
                const request = {
                    origin: pickupLocation,
                    destination: destinationLocation,
                    travelMode: 'DRIVING'
                };

                directionsService.route(request, (result, status) => {
                    if (status === 'OK') {
                        const distanceInMeters = result.routes[0].legs[0].distance.value;
                        const distanceInKm = distanceInMeters / 1000;
                        const fare = distanceInKm * 200; // Adjust fare calculation as needed

                        // Display the result
                        document.getElementById("result").textContent = "Distance: " + distanceInKm.toFixed(2) + " km | Fare: Rs. " + fare.toFixed(2);

                        // Set the hidden input fields
                        document.getElementById("fare").value = fare.toFixed(2);
                        document.getElementById("distance").value = distanceInKm.toFixed(2);

                        // Submit the form
                        document.querySelector("form[action='BookaCabServlet']").submit();
                    } else {
                        alert("Could not retrieve route information.");
                    }
                });
            }
            
            function calculateFare() {
                if (!pickupLocation || !destinationLocation) {
                    alert("Please set both pickup and destination locations.");
                    return;
                }

                const directionsService = new google.maps.DirectionsService();
                const request = {
                    origin: pickupLocation,
                    destination: destinationLocation,
                    travelMode: 'DRIVING'
                };

                directionsService.route(request, (result, status) => {
                    if (status === 'OK') {
                        const distanceInMeters = result.routes[0].legs[0].distance.value;
                        const distanceInKm = distanceInMeters / 1000;
                        const fare = distanceInKm * 200;

                        // Modified line with string concatenation
                        document.getElementById("result").textContent = "Distance: " + distanceInKm.toFixed(2) + " km | Fare: Rs. " + fare.toFixed(2);

                        if (routeLayer)
                            routeLayer.remove();
                        routeLayer = L.polyline(result.routes[0].overview_path.map(p => [p.lat(), p.lng()]), {color: 'blue'}).addTo(map);
                    } else {
                        alert("Could not retrieve route information.");
                    }
                });
            }

            window.onload = initMap;
        </script>
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