<%-- 
    Document   : inbox
    Created on : Apr 16, 2018, 10:27:35 PM
    Author     : thoma
--%>

<%@page import="Dtos.User"%>
<%@page import="Dtos.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.UserDao"%>
<%@page import="Daos.MessageDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="leftColumn">
        <%
            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            User loggedUser = (User) session.getAttribute("login");
            MessageDao messageDao = new MessageDao("TheSongDb", "jdbc/TheSongDb");
            ArrayList<Message> messages = messageDao.displayAllMessages(loggedUser.getUserId());
        %>

        <h1><%= loggedUser.getUserName()%><%=new TextBundle("messages").getText(lang)%></h1>
        <table class="table table-bordered">
            <% if (!messages.isEmpty()) { %>
            <tr>
                <th><%=new TextBundle("sender").getText(lang)%></th>
                <th><%=new TextBundle("receiver").getText(lang)%></th>
                <th><%=new TextBundle("timeSent").getText(lang)%></th>
                <th><%=new TextBundle("subject").getText(lang)%></th>
                <th><%=new TextBundle("message").getText(lang)%></th>
                <th><%=new TextBundle("delete").getText(lang)%></th>
            </tr>

            <%
                for (Message m : messages) {
                    User sender = userDao.getDetailsById(m.getFromId());
                    User receiver = userDao.getDetailsById(m.getToId());
            %>
            <tr>
                <td><%= sender.getUserName()%></td>
                <td><%= receiver.getUserName()%></td>
                <td><%= m.getSentOn()%></td>
                <td><%= m.getSubjectLine()%></td>
                <td><%= m.getMessageContent()%></td>
                <td><a href="deleteMessage.jsp?id=<%=m.getMessageId()%>"><%=new TextBundle("delete").getText(lang)%></a></td>
            </tr>
            <%
                }
            %>

        </table>
        <% } else {
                new TextBundle("noMessagesFound").getText(lang);
            }%>
    </div>
    </body>
</html>
