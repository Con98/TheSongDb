<%-- 
    Document   : deleteUser
    Created on : 13-Apr-2018, 13:54:09
    Author     : emmet
--%>

<%@page import="Dtos.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Delete User's Page</h1>
        <%
            UserDao userdao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            ArrayList<User> users = userdao.viewAllUsers();
            
for (User u : users) {
    User uName = userdao.getDetailsById(u.getUserId());
    userdao.deleteUser(u);
}
        %>
    </body>
</html>
