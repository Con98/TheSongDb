<%-- 
    Document   : displayTopArtists
    Created on : Mar 10, 2018, 1:51:11 AM
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
        <title>Top 10 Artists</title>
    </head>
    <body>

        <h1>Top 10 Artists Based On Current Charts</h1>
        <h2>Click an artists name to see albums by them</h2>
        <br>
        <%
            int size = Integer.parseInt(request.getParameter("size"));
            %>

        <%            MusicDao musicDao = new MusicDao();
            ArrayList<JSONObject> top10 = musicDao.getTop10Artists();
            //Number value to change image size 1=small 2=medium 3=large
            ArrayList<String> art = musicDao.getArt(size);
        %>
        <a href="displayTopArtists.jsp?size=1" class="btn btn-default">Make Art Smaller</a>
        <a href="displayTopArtists.jsp?size=2" class="btn btn-default">Make Art Larger</a>
        <%
            
            %>

        <table class="table table-responsive">
            <tr>
                <th>Chart Number</th>
                <th>Album Art</th>
                <th class="col">Name</th>
                <th class="col">LastFm-Url</th>
            </tr>

            <%
                for (int i = 0; i < top10.size(); i++) {
            %>
            <tr>
                <td class="row"><%=i + 1%></td>
                <td class="row"><img class="art" src="<%=art.get(i)%>"></td>
                <td  class="row"><a href="artistInfo.jsp?action=<%=top10.get(i).get("name")%>"><%=top10.get(i).get("name")%></a></td>
                <td class="row"><a href="<%=top10.get(i).get("url")%>"><%=top10.get(i).get("url")%></a></td>
            </tr>

            <%
                }
            %>

        </table>
    </body>
</html>
