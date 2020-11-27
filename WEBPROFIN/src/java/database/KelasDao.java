/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import bean.Kelas2StudentBean;
import bean.KelasBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class KelasDao {
    public int createKelas(KelasBean kelas) throws ClassNotFoundException {
        String SQL_QUERY = "INSERT INTO kelas" +
            " (id, kelasname) VALUES" +
            " (0, ?);";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/webpro", "root", "");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL_QUERY)) {
            preparedStatement.setString(1, kelas.getClassName());

            System.out.println(preparedStatement);

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }
    
    public int assignKelas(Kelas2StudentBean bean) throws ClassNotFoundException {
        String SQL_QUERY = "INSERT INTO kelas2student" +
            " (kelasId, studentId) VALUES" +
            " (?, ?);";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/webpro", "root", "");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL_QUERY)) {
            preparedStatement.setInt(1, bean.getKelasId());
            preparedStatement.setInt(2, bean.getStudentId());

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
