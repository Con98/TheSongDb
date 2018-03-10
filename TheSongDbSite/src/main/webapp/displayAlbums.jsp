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
        <title></title>
    </head>
    <body>
        <%
            String mbid = request.getParameter("action");
            MusicDao musicDao = new MusicDao();
            ArrayList<JSONObject> albums = musicDao.getTop10Albums(mbid);
            %>
            <h1>Top 10 Albums</h1>
            <table class="table">
            <tr>
                <th>Chart Number</th>
                <th class="col">Name</th>
                <th class="col">PlayCount</th>
                <th class="col">LastFm-Url</th>
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
