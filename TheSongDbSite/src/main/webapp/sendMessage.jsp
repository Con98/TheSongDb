<%-- 
    Document   : register
    Created on : Jan 30, 2018, 12:31:36 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sending message</title>

        <%@include file="header.jsp" %>

    </head>
    <body>

        <%  
            try {
                UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
                User loggedUser = (User) session.getAttribute("login");
                String userName = loggedUser.getUserName();
                int userId = loggedUser.getUserId();
        %>
        <h1><%=userName%> is sending a message</h1>
        <div style="width: 50%; text-align: center;">
            <form class="form-horizontal" action="FrontController" method="post">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="toId">To:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="toId" placeholder="Enter user ID" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="subjectLine">Subject:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="subjectLine" placeholder="Enter Subject" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="messageContent">Message:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="messageContent" placeholder="Enter message" required>
                    </div>
                </div>
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" value="Send message" class="btn btn-default">
                </div>
                <br>

                <input type="hidden" name="fromId" value="<%= userId%>"/>
                <input type="hidden" name="action" value="sendMessage"/>
            </form>
        </div>
        <% } catch (NullPointerException ex) {
                //Display an error message to the log
                System.out.println("An error occured when trying to send a message: " + ex.getMessage());
            }%>
    </body>
    <script
</html>
