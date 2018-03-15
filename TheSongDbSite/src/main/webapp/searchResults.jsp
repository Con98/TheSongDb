<%-- 
    Document   : searchResults.jsp
    Created on : Mar 10, 2018, 8:14:27 PM
    Author     : thoma
--%>
<%@page import="json.JSONException"%>
<%@page import="json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="header.jsp"%>
        <%@page import="Daos.MusicDao"%>
        <%@page import="Daos.UserDao"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=new TextBundle("results").getText(lang)%></title>
    </head>
    <body>
        <h1><%=new TextBundle("searchResults").getText(lang)%></h1>
        <%
            JSONObject test = (JSONObject) session.getAttribute("artist");
            User u = (User) session.getAttribute("user");
            if (test != null) {
                try {
                    JSONObject artist = (JSONObject) session.getAttribute("artist");
                    String name = artist.getString("name");
        %>
        <h1><a href="artistInfo.jsp?action=<%=name%>"><%=new TextBundle("clickHere").getText(lang)%> <%=name%>'<%=new TextBundle("toProfile").getText(lang)%></a></h1>
        <%
        } catch (JSONException e) {
        %>
        <h1>No artist with that name found</h1>
        <%
                }
            }
            if (u != null) {
        %>
        <h1><%=u.getFirstName()%></h1>
        <%
        } else {
        %>
        <h1>No User with that name found</h1>
        <%
            }
        %>
    </body>

</html>
