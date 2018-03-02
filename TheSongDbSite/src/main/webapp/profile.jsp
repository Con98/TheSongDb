<!DOCTYPE html>
<%-- 
    Document   : profile
    Created on : 01-Feb-2018, 11:21:18
    Author     : emmet
--%>


<head>
    <%@page import = "Dtos.User" %>
<%@page import = "Daos.UserDao" %>
<%@ include file="header.jsp"%>
<%@page import="Dtos.Friend" %>
<%@page import="Daos.FriendDao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<title>Profile</title>
</head>

<body>

<%    try {
        if (session.getAttribute("login") == null) {
%>

<%
    }
    if (session.getAttribute("login") != null) {
        UserDao checkuser = new UserDao("TheSongDb", "jdbc/TheSongDb");
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

<h1>Welcome To Your Profile</h1>
<%
    User loggedUser = (User) session.getAttribute("login");
%>

<%
    if (loggedUser != null) {
        
%>
<h1>Welcome <%=loggedUser.getUserName()%></h1>

<br/>
<h2>Personal Info</h2>
<table>
    <tr>
        <th>First Name: </th>
        <td><%=loggedUser.getFirstName()%></td>
    </tr>

    <tr>
        <th>Surname: </th>
        <td><%=loggedUser.getSurName()%></td>
    </tr>

    <tr>
        <th>Email Address: </th>
        <td><%=loggedUser.getEmail()%></td>
    </tr>
</table>
    <section>
    <div id="leftColumn">
        <%
            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            Object user = session.getAttribute("userName");
            String username = (String) user;
            if (username != null) {
                FriendDao friendDao = new FriendDao("TheSongDb", "jdbc/TheSongDb");
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
    </div>
    </section>
    <%
        }
    %>
</body>
</html>