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

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String fullName = request.getParameter("fullName");
        String nic = request.getParameter("nic");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate password match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("register.jsp?error=Passwords do not match.");
            return;
        }

        // Hash the password (for security, use a proper hashing algorithm like BCrypt)
        // For simplicity, we'll use plain text here (not recommended for production)
        String hashedPassword = password; // Replace with actual hashing logic

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // Generate the next registration number
                String registrationNumber = generateNextRegistrationNumber(conn);

                // SQL query to insert a new customer
                String query = "INSERT INTO Customers (RegistrationNumber, FullName, NIC, Address, PhoneNumber, Email, Password) VALUES (?, ?, ?, ?, ?, ?, ?)";

                // Create a PreparedStatement to execute the query
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setString(1, registrationNumber);
                    stmt.setString(2, fullName);
                    stmt.setString(3, nic);
                    stmt.setString(4, address);
                    stmt.setString(5, phoneNumber);
                    stmt.setString(6, email);
                    stmt.setString(7, hashedPassword);

                    // Execute the query
                    int rowsAffected = stmt.executeUpdate();

                    // Check if the insertion was successful
                    if (rowsAffected > 0) {
                        response.sendRedirect("login.jsp?success=Registration successful! Please login.");
                    } else {
                        response.sendRedirect("register.jsp?error=Failed to register. Please try again.");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Database error! Please try again.");
        }
    }

    /**
     * Generates the next registration number in the format REG{number}.
     *
     * @param conn The database connection.
     * @return The next registration number (e.g., REG1, REG2, etc.).
     * @throws Exception If there is an error querying the database.
     */
    private String generateNextRegistrationNumber(Connection conn) throws Exception {
        String query = "SELECT MAX(CAST(SUBSTRING(RegistrationNumber, 4) AS UNSIGNED)) AS maxRegNumber FROM Customers";
        try (PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            int maxRegNumber = 0;
            if (rs.next()) {
                maxRegNumber = rs.getInt("maxRegNumber");
            }
            return "REG" + (maxRegNumber + 1);
        }
    }
}