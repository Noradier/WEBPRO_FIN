<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
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
        <%
            String username = request.getParameter("username");
        %>
        
        <h4 class="text-danger">TRY AGAIN!</h4>
        <h1>Login</h1>
        <form action="<%=request.getContextPath()%>/login" method="post">
            <table>
                <tr>
                     <td>Username</td>
                     <td><input type="text" name="username" value="<%= username%>" /></td>
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