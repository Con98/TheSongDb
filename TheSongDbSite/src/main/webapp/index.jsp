<%@page import="java.lang.Object"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ResourceBundle"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <%@include file="header.jsp"%>
        <%@include file="internationalization.jsp" %>
        <title>Welcome</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>

    <body>
        <%            
            String locale = "en";
            TextBundle welcome = new TextBundle("welcome");
        %>

        <h1><%=welcome.getText(new Locale(locale))%></h1>
        <h3>On this site we use The LastFm Api in order to bring you a convenient place to find out the currently most popular music</h3>
        <h3>Please login or register to get started</h3>
    </body>
</html>
