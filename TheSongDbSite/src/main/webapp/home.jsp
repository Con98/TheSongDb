<%-- 
    Document   : loginSuccess
    Created on : Jan 30, 2018, 9:13:27 AM
    Author     : Thomas
--%>

<%@page import="Dtos.Status"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.StatusDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import="Daos.UserDao"%>
        <%@page import="Dtos.User"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="header.jsp" %>
        <title><%= new TextBundle("home").getText(lang)%></title>
    </head>
    <body>
        <%            Object logiName = session.getAttribute("login");
            if (logiName != null) {
                User user = (User) logiName;
                session.setAttribute("userId", user.getUserId());
                int userId = user.getUserId();
        %>

        <h1><%= new TextBundle("hello").getText(lang)%> <%= user.getFirstName()%></h1>
        <%@include file="updateStatus.jsp" %>
        <h1><%= user.getUserName()%><%= new TextBundle("statuses").getText(lang)%></h1>
        <%
            StatusDao statusDao = new StatusDao("TheSongDb", "jdbc/TheSongDb");
            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            ArrayList<Status> statuses = statusDao.displayStatuses(user.getUserId());
            if (!statuses.isEmpty()) { %>
        <table border="1">
            <tr>
                <th><%= new TextBundle("poster").getText(lang)%></th>
                <th><%= new TextBundle("status").getText(lang)%></th>
                <th><%= new TextBundle("datePublished").getText(lang)%></th>
            </tr>

            <%
                for (Status s : statuses) {
            %>
            <tr>
                <td><%= userDao.getDetailsById(s.getUserId()).getUserName() %></td>
                <td><%= s.getStatusContent()%></td>
                <td><%= s.getSentOn()%></td>
            </tr>
            <%
                }
            %>

        </table>
        <% }
            }
        %>
    </body>
</html>
