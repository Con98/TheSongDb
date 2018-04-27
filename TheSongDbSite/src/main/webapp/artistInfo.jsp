<%-- 
    Document   : artistInfo
    Created on : Mar 10, 2018, 5:39:33 PM
    Author     : Thomas
--%>
<%@page import="Dtos.Api.Album"%>
<%@page import="Dtos.Api.Artist"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="header.jsp"%>
        <%@page import="Daos.MusicDao"%>
        <%@page import="Dtos.Api.Artist"%>
        <%@page import="Dtos.Api.Album"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=new TextBundle("artistInfoTitle").getText(lang)%></title>
    </head>
    <body>
        <%            MusicDao musicDao = new MusicDao();
            String aName = request.getParameter("action");
            String name = null;
            Artist top10 = musicDao.getArtist(aName);
            String mbid = null;

            String ob = null;
            if (top10.getName().equals(aName)) {
                ob = top10.getImage();
                name = top10.getName();
            }


        %>

        <img class="img-circle img-responsive" style="float:left; border: red solid 5px;" src="<%=ob%>">
        <h1 style="float:left;"><%=name%><%=new TextBundle("artistsPage").getText(lang)%></h1>
        <br><br><br><br>
        <p class="bio" style="padding-left:1em;"><%=top10.getBio()%></p>
        <br><br><br><br><br><br><br><br><br>
        <%
            
            
            ArrayList<Album> albums = musicDao.getTop10Albums(aName);
            if(albums != null){
        %>
        <table class="table" style="background-color: #1e1e1e; opacity:0.8;">
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
                    
            %>
            <tr>
                <td class="row"><%=i + 1%></td>
                <td class="row"><img class="art" src="<%=albums.get(i).getImage()%>"></a></td>
                <td class="row"><a href="albumInfo.jsp?album=<%=albums.get(i).getName()%>&artist=<%=name%>&image=<%=albums.get(i).getLargeImage()%>"><%=albums.get(i).getName()%></td>
                <td class="row"><%=albums.get(i).getPlaycount()%></td>
                <td class="row"><a class="lfmUrl" href="<%=albums.get(i).getUrl()%>"><%=albums.get(i).getUrl()%></a></td>
                <input type="hidden" value="">
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
