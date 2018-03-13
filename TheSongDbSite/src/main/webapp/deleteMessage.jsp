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
        <title><%=new TextBundle("deleteQuestion").getText(lang)%></title>
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
        %><h1><%=new TextBundle("AreUSureMessage").getText(lang)%> </h1>
        <table border="1">
            <tr>
                <th><%=new TextBundle("messageID").getText(lang)%> </th>
                <th><%=new TextBundle("sender").getText(lang)%> </th>
                <th><%=new TextBundle("receiver").getText(lang)%> </th>
                <th><%=new TextBundle("timeSent").getText(lang)%> </th>
                <th><%=new TextBundle("subject").getText(lang)%> </th>
                <th><%=new TextBundle("message").getText(lang)%></th>
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
            <input type="submit" value="<%=new TextBundle("delete").getText(lang)%>" class="btn btn-default">
            <a href="profile.jsp" class="btn btn-default"><%=new TextBundle("goBack").getText(lang)%> </a>
            <input type="hidden" name="messageId" value="<%= m.getMessageId()%>"/>
            <input type="hidden" name="action" value="deleteMessage"/>
        </form>
    </body>
</html>
