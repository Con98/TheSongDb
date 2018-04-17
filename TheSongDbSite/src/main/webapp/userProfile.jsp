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
        <a href="sendMessage.jsp?action=<%=u.getUserId()%>">Send Message</a>
        <%
            }
            %>

        <%        try {
            if (session.getAttribute("login") == null) {
    %>

    <%
        }
        if (session.getAttribute("login") != null) {
            User loggedUser = (User) session.getAttribute("login");
            boolean userN = loggedUser.isType();

            if (loggedUser.isType() == userN) {
    %>

    <% } else {%>
    <!--Regular Nav-->
    <%
                }
            }
        } catch (Exception ex) {
            out.println(ex.getMessage());
        }
    %>
    
        <%            
            String uName = request.getParameter("action");
            String ob = null;
        %>
        
        <%
            FriendDao friendDao = new FriendDao("TheSongDb", "jdbc/TheSongDb");
            Object user = session.getAttribute("userName");
            String username = (String) user;
            boolean areFriends = friendDao.checkIfFriends(uName, username);
            FriendRequestDao friendRequestDao = new FriendRequestDao("TheSongDb", "jdbc/TheSongDb");
            
if (areFriends == true){
        %>
        
                
                <%
                }else{
User loggedUser = (User) session.getAttribute("login");
                %>
    <form action="FrontController" method="post">
        <input type="hidden" name="currentUser" value="<%=loggedUser.getUserName()%>">
        <input type="hidden" name="searchUser" value="<%=aName%>">
        <input type="submit" value="Send Friend Request" class="btn btn-default">
         <input type="hidden" name="action" value="SendFriendRequest"/>
    </form>
                <%}%>
    </body>
</html>
