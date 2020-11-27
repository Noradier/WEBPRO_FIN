<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
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
            SELECT * FROM blog where username='<%=uname%>';
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
                <h1 class="text-white">PROFILE</h1>
                <table>
                    <tr>
                        <td>Username</td>
                        <td><%= uname%></td>
                    </tr>
                    <tr>
                        <td class="text-center" colspan="2">
                            <a href="<%=request.getContextPath()%>/Profile/createBlog.jsp">Create a New Blog</a>
                        </td>
                    </tr>
                </table>
                        
                <br>
                
                <table class="table table-striped table-hover">
                <caption><h2>Your Blog</h2></caption>
                    <tr>
                        <th>Timestamp</th>
                        <th>Title</th>
                        <th>Content</th>
                    </tr>
                    <c:forEach var="row" items="${listStudents.rows}">
                        <tr>
                            <td><c:out value="${row.time}" /></td>
                            <td><c:out value="${row.title}" /></td>
                            <td><c:out value="${row.content}" /></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </body>
</html>
