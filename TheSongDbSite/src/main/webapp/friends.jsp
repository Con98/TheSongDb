<%-- 
    Document   : friends
    Created on : 22-Feb-2018, 13:29:48
    Author     : emmet
--%>
<%@page import="org.apache.commons.i18n.bundles.TextBundle"%>
<%@page import="Daos.FriendDao"%>
<%@page import="Daos.UserDao" %>
<%@page import="Dtos.User" %>
<%@page import="Dtos.Friend" %>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside>
    
        <%
            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            Object user = session.getAttribute("userName");
            String username = (String) user;
            if (username != null) {
                FriendDao friendDao = new FriendDao("TheSongDb", "jdbc/TheSongDb");
                ArrayList<Friend> friends = friendDao.displayAllFriends(username);

        %>
        <h1><%=username%><%= new TextBundle("friendsList").getText(lang)%></h1>
        <table>
            <%
                for (Friend f : friends) {
            %>
            <tr>
                <td><%=f.getFriend2()%></td>
                <%
                        }
                    } else {
                        out.println("No Friends Found");
                    }
                %>
            </tr>
        </table>
</aside>