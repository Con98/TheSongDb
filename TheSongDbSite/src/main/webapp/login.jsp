<%-- 
    Document   : login
    Created on : Jan 30, 2018, 12:31:07 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= new TextBundle("login").getText(lang)%></title>
        
    </head>
    <body>
        <h1><%= new TextBundle("login").getText(lang)%></h1>
<div style="width: 50%; text-align: center;">
        <form class="form-horizontal" action="FrontController" method="post">
            <div class="form-group">
                <label class="control-label col-sm-2" for="email"><%= new TextBundle("email").getText(lang)%>:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="email" placeholder="<%= new TextBundle("enterEmail").getText(lang)%>" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="email"><%= new TextBundle("password").getText(lang)%>:</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="password" placeholder="<%= new TextBundle("enterPassword").getText(lang)%>" required>
                </div>
            </div>
            <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" value="<%= new TextBundle("login").getText(lang)%>" class="btn btn-default">
            </div>
            <br>
            

            <input type="hidden" name="action" value="login"/>
        </form>
</div>
    </body>
</html>
