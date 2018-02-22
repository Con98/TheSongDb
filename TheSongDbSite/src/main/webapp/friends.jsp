<%-- 
    Document   : friends
    Created on : 22-Feb-2018, 13:29:48
    Author     : emmet
--%>
<%@page import="Daos.FriendDao"%>
<%@page import="Daos.UserDao" %>
<%@page import="Dtos.User" %>
<%@page import="Dtos.Friend" %>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Friends List</title>
    </head>
    <body>
        <%
            UserDao userDao = new UserDao("myFriends");
            Object user = session.getAttribute("userName");
            String username = (String) user;
            if (username != null) {
                FriendDao friendDao = new FriendDao("myFriends");
                ArrayList<Friend> friends = friendDao.displayAllFriends(username);

        %>
        <h1><%=username%>'s Friend List</h1>
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
    </body>
</html>
