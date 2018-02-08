<%-- 
    Document   : login
    Created on : Jan 30, 2018, 12:31:07 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <h1>Login</h1>
<div style="width: 50%; text-align: center;">
        <form class="form-horizontal" action="FrontController" method="post">
            <div class="form-group">
                <label class="control-label col-sm-2" for="email">Email:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="email" placeholder="Enter Email" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="email">Password:</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="password" placeholder="Enter Password" required>
                </div>
            </div>
            <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" value="Login" class="btn btn-default">
            </div>
            <br>
            

            <input type="hidden" name="action" value="login"/>
        </form>
</div>
    </body>
</html>
