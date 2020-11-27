/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import bean.Kelas2StudentBean;
import bean.KelasBean;
import database.KelasDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet("/AssignStudent")
public class AssignStudentServlet extends HttpServlet {

    private KelasDao kelasDao;

    public void init() {
        kelasDao = new KelasDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        int kelasId = Integer.parseInt(request.getParameter("kelasId"));
        int studentId = Integer.parseInt(request.getParameter("studentId"));

        Kelas2StudentBean bean = new Kelas2StudentBean();
        
        bean.setKelasId(kelasId);
        bean.setStudentId(studentId);

        try {
            kelasDao.assignKelas(bean);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        response.sendRedirect("Kelas/");
    }
}
