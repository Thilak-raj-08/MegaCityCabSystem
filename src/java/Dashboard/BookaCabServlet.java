package Dashboard;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "BookaCabServlet", urlPatterns = {"/BookaCabServlet"})
public class BookaCabServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String fare = request.getParameter("fare");
        String customerId = request.getParameter("customerId");
        String distance = request.getParameter("distance");
        String carType = request.getParameter("carType");
        String bookingDate = request.getParameter("bookingDate");
        String pickupLocation = request.getParameter("pickupSearch"); // Retrieve pickup location
        String destination = request.getParameter("destinationSearch"); // Retrieve destination

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // Step 1: Retrieve CarID based on CarType
                String carQuery = "SELECT CarID FROM Cars WHERE CarType = ? AND Status = 'Available' LIMIT 1";
                int carId = -1; // Default value if no car is found

                try (PreparedStatement carStmt = conn.prepareStatement(carQuery)) {
                    carStmt.setString(1, carType);
                    try (ResultSet rs = carStmt.executeQuery()) {
                        if (rs.next()) {
                            carId = rs.getInt("CarID");
                        }
                    }
                }

                if (carId == -1) {
                    // No available car found for the selected car type
                    response.sendRedirect("bookacab.jsp?error=No available cars for the selected type. Please try again.");
                    return;
                }

                // Step 2: Insert booking information
                String bookingQuery = "INSERT INTO Bookings (CustomerID, CarID, PickupLocation, Destination, DistanceKM, Fare, BookingDate, Status) VALUES (?, ?, ?, ?, ?, ?, ?, 'Pending')";

                try (PreparedStatement bookingStmt = conn.prepareStatement(bookingQuery)) {
                    bookingStmt.setInt(1, Integer.parseInt(customerId));
                    bookingStmt.setInt(2, carId); // Use the retrieved CarID
                    bookingStmt.setString(3, pickupLocation); // Set pickup location
                    bookingStmt.setString(4, destination); // Set destination
                    bookingStmt.setDouble(5, Double.parseDouble(distance));
                    bookingStmt.setDouble(6, Double.parseDouble(fare));
                    bookingStmt.setString(7, bookingDate);

                    // Execute the query
                    int rowsAffected = bookingStmt.executeUpdate();

                    // Check if the insertion was successful
                    if (rowsAffected > 0) {
                        response.sendRedirect("viewbookings.jsp?success=Booking confirmed successfully!");
                    } else {
                        response.sendRedirect("bookacab.jsp?error=Failed to confirm booking. Please try again.");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Database error! Please try again.");
        }
    }
}