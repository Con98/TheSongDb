<%-- 
    Document   : deleteUser
    Created on : May 2, 2018, 10:50:28 PM
    Author     : thoma
--%>
<%@page import="Dtos.User"%>
<%@page import="Daos.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete User</title>
    </head>
    <body class="container container-fluid" style="text-align: center;">
        <main>
        <h1>Delete User's Page</h1>
        <%
            
            UserDao userdao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            String userId = request.getParameter("userId");
            int id = Integer.parseInt(userId);
            User u = userdao.getDetailsById(id);
            %>
            <h2>Delete <%=u.getFirstName()%>'s Profile</h2>
        
        <form class="form-horizontal" action="FrontController" method="post">
            <input type="submit" value="<%=new TextBundle("delete").getText(lang)%>" class="btn btn-default">
            <a href="adminSettings.jsp" class="btn btn-default"><%=new TextBundle("goBack").getText(lang)%> </a>
            <input type="hidden" name="userId" value="<%=u.getUserId()%>"/> 
            <input type="hidden" name="action" value="DeleteUser"/>
        </form>
        </main>
    </body>
</html>
