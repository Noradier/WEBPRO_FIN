<%-- 
    Document   : index
    Created on : Nov 26, 2020, 12:04:03 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome!</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap.css"/>
        <script src="<%=request.getContextPath()%>/bootstrap.js"></script>
    </head>
    <body>
        <%
            String uname = (String) session.getAttribute("username");
            if(uname != null){
                String url = request.getContextPath() + "/home.jsp";
                response.sendRedirect(url);
            }
        %>
        
        <div class="navbar navbar-inverse ">
            <div class="container">
                <div class="navbar-header">
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="<%=request.getContextPath()%>/login.jsp">Login</a></li>
                        <li><a href="<%=request.getContextPath()%>/register.jsp">Register</a></li>
                    </ul>
                </div>
            </div>
        </div>
            <br>
            <br>
            <br>
        <div class="container">
            <div class="container-fluid">
                <h1 class="text-lg-center text-white">WELCOME TO THIS SMALL SITE</h1>
            </div>
        </div>
    </body>
</html>
