<%-- 
    Document   : deleteMessage
    Created on : 02-Mar-2018, 16:23:19
    Author     : tadas
--%>

<%@page import="Dtos.Status"%>
<%@page import="Daos.StatusDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=new TextBundle("deleteQuestion").getText(lang)%></title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <%  StatusDao statusDao = new StatusDao("TheSongDb", "jdbc/TheSongDb");
            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            String statusId = request.getParameter("id");
            Status s = null;
            s = statusDao.findStatusById(statusId);
            if (s != null) {
                User poster = userDao.getDetailsById(s.getUserId());
        %><h1><%=new TextBundle("AreUSureStatus").getText(lang)%></h1>
        <table border="1">
            <tr>
                <th><%=new TextBundle("statusID").getText(lang)%></th>
                <th><%=new TextBundle("poster").getText(lang)%></th>
                <th><%=new TextBundle("datePublished").getText(lang)%></th>
                <th><%=new TextBundle("status").getText(lang)%></th>
            </tr>
            <tr>
                <td><%=s.getStatusId()%></td>
                <td><%=poster.getUserName()%></td>
                <td><%=s.getSentOn()%></td>
                <td><%=s.getStatusContent()%></td>
            </tr>
        </table>
        <% }%>
        <form class="form-horizontal" action="FrontController" method="post">
            <input type="submit" value="<%=new TextBundle("delete").getText(lang)%>" class="btn btn-default">
            <a href="profile.jsp" class="btn btn-default"><%=new TextBundle("goBack").getText(lang)%></a>
            <input type="hidden" name="statusId" value="<%= s.getStatusId()%>"/>
            <input type="hidden" name="action" value="deleteStatus"/>
        </form>
    </body>
</html>
