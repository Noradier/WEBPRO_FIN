/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import bean.BlogBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class BlogDao {
    public int createBlog(BlogBean blog) throws ClassNotFoundException {
        String SQL_QUERY = "INSERT INTO blog" +
            " (id, content, title, username) VALUES " +
            " (0, ?, ?, ?);";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/webpro", "root", "");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL_QUERY)) {
            preparedStatement.setString(1, blog.getContent());
            preparedStatement.setString(2, blog.getTitle());
            preparedStatement.setString(3, blog.getUsername());

            System.out.println(preparedStatement);

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
