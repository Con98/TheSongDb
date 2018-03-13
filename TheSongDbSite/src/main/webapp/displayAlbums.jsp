<%-- 
    Document   : displayAlbums
    Created on : Mar 10, 2018, 2:00:05 AM
    Author     : thoma
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <%@ include file="header.jsp"%>
        <%@page import="Daos.MusicDao"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=new TextBundle("topAlbums").getText(lang)%></title>
    </head>
    <body>
        <%
            String mbid = request.getParameter("action");
            MusicDao musicDao = new MusicDao();
            ArrayList<JSONObject> albums = musicDao.getTop10Albums(mbid);
            %>
            <h1><%=new TextBundle("top10Albums").getText(lang)%></h1>
            <table class="table">
            <tr>
                <th><%=new TextBundle("chartNumber").getText(lang)%></th>
                <th class="col"><%=new TextBundle("name").getText(lang)%></th>
                <th class="col"><%=new TextBundle("playCount").getText(lang)%></th>
                <th class="col"><%=new TextBundle("lastFmURL").getText(lang)%></th>
            </tr>

            <%
                for (int i = 0; i < albums.size(); i++) {
            %>
            <tr>
                <td class="row"><%=i + 1%></td>
                <td  class="row"><%=albums.get(i).get("name")%></td>
                <td class="row"><%=albums.get(i).get("playcount")%></td>
                <td class="row"><%=albums.get(i).get("url")%></td>
            </tr>

            <%
                }
            %>
        </table>
    </body>
</html>
