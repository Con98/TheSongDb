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
        <h1 style="text-align: center;"><%= new TextBundle("login").getText(lang)%></h1>
        <form style="text-align: center; margin-left: auto; margin-right: auto; width:50%;" class="form-group" action="FrontController" method="post">
              <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" name="email" placeholder="<%= new TextBundle("enterEmail").getText(lang)%>" required>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" name="password" placeholder="<%= new TextBundle("enterPassword").getText(lang)%>" required>
  </div>

  <button type="submit" class="btn btn-primary">Submit</button>

            

            <input type="hidden" name="action" value="login"/>
        </form>

            <form style="text-align: center; margin-left: auto; margin-right: auto; width:50%;" action="FrontController" method="post">

</form>
    </body>
</html>
