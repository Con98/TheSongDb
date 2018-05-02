<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <%@include file="header.jsp"%>
        <title><%=new TextBundle("indexTitle").getText(lang)%></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>

    <body class="container container-fluid">
        <%if(session.getAttribute("login") != null){
            %>
            <script>window.location="home.jsp";</script>
            <%
        }%>
        <h1><%=new TextBundle("welcomeToSite").getText(lang)%></h1>
        <h3><%=new TextBundle("indexInfo").getText(lang)%></h3>
        <h3><%=new TextBundle("pleaseLogin").getText(lang)%> </h3>
        
        <div>
            <a class="twitter-timeline" data-width="300" data-height="500" data-theme="dark" data-link-color="#E81C4F" href="https://twitter.com/lastfm?ref_src=twsrc%5Etfw">Tweets by lastfm</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 
        </div>
    </body>
    
</html>
