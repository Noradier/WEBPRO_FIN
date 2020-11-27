/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.StudentBean;
import database.StudentDao;

/**
 *
 * @author user
 */
@WebServlet("/CreateStudent")
public class CreateStudentServlet extends HttpServlet {

    private StudentDao studentDao;

    public void init() {
        studentDao = new StudentDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String contact = request.getParameter("contact");

        StudentBean student = new StudentBean();
        student.setFirstName(firstName);
        student.setLastName(lastName);
        student.setContact(contact);

        try {
            studentDao.createStudent(student);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        response.sendRedirect("Student/");
    }
}
