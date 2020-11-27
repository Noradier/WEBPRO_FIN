/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import bean.StudentBean;
import java.io.IOException;
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
@WebServlet("/UpdateStudent")
public class UpdateStudentServlet extends HttpServlet {

    private StudentDao studentDao;

    public void init() {
        studentDao = new StudentDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String contact = request.getParameter("contact");

        StudentBean student = new StudentBean();
        student.setId(id);
        student.setFirstName(firstName);
        student.setLastName(lastName);
        student.setContact(contact);

        try {
            studentDao.updateStudent(student);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        response.sendRedirect("Student/");
    }
}
