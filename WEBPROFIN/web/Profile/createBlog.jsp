<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Blog</title>
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

            <h1>Create New Blog</h1>
            <form action="<%=request.getContextPath()%>/CreateBlog" method="post" id="createBlog">
                <table>
                    <tr>
                        <td>Title</td>
                        <td><input type="text" name="title" /></td>
                    </tr>
                    <tr>
                        <td>Content</td>
                        <td>
                            <textarea form="createBlog" name="content" style="width:100%; height:250px; resize: none;"></textarea>
                        </td>
                    </tr>
                </table>
                <input type="submit" value="Create" />
                <input type="hidden" name="username" value="<%=uname%>"/>
            </form>
        </div>
    </body>
</html>
