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
        <title>Home</title>
    </head>
    <body>
        <%            Object logiName = session.getAttribute("login");
            if (logiName != null) {
                User user = (User) logiName;
                session.setAttribute("userId", user.getUserId());
                int userId = user.getUserId();
        %>

        <h1>Hello <%= user.getFirstName()%></h1>
        <%@include file="updateStatus.jsp" %>
        <h1><%= user.getUserName()%>'s statuses</h1>
        <%
            StatusDao statusDao = new StatusDao("TheSongDb", "jdbc/TheSongDb");
            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            ArrayList<Status> statuses = statusDao.displayStatuses(user.getUserId());
            if (!statuses.isEmpty()) { %>
        <table border="1">
            <tr>
                <th>Poster</th>
                <th>Status</th>
                <th>Date updated</th>
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
