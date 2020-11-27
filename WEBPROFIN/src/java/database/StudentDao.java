/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import bean.StudentBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class StudentDao {
    public int createStudent(StudentBean student) throws ClassNotFoundException {
        String SQL_QUERY = "INSERT INTO student" +
            "  (id, firstname, lastname, contact) VALUES " +
            " (0, ?, ?, ?);";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/webpro", "root", "");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL_QUERY)) {
            preparedStatement.setString(1, student.getFirstName());
            preparedStatement.setString(2, student.getLastName());
            preparedStatement.setString(3, student.getContact());

            System.out.println(preparedStatement);

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }
    
    public int updateStudent(StudentBean student) throws ClassNotFoundException {
        String SQL_QUERY = "UPDATE student" +
            " SET firstname = ?, lastname = ?, contact = ?" +
            " WHERE id = ?;";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/webpro", "root", "");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_QUERY)) {
            preparedStatement.setString(1, student.getFirstName());
            preparedStatement.setString(2, student.getLastName());
            preparedStatement.setString(3, student.getContact());
            preparedStatement.setInt(4, student.getId());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }

    public int deleteStudent(StudentBean student) throws ClassNotFoundException {
        String SQL_QUERY = "DELETE FROM student" +
            " WHERE id = ?;";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/webpro", "root", "");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_QUERY)) {
            preparedStatement.setInt(1, student.getId());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
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
