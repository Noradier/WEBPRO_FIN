/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import bean.StudentBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.StudentDao;

/**
 *
 * @author user
 */
@WebServlet("/DeleteStudent")
public class DeleteStudentServlet extends HttpServlet {

    private StudentDao studentDao;

    public void init() {
        studentDao = new StudentDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        StudentBean student = new StudentBean();
        student.setId(id);

        try {
            studentDao.deleteStudent(student);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        response.sendRedirect("Student/");
    }
}
