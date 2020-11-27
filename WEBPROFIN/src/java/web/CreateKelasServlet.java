/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

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
@WebServlet("/CreateKelas")
public class CreateKelasServlet extends HttpServlet {

    private KelasDao kelasDao;

    public void init() {
        kelasDao = new KelasDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String className = request.getParameter("classname");

        KelasBean kelas = new KelasBean();
        kelas.setClassName(className);

        try {
            kelasDao.createKelas(kelas);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        response.sendRedirect("Kelas/");
    }
}
