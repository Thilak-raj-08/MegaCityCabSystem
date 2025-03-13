package Dashboard;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminBookingsServlet", urlPatterns = {"/AdminBookingsServlet"})
public class AdminBookingsServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String bookingId = request.getParameter("bookingId");
        String customerId = request.getParameter("customerId");
        String carId = request.getParameter("carId");
        String pickupLocation = request.getParameter("pickupLocation");
        String destination = request.getParameter("destination");
        String distanceKM = request.getParameter("distanceKM");
        String fare = request.getParameter("fare");
        String status = request.getParameter("status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                if ("add".equals(action)) {
                    String query = "INSERT INTO Bookings (CustomerID, CarID, PickupLocation, Destination, DistanceKM, Fare, Status) VALUES (?, ?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setInt(1, Integer.parseInt(customerId));
                        stmt.setInt(2, Integer.parseInt(carId));
                        stmt.setString(3, pickupLocation);
                        stmt.setString(4, destination);
                        stmt.setDouble(5, Double.parseDouble(distanceKM));
                        stmt.setDouble(6, Double.parseDouble(fare));
                        stmt.setString(7, status);
                        stmt.executeUpdate();
                    }
                    response.sendRedirect("adminBookings.jsp?success=Booking added successfully!");
                } else if ("edit".equals(action)) {
                    String query = "UPDATE Bookings SET CustomerID=?, CarID=?, PickupLocation=?, Destination=?, DistanceKM=?, Fare=?, Status=? WHERE BookingID=?";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setInt(1, Integer.parseInt(customerId));
                        stmt.setInt(2, Integer.parseInt(carId));
                        stmt.setString(3, pickupLocation);
                        stmt.setString(4, destination);
                        stmt.setDouble(5, Double.parseDouble(distanceKM));
                        stmt.setDouble(6, Double.parseDouble(fare));
                        stmt.setString(7, status);
                        stmt.setInt(8, Integer.parseInt(bookingId));
                        stmt.executeUpdate();
                    }
                    response.sendRedirect("adminBookings.jsp?success=Booking updated successfully!");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminBookings.jsp?error=Database error! Please try again.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String bookingId = request.getParameter("bookingId");

        if ("delete".equals(action)) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                    String query = "DELETE FROM Bookings WHERE BookingID=?";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setInt(1, Integer.parseInt(bookingId));
                        stmt.executeUpdate();
                    }
                }
                response.sendRedirect("adminBookings.jsp?success=Booking deleted successfully!");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("adminBookings.jsp?error=Database error! Please try again.");
            }
        }
    }
}