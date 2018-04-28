<%-- 
    Document   : searchResults.jsp
    Created on : Mar 10, 2018, 8:14:27 PM
    Author     : thoma
--%>
<%@page import="Dtos.Api.Album"%>
<%@page import="javax.json.JsonException"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="header.jsp"%>
        <%@page import="Daos.MusicDao"%>
        <%@page import="Daos.UserDao"%>
        <%@page import="Dtos.Api.Artist"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery.min.js"></script>
        <title><%=new TextBundle("results").getText(lang)%></title>
    </head>
    <body class="container-fluid">
        <h1><%=new TextBundle("searchResults").getText(lang)%></h1>
        
        <!--Users-->
            
            <div class="col-sm-4">
                <div class="table-responsive">
                <table class="table table-bordered" style="background-color: #1e1e1e; opacity:0.8;">
                    <thead>
                    <h2>User Results</h2>
                    </thead>
                    <tbody>
                
                <%
                    ArrayList<User> allUsers = (ArrayList<User>) session.getAttribute("user");
                if (allUsers != null) {

                        for (int i = 0; i < allUsers.size(); i++){
                %>
                <tr>
                    <td><h3>User <a href="userProfile.jsp?userName=<%=allUsers.get(i).getUserName()%>"><%= allUsers.get(i).getFirstName()+ " " + allUsers.get(i).getSurName()%></a> was found</h3></td>
            </tr>
                <%
                    }
                } else {
                %>
                <tr>
                <td><h1>No Users Found, please try again</h1></td>
                </tr>
                <%
                    }
                %>
                    </tbody>
                </table>
            </div>
            </div>
        <!--Albums-->
            <div class="col-sm-4">
                <div class="table-responsive">
                <table class="table table-bordered" style="background-color: #1e1e1e; opacity:0.8;">
                    <thead>
                    <h2>Album Results</h2>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<Album> albums = (ArrayList<Album>) session.getAttribute("albums");
                        if (albums != null) {
                            try {
                                for (int i = 0; i < albums.size(); i++) {
                                    Album a = albums.get(i);
                    %>
                    <tr>
                        <td><img src="<%=a.getImage()%>"></td>
                        <td><a class="lfmUrl" href="albumInfo.jsp?album=<%=a.getName()%>&artist=<%=a.getArtist()%>&image=<%=a.getLargeImage()%>"><%=a.getName()%></a></td>
                        <td><h3><a class="lfmUrl" href="artistInfo.jsp?action=<%=a.getArtist()%>"><%=a.getArtist()%></a></h3></td>
                    </tr>
                    <%
                        }
                    } catch (NullPointerException e) {
                    %>
                    <td><h1>No Albums with that name found</h1></td>

                    <%}
                    }%>
                </tbody>
                </table></div>
            </div>
        <!--Artists-->
        <div class="row">
            <div class="col-sm-4">
                <div class="table-responsive">
                <table class="table table-bordered" style="background-color: #1e1e1e; opacity:0.8;">
                    <thead>
                    <h2>Artist Results</h2>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<Artist> test = (ArrayList<Artist>) session.getAttribute("artist");
                        
                        if (test != null) {
                            try {
                                for (int i = 0; i < test.size(); i++) {
                                    Artist a = test.get(i);
                    %>
                    <tr>
                        <td><img src="<%=a.getImage()%>"></td>
                        <td><h3><a class="lfmUrl" href="artistInfo.jsp?action=<%=a.getName()%>"><%=new TextBundle("clickHere").getText(lang)%> <%=a.getName()%>'<%=new TextBundle("toProfile").getText(lang)%></a></h3></td>
                    </tr>
                    <%
                        }
                    } catch (NullPointerException e) {
                    %>
                    <td><h1>No artists with that name found</h1></td>
                </tbody>
                </table></div>
                <%}
                    }
                %>
            </div>
        
            
            
            </div>

    </body>
</html>
