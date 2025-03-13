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
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "AdminLoginServlet", urlPatterns = {"/AdminLoginServlet"})
public class AdminLoginServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // SQL query to check if the user exists and matches the selected role
                String query = "SELECT * FROM Users WHERE Username = ? AND Password = ? AND Role = ?";

                // Create a PreparedStatement to execute the query
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setString(1, username);
                    stmt.setString(2, password);
                    stmt.setString(3, role);

                    // Execute the query
                    ResultSet rs = stmt.executeQuery();

                    // Check if the user exists and matches the selected role
                    if (rs.next()) {
                        // Create a session and set attributes
                        HttpSession session = request.getSession();
                        session.setAttribute("username", username);
                        session.setAttribute("role", role);

                        // Redirect to the appropriate dashboard based on role
                        if (role.equals("Admin")) {
                            response.sendRedirect("adminDashboard.jsp?success=Login Successful!");
                        } else if (role.equals("Driver")) {
                            response.sendRedirect("adminDashboard.jsp?success=Login Successful!");
                        }
                    } else {
                        // Redirect back to the login page with an error message
                        response.sendRedirect("admin.jsp?error=Invalid username, password, or role");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?error=Database error! Please try again.");
        }
    }
}