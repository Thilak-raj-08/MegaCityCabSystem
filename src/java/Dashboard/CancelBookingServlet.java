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

@WebServlet(name = "CancelBookingServlet", urlPatterns = {"/CancelBookingServlet"})
public class CancelBookingServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the bookingId from the request
        String bookingId = request.getParameter("bookingId");

        if (bookingId != null) {
            try {
                // Load the JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish a connection to the database
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                    // Update the booking status to 'Cancelled'
                    String updateQuery = "UPDATE Bookings SET Status = 'Cancelled' WHERE BookingID = ?";
                    try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                        updateStmt.setInt(1, Integer.parseInt(bookingId));
                        int rowsAffected = updateStmt.executeUpdate();

                        if (rowsAffected > 0) {
                            // Redirect to viewbookings.jsp with a success message
                            response.sendRedirect("viewbookings.jsp?success=Booking cancelled successfully!");
                        } else {
                            // No booking found with the given ID
                            response.sendRedirect("viewbookings.jsp?error=Booking not found. Please try again.");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("viewbookings.jsp?error=Failed to cancel booking. Please try again.");
            }
        } else {
            // No bookingId provided
            response.sendRedirect("viewbookings.jsp?error=No booking selected. Please try again.");
        }
    }
}