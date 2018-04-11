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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
            String aName = request.getParameter("action");
            String ob = null;
        %>
        
        <%
            FriendDao friendDao = new FriendDao("TheSongDb", "jdbc/TheSongDb");
            Object user = session.getAttribute("userName");
            String username = (String) user;
            boolean areFriends = friendDao.checkIfFriends(username, aName);
            
if (areFriends == true){
        %>
        <button id="friendRequest"<%
            
            FriendRequestDao friendRequestDao = new FriendRequestDao("TheSongDb", "jdbc/TheSongDb");
                        friendRequestDao.addFriendship(username, aName);
                %>>Send Friend Request</button>
                
                <%
                }
else {
                %>
                <button id="deleteFriend"<%
            friendDao.removeFriendship(username, aName);
                %>>Delete Friend</button>
                <button id="sendMessage"
                    <%
                        
                    %>>Send Message</button>
    </body>
</html>
