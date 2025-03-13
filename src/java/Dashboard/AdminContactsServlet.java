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

@WebServlet(name = "AdminContactsServlet", urlPatterns = {"/AdminContactsServlet"})
public class AdminContactsServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String contactId = request.getParameter("contactId");

        if ("delete".equals(action)) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                    String query = "DELETE FROM ContactUs WHERE ContactID=?";
                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setInt(1, Integer.parseInt(contactId));
                        stmt.executeUpdate();
                    }
                }
                response.sendRedirect("adminContacts.jsp?success=Contact deleted successfully!");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("adminContacts.jsp?error=Database error! Please try again.");
            }
        }
    }
}