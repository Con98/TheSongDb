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
    <body class="container container-fluid">
        <%            Object logiName = session.getAttribute("login");
            if (logiName != null) {
                User user = (User) logiName;
                session.setAttribute("userId", user.getUserId());
                int userId = user.getUserId();
        %>

        <h1><%= new TextBundle("hello").getText(lang)%> <%= user.getFirstName()%></h1>
        <%@include file="updateStatus.jsp" %>
        <h1><%= user.getUserName()%> Friends Status's</h1>
        <%
            StatusDao statusDao = new StatusDao("TheSongDb", "jdbc/TheSongDb");
            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            ArrayList<Status> statuses = statusDao.displayStatuses(user.getUserId());
            if (!statuses.isEmpty()) { %>
            <%
                for (int i = statuses.size() -1; i > 0; i--) {
                    
            %>
            <div class="sTable">       
                <div class="sInfo">
                <%= new TextBundle("poster").getText(lang)%>:
                <%= userDao.getDetailsById(statuses.get(i).getUserId()).getUserName() %>
                </div>

            
            <div class="sContent">
                
                <%= new TextBundle("status").getText(lang)%>:
                <%= statuses.get(i).getStatusContent()%>
            </div>
            </div>
            <%
                }
            %>
    
        <% }
            }
        %>
    </body>
</html>
