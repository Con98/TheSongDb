<%-- 
    Document   : friendRequest
    Created on : 13-Mar-2018, 22:14:04
    Author     : emmet
--%>

<%@page import="org.apache.commons.i18n.bundles.TextBundle"%>
<%@page import="Daos.UserDao"%>
<%@page import="Daos.FriendRequestDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dtos.FriendRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
        UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            Object user = session.getAttribute("userName");
            String username = (String) user;
            
        if (username != null) {
            FriendRequestDao friendRequestDao = new FriendRequestDao("TheSongDb", "jdbc/TheSongDb");
            ArrayList<FriendRequest> friendRequests = friendRequestDao.displayAllFriendRequests(username);
    %>
    <h1><%=new TextBundle("friendRequests").getText(lang) %></h1>
    <table>
        <%
            for (FriendRequest fr : friendRequests) {
        %>
        <tr>
            <td><%=fr.getFriend2()%></td>
            <%
                }
} else {
                out.println("No Friend Requests Found");
            }
            %>
        </tr>