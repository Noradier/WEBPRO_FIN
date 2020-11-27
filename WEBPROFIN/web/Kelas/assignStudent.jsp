<%-- 
    Document   : assignStudent
    Created on : Nov 27, 2020, 1:57:23 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Student</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap.css"/>
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
            SELECT * FROM student where id not in(
                SELECT s.id FROM student s, kelas2student k2s
                where s.id=k2s.studentId and k2s.kelasId=<%= request.getParameter("id")%>
            );
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
                <table class="table table-striped table-hover">
                    <caption><h2>List of Students to be Assigned</h2></caption>
                    <tr>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Contact</th>
                        <th></th>
                    </tr>
                    <c:forEach var="row" items="${listStudents.rows}">
                        <tr>
                            <td><c:out value="${row.id}" /></td>
                            <td><c:out value="${row.firstName}" /></td>
                            <td><c:out value="${row.lastName}" /></td>
                            <td><c:out value="${row.contact}" /></td>
                            <td>
                                <form action="<%=request.getContextPath()%>/AssignStudent" method="post">
                                    <input class="btn-primary" type="submit" value="Assign"/>
                                    <input type="hidden" name="kelasId" value="<%= request.getParameter("id")%>"/>
                                    <input type="hidden" name="studentId" value="${row.id}"/>
                                </form>
                            </td>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </body>
</html>
