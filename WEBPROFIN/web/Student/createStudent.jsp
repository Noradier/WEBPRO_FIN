<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Create Student</title>
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
        <div class="container">
            <h3 class="text-white">CREATE STUDENT</h3>
            <br>
            <form action="<%=request.getContextPath()%>/CreateStudent" method="post">
                <table>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="firstname" /></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lastname" /></td>
                    </tr>
                    <tr>
                        <td>Contact</td>
                        <td><input type="text" name="contact" maxlength="12"/></td>
                    </tr>
                </table>
                <br>
                <input class="btn-primary" type="submit" value="Create" />
            </form>
        </div>
 </div>
</body>
</html>