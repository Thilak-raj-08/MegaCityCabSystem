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

@WebServlet(name = "AdminPaymentsServlet", urlPatterns = {"/AdminPaymentsServlet"})
public class AdminPaymentsServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String paymentId = request.getParameter("paymentId");
        String billId = request.getParameter("billId");
        String amountPaid = request.getParameter("amountPaid");
        String paymentMethod = request.getParameter("paymentMethod");
        String status = request.getParameter("status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                if ("add".equals(action)) {
                    String query = "INSERT INTO Payments (BillID, AmountPaid, PaymentMethod, Status) VALUES (?, ?, ?, ?)";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setInt(1, Integer.parseInt(billId));
                        stmt.setDouble(2, Double.parseDouble(amountPaid));
                        stmt.setString(3, paymentMethod);
                        stmt.setString(4, status);
                        stmt.executeUpdate();
                    }
                    response.sendRedirect("adminPayments.jsp?success=Payment added successfully!");
                } else if ("edit".equals(action)) {
                    String query = "UPDATE Payments SET BillID=?, AmountPaid=?, PaymentMethod=?, Status=? WHERE PaymentID=?";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setInt(1, Integer.parseInt(billId));
                        stmt.setDouble(2, Double.parseDouble(amountPaid));
                        stmt.setString(3, paymentMethod);
                        stmt.setString(4, status);
                        stmt.setInt(5, Integer.parseInt(paymentId));
                        stmt.executeUpdate();
                    }
                    response.sendRedirect("adminPayments.jsp?success=Payment updated successfully!");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminPayments.jsp?error=Database error! Please try again.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String paymentId = request.getParameter("paymentId");

        if ("delete".equals(action)) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                    String query = "DELETE FROM Payments WHERE PaymentID=?";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setInt(1, Integer.parseInt(paymentId));
                        stmt.executeUpdate();
                    }
                }
                response.sendRedirect("adminPayments.jsp?success=Payment deleted successfully!");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("adminPayments.jsp?error=Database error! Please try again.");
            }
        }
    }
}