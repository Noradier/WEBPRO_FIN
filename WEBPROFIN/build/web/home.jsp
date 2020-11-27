<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap.css"/>
        <script src="<%=request.getContextPath()%>/bootstrap.js"></script>
    </head>
    <body>
        <%
            String uname = (String) session.getAttribute("username");
            if(uname == null){
                String url = request.getContextPath() + "/login.jsp";
                response.sendRedirect(url);
            }
        %>
        <div align="center">
            <div class="navbar navbar-inverse ">
                <div class="container">
                    <div class="navbar-header">
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="<%=request.getContextPath()%>/Profile">Profile</a></li>
                            <li><a href="<%=request.getContextPath()%>/Student">Student</a></li>
                            <li><a href="<%=request.getContextPath()%>/Kelas">Class</a></li>
                            <li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <br>
            <br>
            <br>
            <div class="container">
                <p>
                    Welcome, it's a pleasure to have you here. This is a small website. There is not much to do here. 
                    This website has some small features. In Student Menu, you can add a Student's record, edit the record, view it, or delete it. 
                    There is also Profile Menu, where you can add a blog containing what you think at the moment. This website also have Class, 
                    where you can add a Class, fill it with Student, and even view the Class.
                </p>
            </div>
        </div>
    </body>
</html>
