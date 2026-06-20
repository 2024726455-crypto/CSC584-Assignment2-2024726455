package assignment2;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    
    // Make sure your database password is correct here if you set one
    private String jdbcURL = "jdbc:mysql://localhost:3306/StudentProfilesDB";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentID = request.getParameter("studentID");
        String name = request.getParameter("name");
        String programme = request.getParameter("programme");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String introduction = request.getParameter("introduction");

        ProfileBean profile = new ProfileBean();
        profile.setStudentID(studentID);
        profile.setName(name);
        profile.setProgramme(programme);
        profile.setEmail(email);
        profile.setHobbies(hobbies);
        profile.setIntroduction(introduction);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            String sql = "INSERT INTO Profile (studentID, name, programme, email, hobbies, introduction) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, profile.getStudentID());
            statement.setString(2, profile.getName());
            statement.setString(3, profile.getProgramme());
            statement.setString(4, profile.getEmail());
            statement.setString(5, profile.getHobbies());
            statement.setString(6, profile.getIntroduction());
            
            statement.executeUpdate();
            connection.close();
            
            request.setAttribute("profile", profile);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            
        } catch (Exception e) {
            // This prevents the blank screen and prints the exact error to your browser
            response.setContentType("text/html");
            response.getWriter().println("<h1>Database Error during Insertion:</h1>");
            response.getWriter().println("<p style='color:red; font-weight:bold;'>" + e.toString() + "</p>");
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            
            // Delete Profile feature (Option C)
            if ("delete".equals(action)) {
                String id = request.getParameter("id");
                String deleteSql = "DELETE FROM Profile WHERE studentID = ?";
                PreparedStatement deleteStmt = connection.prepareStatement(deleteSql);
                deleteStmt.setString(1, id);
                deleteStmt.executeUpdate();
            }

            String sql = "SELECT * FROM Profile";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            
            List<ProfileBean> listProfile = new ArrayList<>();
            while (resultSet.next()) {
                ProfileBean p = new ProfileBean();
                p.setStudentID(resultSet.getString("studentID"));
                p.setName(resultSet.getString("name"));
                p.setProgramme(resultSet.getString("programme"));
                p.setEmail(resultSet.getString("email"));
                p.setHobbies(resultSet.getString("hobbies"));
                p.setIntroduction(resultSet.getString("introduction"));
                listProfile.add(p);
            }
            connection.close();
            
            request.setAttribute("listProfile", listProfile);
            request.getRequestDispatcher("viewProfiles.jsp").forward(request, response);
            
        } catch (Exception e) {
            // This prevents the blank screen and prints the exact error to your browser
            response.setContentType("text/html");
            response.getWriter().println("<h1>Database Error during Retrieval:</h1>");
            response.getWriter().println("<p style='color:red; font-weight:bold;'>" + e.toString() + "</p>");
            e.printStackTrace();
        }
    }
}