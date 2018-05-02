<%-- 
    Document   : deleteUser
    Created on : 13-Apr-2018, 13:54:09
    Author     : emmet
--%>

<%@page import="Dtos.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Delete User's Page</h1>
        <%
            int userId = (Integer) request.getAttribute("id");
            UserDao userdao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            User u = userdao.getDetailsById(userId);
            
        %>
        <h2>Are you sure you want to delete <%=u.getFirstName()%>'s Profile</h2>
        
        <form class="form-horizontal" action="FrontController" method="post">
            <input type="submit" value="<%=new TextBundle("delete").getText(lang)%>" class="btn btn-default">
            <a href="adminSettings.jsp" class="btn btn-default"><%=new TextBundle("goBack").getText(lang)%> </a>
            <input type="hidden" name="userId" value="<%=u.getUserId()%>"/> 
            <input type="hidden" name="action" value="deleteUser"/>
        </form>
    </body>
</html>
