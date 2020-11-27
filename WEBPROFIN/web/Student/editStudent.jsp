<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Student</title>
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
    
    <sql:setDataSource
        var="myDS"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/webpro"
        user="root" password=""
    />
     
    <sql:query var="listStudents"   dataSource="${myDS}">
        SELECT * FROM student where id=<%= request.getParameter("id")%>;
    </sql:query>
        
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
            <h3 class="text-white">UPDATE STUDENT DATA</h3>
            <br>
            <form action="<%=request.getContextPath()%>/UpdateStudent" method="post">
                <table>
                    <c:forEach var="row" items="${listStudents.rows}">
                        <tr>
                            <td>First Name</td>
                            <td><input type="text" name="firstname" value="${row.firstName}"/></td>
                        </tr>
                        <tr>
                            <td>Last Name</td>
                            <td><input type="text" name="lastname" value="${row.lastName}"/></td>
                        </tr>
                        <tr>
                            <td>Contact</td>
                            <td><input type="text" name="contact" value="${row.contact}" maxlength="12"/></td>
                        </tr>
                    </c:forEach>
                </table>
                <br>
                <input type="hidden" name="id" value="${row.id}">
                <input type="submit" class="btn-primary" value="Update" />
            </form>
        </div>
    </div>
</body>
</html>