<%-- 
    Document   : albumInfo
    Created on : Mar 15, 2018, 3:42:09 AM
    Author     : thoma
--%>

<%@page import="Dtos.Api.Track"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.MusicDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Album Tracks</title>
    </head>
    <body>
        <%            String artist = request.getParameter("artist");
            String album = request.getParameter("album");
            String image = request.getParameter("image");
            MusicDao mDao = new MusicDao();
            try {
                ArrayList<Track> albumInfo = mDao.getAlbumTracks(album, artist);
                if (albumInfo != null) {

        %>
        <div class="albumInfo">
        <h1>"<%=album%>"</h1>
        <img class=" img-rounded" style="border: red solid 5px;" alt="albumArt" src="<%=image%>">
        <br><br>
        <h1>Song List</h1>
        </div>
        <table class="table" style="background-color: #1e1e1e; opacity:0.8;">
            <tr>
                <th>Name</th>
                <th>Url</th>
            </tr>
        <%
            for (int i = 0; i < albumInfo.size(); i++) {
        %>
        <tr>
        <td><%=albumInfo.get(i).getName()%></td>
        <td><a class="lfmUrl" href="<%=albumInfo.get(i).getUrl()%>"><%=albumInfo.get(i).getUrl()%></a></td>
        </tr>
        <%
            }
        } else {
        %>
        </table>
        <%
            }
        } catch (NullPointerException e) {

        %>
        <h1>No Tracks found in the album "<%=album%>" by "<%=artist%>"</h1>
        <%
            }
        %>
    </body>
</html>
