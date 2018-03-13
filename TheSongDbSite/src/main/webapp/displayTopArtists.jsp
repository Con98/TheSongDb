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
        <title><%= new TextBundle("top10Artists").getText(lang)%> </title>
    </head>
    <body>

        <h1><%= new TextBundle("top10BasedOnCharts").getText(lang)%> </h1>
        <h2><%=new TextBundle("clickOnArtistsName").getText(lang)%> </h2>
        <br>
        <%
            int size = Integer.parseInt(request.getParameter("size"));
            %>

        <%            MusicDao musicDao = new MusicDao();
            ArrayList<JSONObject> top10 = musicDao.getTop10Artists();
            //Number value to change image size 1=small 2=medium 3=large
            ArrayList<String> art = musicDao.getArt(size);
        %>
        <a href="displayTopArtists.jsp?size=1" class="btn btn-default"><%=new TextBundle("makeArtSmaller").getText(lang)%> </a>
        <a href="displayTopArtists.jsp?size=2" class="btn btn-default"><%=new TextBundle("makeArtLarger").getText(lang)%></a>

        <table class="table table-responsive">
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
