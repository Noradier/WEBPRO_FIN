<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Kelas</title>
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
     
        <sql:query var="kelas"   dataSource="${myDS}">
            SELECT * FROM kelas where id=<%= request.getParameter("id")%>;
        </sql:query>
            
        <sql:query var="listStudents"   dataSource="${myDS}">
            SELECT * FROM student s, kelas2student bridge
            where s.id=bridge.studentId AND bridge.kelasId=<%= request.getParameter("id")%>;
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
                <table>
                    <c:forEach var="row" items="${kelas.rows}">
                        <tr>
                            <td>
                                <h1>Class: ${row.kelasname}</h1>
                            </td>
                        </tr>
                    </c:forEach>
                </table>            
                <br>
                <table class="table table-striped table-hover">
                    <tr>
                        <td>First Name</td>
                        <td>Last Name</td>
                    </tr>
                    <c:forEach var="row" items="${listStudents.rows}">
                       <tr>
                            <td>${row.firstName}</td>
                            <td>${row.lastName}</td>
                       </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </body>
</html>
