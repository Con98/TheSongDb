<%-- 
    Document   : deleteMessage
    Created on : 02-Mar-2018, 16:23:19
    Author     : tadas
--%>

<%@page import="Dtos.Status"%>
<%@page import="Daos.StatusDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Are you sure?</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <%  StatusDao statusDao = new StatusDao("TheSongDb", "jdbc/TheSongDb");
            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            String statusId = request.getParameter("id");
            Status s = null;
            s = statusDao.findStatusById(statusId);
            if (s != null) {
                User poster = userDao.getDetailsById(s.getUserId());
        %><h1>Are you sure you want to delete this status?</h1>
        <table border="1">
            <tr>
                <th>Status ID</th>
                <th>Poster</th>
                <th>Date updated</th>
                <th>Status</th>
            </tr>
            <tr>
                <td><%= s.getStatusId()%></td>
                <td><%= poster.getUserName()%></td>
                <td><%= s.getSentOn()%></td>
                <td><%= s.getStatusContent()%></td>
            </tr>
        </table>
        <% }%>
        <form class="form-horizontal" action="FrontController" method="post">
            <input type="submit" value="Delete" class="btn btn-default">
            <a href="profile.jsp" class="btn btn-default">Go back</a>
            <input type="hidden" name="statusId" value="<%= s.getStatusId()%>"/>
            <input type="hidden" name="action" value="deleteStatus"/>
        </form>
    </body>
</html>
