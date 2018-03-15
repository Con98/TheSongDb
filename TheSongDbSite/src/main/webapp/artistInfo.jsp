<%-- 
    Document   : artistInfo
    Created on : Mar 10, 2018, 5:39:33 PM
    Author     : Thomas
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=new TextBundle("artistInfoTitle").getText(lang)%></title>
    </head>
    <body>
        <%            MusicDao musicDao = new MusicDao();
            String aName = request.getParameter("action");
            String name = null;
            JSONObject top10 = musicDao.getArtist(aName);
            JSONObject bio = musicDao.getArtistBio(aName);
            String mbid = null;

            String ob = null;
            if (top10.get("name").equals(aName)) {
                JSONArray images = top10.getJSONArray("image");
                ob = images.getJSONObject(4).get("#text").toString();
                name = top10.getString("name");
            }


        %>

        <img class="img-circle img-responsive" style="float:left;" src="<%=ob%>">
        <h1 style="float:left;"><%=name%><%=new TextBundle("artistsPage").getText(lang)%></h1>
        <br><br><br><br>
        <p><%=bio.getString("summary")%></p>
        <br><br><br><br><br><br><br><br><br>
        <%
            ArrayList<JSONObject> albums = musicDao.getTop10Albums(aName);
            if(albums != null){
        %>
        <table class="table">
            <h1>Top 10 Albums</h1>
            <tr>
                <th><%=new TextBundle("chartNumber").getText(lang)%></th>
                <th class="col"><%=new TextBundle("albumArt").getText(lang)%></th>
                <th class="col"><%=new TextBundle("name").getText(lang)%></th>
                <th class="col"><%=new TextBundle("playCount").getText(lang)%></th>
                <th class="col"><%=new TextBundle("lastFmURL").getText(lang)%> </th>
            </tr>
            <%
                for (int i = 0; i < albums.size(); i++) {
                    ArrayList<String> art = musicDao.getAlbumArt(1, aName);
            %>
            <tr>
                <td class="row"><%=i + 1%></td>
                <td class="row"><img class="art" src="<%=art.get(i)%>"></td>
                <td  class="row"><a href="albumInfo.jsp?artist=<%=aName%>&album=<%=albums.get(i).get("name")%>"><%=albums.get(i).get("name")%></a></td>
                <td class="row"><%=albums.get(i).get("playcount")%></td>
                <td class="row"><a href="<%=albums.get(i).get("url")%>"><%=albums.get(i).get("url")%></a></td>
            </tr>
            <%
                }
                }else{
            %>
            <h1>No albums found</h1>
            <%
                }
                %>
        </table>
    </body>
</html>
