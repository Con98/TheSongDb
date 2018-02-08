<%-- 
    Document   : loginSuccess
    Created on : Jan 30, 2018, 9:13:27 AM
    Author     : Thomas
--%>

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
        <%
            Object logiName = session.getAttribute("login");
            if (logiName != null) {
                User user = (User) logiName;
                session.setAttribute("userId", user.getUserId());
                int userId = user.getUserId();
        %>
        
        <h1>Hello <%= user.getFirstName()%></h1>
        
        <%
            }
            %>
    </body>
</html>
