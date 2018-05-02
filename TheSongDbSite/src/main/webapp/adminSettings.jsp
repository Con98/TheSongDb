<%-- 
    Document   : adminSettings
    Created on : Apr 27, 2018, 8:27:12 PM
    Author     : thoma
--%>

<%@page import="Dtos.Message"%>
<%@page import="Daos.MessageDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Section</title>
    </head>
    <body class="container container-fluid">
        <h1>Administration Station</h1>
<<<<<<< HEAD
        <%            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
=======
        <%            
            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
>>>>>>> a1670936c01f411270ad6ee141fc244669a7dd87
            User loggedUser = (User) session.getAttribute("login");
        %>

        <h3>Choose User To Delete</h3>
<<<<<<< HEAD
        <%            UserDao userList = new UserDao("TheSongDb", "jdbc/TheSongDb");
=======
        <%            
            UserDao userList = new UserDao("TheSongDb", "jdbc/TheSongDb");
>>>>>>> a1670936c01f411270ad6ee141fc244669a7dd87
            ArrayList<User> users = userList.viewAllUsers();
        %>
        <table class="table table-bordered">
            <tr>
                <th>Username</th>
                <th>First Name</th>
                <th>Surname</th>
                <th>Email Address</th>
            </tr>

            <%
                for (User u : users) {
            %>
            <tr>
                <td><%= u.getUserName()%></td>
                <td><%= u.getFirstName()%></td>
                <td><%= u.getSurName()%></td>
                <td><%= u.getEmail()%></td>
                <td>
                    <input type="button" name="deleteUser" value="<%= userList.deleteUser(u)%>">
                    <a href="deleteUser.jsp" class="btn btn-default"><%=new TextBundle("delete").getText(lang)%></a>
                    <input type="hidden" name="userId" value="<%= u.getUserId()%>"/>
                    <input type="hidden" name="delete" value="deleteUser"/>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <h3>Reported Messages</h3>
        <%
            MessageDao messageDao = new MessageDao("TheSongDb", "jdbc/TheSongDb");
            ArrayList<Message> reported = messageDao.displayReportedMessages();
        %>
        <table class="table table-bordered">
<<<<<<< HEAD
            <% if (!reported.isEmpty()) { %>
=======
            <% if (!reported.isEmpty()) {%>
>>>>>>> a1670936c01f411270ad6ee141fc244669a7dd87
            <tr>
                <th><%=new TextBundle("sender").getText(lang)%></th>
                <th><%=new TextBundle("receiver").getText(lang)%></th>
                <th><%=new TextBundle("timeSent").getText(lang)%></th>
                <th><%=new TextBundle("subject").getText(lang)%></th>
                <th><%=new TextBundle("message").getText(lang)%></th>
                <th><%=new TextBundle("delete").getText(lang)%></th>
            </tr>
<<<<<<< HEAD
            
            <%
                for (Message r : reported){
                    User sender = userDao.getDetailsById(r.getFromId());
                    User receiver = userDao.getDetailsById(r.getToId());
                    %>
                    <tr>
=======

            <%
                for (Message r : reported) {
                    User sender = userDao.getDetailsById(r.getFromId());
                    User receiver = userDao.getDetailsById(r.getToId());
            %>
            <tr>
>>>>>>> a1670936c01f411270ad6ee141fc244669a7dd87
                <td><%= sender.getUserName()%></td>
                <td><%= receiver.getUserName()%></td>
                <td><%= r.getSentOn()%></td>
                <td><%= r.getSubjectLine()%></td>
                <td><%= r.getMessageContent()%></td>
                <td><a href="deleteMessage.jsp?id=<%=r.getMessageId()%>"><%=new TextBundle("delete").getText(lang)%></a></td>
<<<<<<< HEAD
                    </tr>
            <%
                }
}
=======
            </tr>
            <%
                    }
                }
>>>>>>> a1670936c01f411270ad6ee141fc244669a7dd87
            %>
        </table>
    </body>
</html>
