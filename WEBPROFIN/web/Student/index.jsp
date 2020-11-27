<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student</title>
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
        SELECT * FROM student;
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
            <h1 class="text-white">STUDENT</h1>
        
            <table class="table table-striped table-hover">
                <caption><h2>List of Students</h2></caption>
                <tr class="header">
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Contact</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="row" items="${listStudents.rows}">
                    <tr>
                        <td><c:out value="${row.id}" /></td>
                        <td><c:out value="${row.firstName}" /></td>
                        <td><c:out value="${row.lastName}" /></td>
                        <td><c:out value="${row.contact}" /></td>
                        <td>
                            <form action="<%=request.getContextPath()%>/Student/editStudent.jsp?id=${row.id}" method="post">
                                <input class="btn-primary" type="submit" value="Edit"/>
                            </form>
                        </td>
                        <td>
                            <form action="<%=request.getContextPath()%>/Student/viewStudent.jsp?id=${row.id}" method="post">
                                <input class="btn-info" type="submit" value="View"/>
                            </form>
                        </td>
                        <td>
                            <form action="<%=request.getContextPath()%>/DeleteStudent" method="post">
                                <input class="btn-danger" type="submit" value="Delete"/>
                                <input type="hidden" name="id" value="${row.id}"/>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="container">
        <a href="<%=request.getContextPath()%>/Student/createStudent.jsp">Create New Student</a>
    </div>
</body>
</html>
