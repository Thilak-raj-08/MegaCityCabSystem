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

@WebServlet(name = "AdminDriversServlet", urlPatterns = {"/AdminDriversServlet"})
public class AdminDriversServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String driverId = request.getParameter("driverId");
        String fullName = request.getParameter("fullName");
        String licenseNumber = request.getParameter("licenseNumber");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String status = request.getParameter("status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                if ("add".equals(action)) {
                    String query = "INSERT INTO Drivers (FullName, LicenseNumber, PhoneNumber, Address, Status) VALUES (?, ?, ?, ?, ?)";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setString(1, fullName);
                        stmt.setString(2, licenseNumber);
                        stmt.setString(3, phone);
                        stmt.setString(4, address);
                        stmt.setString(5, status);
                        stmt.executeUpdate();
                    }
                    response.sendRedirect("adminDrivers.jsp?success=Driver added successfully!");
                } else if ("edit".equals(action)) {
                    String query = "UPDATE Drivers SET FullName=?, LicenseNumber=?, PhoneNumber=?, Address=?, Status=? WHERE DriverID=?";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setString(1, fullName);
                        stmt.setString(2, licenseNumber);
                        stmt.setString(3, phone);
                        stmt.setString(4, address);
                        stmt.setString(5, status);
                        stmt.setInt(6, Integer.parseInt(driverId));
                        stmt.executeUpdate();
                    }
                    response.sendRedirect("adminDrivers.jsp?success=Driver updated successfully!");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminDrivers.jsp?error=Database error! Please try again.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String driverId = request.getParameter("driverId");

        if ("delete".equals(action)) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                    String query = "DELETE FROM Drivers WHERE DriverID=?";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setInt(1, Integer.parseInt(driverId));
                        stmt.executeUpdate();
                    }
                }
                response.sendRedirect("adminDrivers.jsp?success=Driver deleted successfully!");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("adminDrivers.jsp?error=Database error! Please try again.");
            }
        }
    }
}