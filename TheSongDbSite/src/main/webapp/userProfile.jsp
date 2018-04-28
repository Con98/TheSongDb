<%-- 
    Document   : userProfile
    Created on : Mar 15, 2018, 3:07:49 AM
    Author     : thoma
--%>

<%@page import="Daos.FriendDao"%>

<%@page import="java.lang.String"%>
<%@page import="Daos.FriendRequestDao"%>

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
    <body class="container container-fluid">

        <%  
            UserDao userDao = new UserDao("thesongdb");
            FriendDao fDao = new FriendDao("thesongdb");
            String aName = request.getParameter("userName");
            User u = userDao.findUserByUsername(aName);
            if(u != null){            
        %>
        <h1><%=u.getUserName()%>'s Profile</h1>
        <table class="table table-bordered">
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
User loggedUser = (User) session.getAttribute("login");
boolean friendCheck = fDao.checkIfFriends(loggedUser.getUserName(), u.getUserName());
    if(friendCheck){
            %>
<a class="btn btn-default" href="sendMessage.jsp?action=<%=u.getUserId()%>">Send Message</a>
    
                <%}else{%>
                <form action="FrontController" method="post">
        <input type="hidden" name="currentUser" value="<%=loggedUser.getUserName()%>">
        <input type="hidden" name="searchUser" value="<%=aName%>">
        <input type="submit" value="Send Friend Request" class="btn btn-default">
         <input type="hidden" name="action" value="SendFriendRequest"/>
    </form>
                <%}%>
    </body>
</html>
