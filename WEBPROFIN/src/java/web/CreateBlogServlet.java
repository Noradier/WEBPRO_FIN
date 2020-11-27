/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import bean.BlogBean;
import database.BlogDao;
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
@WebServlet("/CreateBlog")
public class CreateBlogServlet extends HttpServlet {

    private BlogDao blogDao;

    public void init() {
        blogDao = new BlogDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String username = request.getParameter("username");

        BlogBean blog = new BlogBean();
        blog.setTitle(title);
        blog.setContent(content);
        blog.setUsername(username);

        try {
            blogDao.createBlog(blog);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        response.sendRedirect("Profile/");
    }
}
