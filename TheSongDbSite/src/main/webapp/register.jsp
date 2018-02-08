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
        <title>Sign Up</title>
        
        <%@include file="header.jsp" %>
        
    </head>
    <body>
        <h1 >Register</h1>
<div style="width: 50%; text-align: center;">
        <form class="form-horizontal" action="FrontController" method="post">
            <div class="form-group">
                <label class="control-label col-sm-2" for="firstName">First Name:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="firstName" placeholder="Enter First Name" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="surName">Surname:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="surName" placeholder="Enter Surname" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="userName">Username:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="userName" placeholder="Enter Username" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="email">Email:</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" name="email" placeholder="Enter email" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="password">Password:</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="password" placeholder="Enter password" required>
                </div>
            </div>
            <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" value="Register" class="btn btn-default">
            </div>
            <br>

            <input type="hidden" name="action" value="register"/>
        </form>
</div>
    </body>
</html>
