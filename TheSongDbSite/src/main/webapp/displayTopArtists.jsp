<%-- 
    Document   : displayTopArtists
    Created on : Mar 10, 2018, 1:51:11 AM
    Author     : thoma
--%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
        <%@page import="Dtos.Api.Artist"%>
        <%@page import="Dtos.Api.Album"%>
        <%@page import="Dtos.Api.Track"%>
        <%@page import="Daos.MusicDao"%>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= new TextBundle("top10Artists").getText(lang)%> </title>
    </head>
    <body class="container container-fluid">

        <h1><%= new TextBundle("top10BasedOnCharts").getText(lang)%> </h1>
        <h2><%=new TextBundle("clickOnArtistsName").getText(lang)%> </h2>
        <br>

        <%            MusicDao musicDao = new MusicDao();
            ArrayList<Artist> top10 = musicDao.getTop10Artists();
            //Number value to change image size 1=small 2=medium 3=large
%>

        <table class="table table-responsive" style="background-color: #1e1e1e; opacity:0.8;">
            <tr>
                <th><%=new TextBundle("chartNumber").getText(lang)%></th>
                <th><%=new TextBundle("albumArt").getText(lang)%></th>
                <th class="col"><%=new TextBundle("name").getText(lang)%></th>
                <th class="col"><%=new TextBundle("lastFmURL").getText(lang)%></th>
            </tr>
            <%
                for (int i = 0; i < top10.size(); i++) {
            %>
            <tr>
                <td class="row"><%=i + 1%></td>
                <td class="row"><img class="art" src="<%=top10.get(i).getImage()%>"></td>
                <td  class="row"><a href="artistInfo.jsp?action=<%=top10.get(i).getName()%>"><%=top10.get(i).getName()%></a></td>
                <td class="row"><a href="<%=top10.get(i).getUrl()%>"><%=top10.get(i).getUrl()%></a></td>

            </tr>

            <%
                }
            %>



        </table>
    </body>
</html>
