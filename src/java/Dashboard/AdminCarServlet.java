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

@WebServlet(name = "AdminCarServlet", urlPatterns = {"/AdminCarServlet"})
public class AdminCarServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String carId = request.getParameter("carId");
        String carModel = request.getParameter("carModel");
        String carNumber = request.getParameter("carNumber");
        String carType = request.getParameter("carType");
        String driverId = request.getParameter("driverId");
        String status = request.getParameter("status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                if ("add".equals(action)) {
                    String query = "INSERT INTO Cars (CarModel, CarNumber, CarType, DriverID, Status) VALUES (?, ?, ?, ?, ?)";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setString(1, carModel);
                        stmt.setString(2, carNumber);
                        stmt.setString(3, carType);
                        stmt.setString(4, driverId.isEmpty() ? null : driverId);
                        stmt.setString(5, status);
                        stmt.executeUpdate();
                    }
                    response.sendRedirect("adminCar.jsp?success=Car added successfully!");
                } else if ("edit".equals(action)) {
                    String query = "UPDATE Cars SET CarModel=?, CarNumber=?, CarType=?, DriverID=?, Status=? WHERE CarID=?";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setString(1, carModel);
                        stmt.setString(2, carNumber);
                        stmt.setString(3, carType);
                        stmt.setString(4, driverId.isEmpty() ? null : driverId);
                        stmt.setString(5, status);
                        stmt.setInt(6, Integer.parseInt(carId));
                        stmt.executeUpdate();
                    }
                    response.sendRedirect("adminCar.jsp?success=Car updated successfully!");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminCar.jsp?error=Database error! Please try again.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String carId = request.getParameter("carId");

        if ("delete".equals(action)) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                    String query = "DELETE FROM Cars WHERE CarID=?";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setInt(1, Integer.parseInt(carId));
                        stmt.executeUpdate();
                    }
                }
                response.sendRedirect("adminCar.jsp?success=Car deleted successfully!");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("adminCar.jsp?error=Database error! Please try again.");
            }
        }
    }
}