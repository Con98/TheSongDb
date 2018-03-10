<%-- 
    Document   : searchResults.jsp
    Created on : Mar 10, 2018, 8:14:27 PM
    Author     : thoma
--%>
<%@page import="json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <%@ include file="header.jsp"%>
        <%@page import="Daos.MusicDao"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results</title>
    </head>
    <body>
        <h1>Search Results</h1>
        <%
            JSONObject artist = (JSONObject)session.getAttribute("artist");
            String name = artist.getString("name");
            %>
            <h1><a href="artistInfo.jsp?action=<%=name%>">Click here to go to <%=name%>'s artist profile</a></h1>
    </body>
    
</html>
