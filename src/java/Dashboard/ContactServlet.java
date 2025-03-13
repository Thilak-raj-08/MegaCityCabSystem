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

@WebServlet(name = "ContactServlet", urlPatterns = {"/ContactServlet"})
public class ContactServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // SQL query to insert contact information
                String query = "INSERT INTO ContactUs (Name, Email, Phone, Message) VALUES (?, ?, ?, ?)";

                // Create a PreparedStatement to execute the query
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setString(1, name);
                    stmt.setString(2, email);
                    stmt.setString(3, phone);
                    stmt.setString(4, message);

                    // Execute the query
                    int rowsAffected = stmt.executeUpdate();

                    // Check if the insertion was successful
                    if (rowsAffected > 0) {
                        response.sendRedirect("contact.jsp?success=Message sent successfully!");
                    } else {
                        response.sendRedirect("contact.jsp?error=Failed to send message. Please try again.");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("contact.jsp?error=Database error! Please try again.");
        }
    }
}