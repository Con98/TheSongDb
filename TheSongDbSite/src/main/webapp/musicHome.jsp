<%-- 
    Document   : musicHome
    Created on : Mar 10, 2018, 1:28:37 AM
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome to the Music section</h1>
        <br>
        <%
            MusicDao musicDao = new MusicDao();
            ArrayList<JSONObject> top10 = musicDao.getTop10Artists();
            %>
            
            
            <table class="table">
            <tr>
                <th>Chart Number</th>
                <th class="col">Name</th>
                <th class="col">PlayCount</th>
                <th class="col">Url</th>
            </tr>

            <%
                for (int i = 0; i < top10.size(); i++) {
            %>
            <tr>
                <td class="row"><%=i +1%></td>
                <td class="row"><%=top10.get(i).get("name")%></td>
                <td class="row"><%=top10.get(i).get("playcount")%></td>
                <td class="row"><%=top10.get(i).get("url")%></td>
            </tr>
                
            <%
                }
            %>

        </table>
    </body>
</html>
