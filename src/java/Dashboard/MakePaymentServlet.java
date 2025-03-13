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

@WebServlet(name = "MakePaymentServlet", urlPatterns = {"/MakePaymentServlet"})
public class MakePaymentServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String bookingId = request.getParameter("bookingId");
        String paymentMethod = request.getParameter("paymentMethod");

        Connection conn = null;
        PreparedStatement fareStmt = null;
        PreparedStatement billStmt = null;
        PreparedStatement paymentStmt = null;
        PreparedStatement updateBookingStmt = null;
        ResultSet fareRs = null;
        ResultSet billRs = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Step 1: Retrieve the fare from the Bookings table
            String fareQuery = "SELECT Fare FROM Bookings WHERE BookingID = ?";
            fareStmt = conn.prepareStatement(fareQuery);
            fareStmt.setInt(1, Integer.parseInt(bookingId));
            fareRs = fareStmt.executeQuery();

            double fare = 0.0;
            if (fareRs.next()) {
                fare = fareRs.getDouble("Fare");
            } else {
                // No booking found with the given ID
                response.sendRedirect("makePayment.jsp?error=Booking not found. Please try again.");
                return;
            }

            // Step 2: Retrieve the BillID associated with the BookingID
            String billQuery = "SELECT BillID FROM Bills WHERE BookingID = ?";
            billStmt = conn.prepareStatement(billQuery);
            billStmt.setInt(1, Integer.parseInt(bookingId));
            billRs = billStmt.executeQuery();

            int billId = -1;
            if (billRs.next()) {
                billId = billRs.getInt("BillID");
            } else {
                // No bill found for the booking
                // Option 1: Create a new bill dynamically
                String createBillQuery = "INSERT INTO Bills (BookingID, BaseFare, Tax, Discount, FinalAmount, PaymentMethod, PaymentStatus) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement createBillStmt = conn.prepareStatement(createBillQuery, PreparedStatement.RETURN_GENERATED_KEYS);
                createBillStmt.setInt(1, Integer.parseInt(bookingId));
                createBillStmt.setDouble(2, fare); // BaseFare
                createBillStmt.setDouble(3, 150.00); // Tax (example value)
                createBillStmt.setDouble(4, 50.00); // Discount (example value)
                createBillStmt.setDouble(5, fare + 150.00 - 50.00); // FinalAmount
                createBillStmt.setString(6, paymentMethod); // PaymentMethod
                createBillStmt.setString(7, "Unpaid"); // PaymentStatus
                createBillStmt.executeUpdate();

                // Retrieve the generated BillID
                ResultSet generatedKeys = createBillStmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    billId = generatedKeys.getInt(1);
                } else {
                    // Failed to create a bill
                    response.sendRedirect("makePayment.jsp?error=Failed to create a bill. Please try again.");
                    return;
                }
            }

            // Step 3: Insert payment information into the Payments table
            String paymentQuery = "INSERT INTO Payments (BillID, AmountPaid, PaymentMethod, Status) VALUES (?, ?, ?, 'Successful')";
            paymentStmt = conn.prepareStatement(paymentQuery);
            paymentStmt.setInt(1, billId);
            paymentStmt.setDouble(2, fare);
            paymentStmt.setString(3, paymentMethod);
            paymentStmt.executeUpdate();

            // Step 4: Update the booking status to 'Completed'
            String updateBookingQuery = "UPDATE Bookings SET Status = 'Completed' WHERE BookingID = ?";
            updateBookingStmt = conn.prepareStatement(updateBookingQuery);
            updateBookingStmt.setInt(1, Integer.parseInt(bookingId));
            updateBookingStmt.executeUpdate();

            // Redirect to billingDetails.jsp with BillID
//            response.sendRedirect("billingDetails.jsp?billId=" + billId);
 response.sendRedirect("billingDetails.jsp?success=Payment+Successful!&billId=" + billId);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("makePayment.jsp?error=Payment failed. Please try again.");
        } finally {
            // Close all resources
            try {
                if (fareRs != null) {
                    fareRs.close();
                }
                if (billRs != null) {
                    billRs.close();
                }
                if (fareStmt != null) {
                    fareStmt.close();
                }
                if (billStmt != null) {
                    billStmt.close();
                }
                if (paymentStmt != null) {
                    paymentStmt.close();
                }
                if (updateBookingStmt != null) {
                    updateBookingStmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
