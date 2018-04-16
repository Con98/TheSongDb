<%-- 
    Document   : userProfile
    Created on : Mar 15, 2018, 3:07:49 AM
    Author     : thoma
--%>

<%@page import="Daos.FriendDao"%>
<%@page import="Dtos.User"%>
<%@page import="Daos.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
    </head>
    <body>
        <%  
            UserDao userDao = new UserDao("thesongdb");
            FriendDao fDao = new FriendDao("thesongdb");
            String aName = request.getParameter("userName");
            User u = userDao.findUserByUsername(aName);
            if(u != null){            
        %>
        <h1><%=u.getUserName()%>'s Profile</h1>
        <table class="table table-striped">
            <tr>
                <th class="col">Name:</th>
                <th class="col">Email:</th>
            </tr>
            
            <tr>
                <td class="row"><%=u.getFirstName() + " " + u.getSurName()%></td>
                <td class="row"><%=u.getEmail()%></td>
            </tr>
            
        </table>
        
        <%
            }
            %>
    </body>
</html>
