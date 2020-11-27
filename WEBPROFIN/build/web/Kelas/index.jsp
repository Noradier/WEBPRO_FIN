<%-- 
    Document   : index
    Created on : Nov 27, 2020, 1:56:47 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kelas</title>
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
     
        <sql:query var="listKelas"   dataSource="${myDS}">
            SELECT * FROM kelas;
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
                    <tr>
                        <td>
                            <form action="<%=request.getContextPath()%>/Kelas/createKelas.jsp">
                                <input class="btn-primary" type="submit" value="Create New Class">
                            </form>
                        </td>
                    </tr>
                </table>
                <br>
                <table class="table table-striped table-hover">
                    <caption><h2>List of Classes</h2></caption>
                    <tr>
                        <th>Class Name</th>
                        <th class="col-sm-1"></th>
                        <th class="col-sm-1"></th>
                    </tr>
                        <c:forEach var="row" items="${listKelas.rows}">
                            <tr>
                                <td><c:out value="${row.kelasname}" /></td>
                                <td class="col-sm-1">
                                    <form action="<%=request.getContextPath()%>/Kelas/assignStudent.jsp?id=${row.id}" method="post">
                                        <input class="btn-primary" type="submit" value="Assign"/>
                                    </form>
                                </td>
                                <td class="col-sm-1">
                                    <form action="<%=request.getContextPath()%>/Kelas/viewKelas.jsp?id=${row.id}" method="post">
                                        <input class="btn-info" type="submit" value="View"/>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                </table>
            </div>
        </div>
    </body>
</html>
