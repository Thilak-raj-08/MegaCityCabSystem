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

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // SQL query to check user credentials
                String query = "SELECT CustomerID, FullName FROM Customers WHERE Email = ? AND Password = ?";
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setString(1, email);
                    stmt.setString(2, password);

                    // Execute the query
                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next()) {
                            // Login successful
                            int customerId = rs.getInt("CustomerID"); // Retrieve CustomerID
                            String fullName = rs.getString("FullName");

                            // Store the user's ID and name in the session
                            HttpSession session = request.getSession();
                            session.setAttribute("customerId", customerId);
                            session.setAttribute("userName", fullName);

                            // Redirect to the index page
                            response.sendRedirect("index.jsp?success=Login Successful!");
                        } else {
                            // Login failed
                            response.sendRedirect("login.jsp?error=Invalid email or password.");
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Database error! Please try again.");
        }
    }
}