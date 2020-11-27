<%-- 
    Document   : register
    Created on : Nov 26, 2020, 10:44:46 PM
    Author     : user
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register</title>
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
    
    <div class="container" align="center">
        <h1>Register</h1>
        <form action="<%= request.getContextPath() %>/register" method="post">
            <table>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="username" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" /></td>
                </tr>
            </table>
            <br>
            <input class="btn-primary" type="submit" value="Submit" />
        </form>
    </div>
</body>
</html>