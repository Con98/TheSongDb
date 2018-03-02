<%-- 
    Document   : deleteMessage
    Created on : 02-Mar-2018, 16:23:19
    Author     : tadas
--%>

<%@page import="Dtos.Message"%>
<%@page import="Daos.MessageDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Are you sure?</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <%  MessageDao messageDao = new MessageDao("TheSongDb", "jdbc/TheSongDb");
            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            String messageId = request.getParameter("id");
            Message m = null;
            m = messageDao.findMessageById(messageId);
            if (m != null) {
                User sender = userDao.getDetailsById(m.getFromId());
                User receiver = userDao.getDetailsById(m.getToId());
        %><h1>Are you sure you want to delete this message?</h1>
        <table border="1">
            <tr>
                <th>Message ID</th>
                <th>Sender</th>
                <th>Receiver</th>
                <th>Date sent</th>
                <th>Subject</th>
                <th>Message</th>
            </tr>
            <tr>
                <td><%= m.getMessageId()%></td>
                <td><%= sender.getUserName()%></td>
                <td><%= receiver.getUserName()%></td>
                <td><%= m.getSentOn()%></td>
                <td><%= m.getSubjectLine()%></td>
                <td><%= m.getMessageContent()%></td>
            </tr>
        </table>
        <% }%>
        <form class="form-horizontal" action="FrontController" method="post">
            <input type="submit" value="Delete" class="btn btn-default">
            <a href="profile.jsp" class="btn btn-default">Go back</a>
            <input type="hidden" name="messageId" value="<%= m.getMessageId()%>"/>
            <input type="hidden" name="action" value="deleteMessage"/>
        </form>
    </body>
</html>
