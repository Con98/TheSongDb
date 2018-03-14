<%-- 
    Document   : loginFailed
    Created on : Dec 4, 2017, 12:34:10 PM
    Author     : Thomas
--%>

<%@page import="org.apache.commons.i18n.bundles.TextBundle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=new TextBundle("loginFailed").getText(lang) %></title>
    </head>
    <body>
        <h1><%=new TextBundle("loginFailedTryAgain").getText(lang) %></h1>
        <a href="index.jsp"><%=new TextBundle("returnHome").getText(lang) %></a>
    </body>
</html>
