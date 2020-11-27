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

/**
 *
 * @author user
 */
import bean.UserBean;
import database.UserDao;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserBean userBean = new UserBean();
        userBean.setUsername(username);
        userBean.setPassword(password);

        try {
            userDao.registerUser(userBean);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        response.sendRedirect("register-to-login.jsp?username=" + username);
    }
}
