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

@WebServlet(name = "AdminBillingServlet", urlPatterns = {"/AdminBillingServlet"})
public class AdminBillingServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String billId = request.getParameter("billId");
        String bookingId = request.getParameter("bookingId");
        String baseFare = request.getParameter("baseFare");
        String tax = request.getParameter("tax");
        String discount = request.getParameter("discount");
        String finalAmount = request.getParameter("finalAmount");
        String paymentMethod = request.getParameter("paymentMethod");
        String paymentStatus = request.getParameter("paymentStatus");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                if ("add".equals(action)) {
                    String query = "INSERT INTO Bills (BookingID, BaseFare, Tax, Discount, FinalAmount, PaymentMethod, PaymentStatus) VALUES (?, ?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setInt(1, Integer.parseInt(bookingId));
                        stmt.setDouble(2, Double.parseDouble(baseFare));
                        stmt.setDouble(3, Double.parseDouble(tax));
                        stmt.setDouble(4, Double.parseDouble(discount));
                        stmt.setDouble(5, Double.parseDouble(finalAmount));
                        stmt.setString(6, paymentMethod);
                        stmt.setString(7, paymentStatus);
                        stmt.executeUpdate();
                    }
                    response.sendRedirect("adminBilling.jsp?success=Bill added successfully!");
                } else if ("edit".equals(action)) {
                    String query = "UPDATE Bills SET BookingID=?, BaseFare=?, Tax=?, Discount=?, FinalAmount=?, PaymentMethod=?, PaymentStatus=? WHERE BillID=?";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setInt(1, Integer.parseInt(bookingId));
                        stmt.setDouble(2, Double.parseDouble(baseFare));
                        stmt.setDouble(3, Double.parseDouble(tax));
                        stmt.setDouble(4, Double.parseDouble(discount));
                        stmt.setDouble(5, Double.parseDouble(finalAmount));
                        stmt.setString(6, paymentMethod);
                        stmt.setString(7, paymentStatus);
                        stmt.setInt(8, Integer.parseInt(billId));
                        stmt.executeUpdate();
                    }
                    response.sendRedirect("adminBilling.jsp?success=Bill updated successfully!");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminBilling.jsp?error=Database error! Please try again.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String billId = request.getParameter("billId");

        if ("delete".equals(action)) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                    String query = "DELETE FROM Bills WHERE BillID=?";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setInt(1, Integer.parseInt(billId));
                        stmt.executeUpdate();
                    }
                }
                response.sendRedirect("adminBilling.jsp?success=Bill deleted successfully!");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("adminBilling.jsp?error=Database error! Please try again.");
            }
        }
    }
}