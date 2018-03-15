<%-- 
    Document   : albumInfo
    Created on : Mar 15, 2018, 3:42:09 AM
    Author     : thoma
--%>

<%@page import="json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.MusicDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String artist = request.getParameter("artist");
            String album = request.getParameter("album");
            MusicDao mDao = new MusicDao();
            ArrayList<JSONObject> albumInfo = mDao.getAlbumDetails(artist, album);
            
            %>
            <h1>Songs from <%=album%></h1>
            <%
            for(int i =0; i < albumInfo.size(); i++){
            %>
            
        <h3><%=albumInfo.get(i).get("name")%></h3>
        <%
            }
            %>
    </body>
</html>
