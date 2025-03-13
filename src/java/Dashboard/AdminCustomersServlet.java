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

@WebServlet(name = "AdminCustomersServlet", urlPatterns = {"/AdminCustomersServlet"})
public class AdminCustomersServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String customerId = request.getParameter("customerId");
        String regNumber = request.getParameter("regNumber");
        String nic = request.getParameter("nic");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                if ("add".equals(action)) {
                    String query = "INSERT INTO Customers (RegistrationNumber, NIC, FullName, PhoneNumber, Email, Address) VALUES (?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setString(1, regNumber);
                        stmt.setString(2, nic);
                        stmt.setString(3, fullName);
                        stmt.setString(4, phone);
                        stmt.setString(5, email);
                        stmt.setString(6, address);
                        stmt.executeUpdate();
                    }
                    response.sendRedirect("adminCustomers.jsp?success=Customer added successfully!");
                } else if ("edit".equals(action)) {
                    String query = "UPDATE Customers SET RegistrationNumber=?, NIC=?, FullName=?, PhoneNumber=?, Email=?, Address=? WHERE CustomerID=?";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setString(1, regNumber);
                        stmt.setString(2, nic);
                        stmt.setString(3, fullName);
                        stmt.setString(4, phone);
                        stmt.setString(5, email);
                        stmt.setString(6, address);
                        stmt.setInt(7, Integer.parseInt(customerId));
                        stmt.executeUpdate();
                    }
                    response.sendRedirect("adminCustomers.jsp?success=Customer updated successfully!");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminCustomers.jsp?error=Database error! Please try again.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String customerId = request.getParameter("customerId");

        if ("delete".equals(action)) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                    String query = "DELETE FROM Customers WHERE CustomerID=?";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setInt(1, Integer.parseInt(customerId));
                        stmt.executeUpdate();
                    }
                }
                response.sendRedirect("adminCustomers.jsp?success=Customer deleted successfully!");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("adminCustomers.jsp?error=Database error! Please try again.");
            }
        }
    }
}