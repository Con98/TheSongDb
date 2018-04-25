<%-- 
    Document   : searchResults.jsp
    Created on : Mar 10, 2018, 8:14:27 PM
    Author     : thoma
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
        <%@page import="Daos.UserDao"%>
        <%@page import="Dtos.Api.Artist"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery.min.js"></script>
        <title><%=new TextBundle("results").getText(lang)%></title>
    </head>
    <body>
        <h1><%=new TextBundle("searchResults").getText(lang)%></h1>
        <div class="col-md-5" style="float:left; position: absolute;">
        <table class="table" style="background-color: #1e1e1e; opacity:0.8;">
            <tr>
            <th>Image</th>
            <th>Name</th>
            </tr>
        <%
            ArrayList<Artist> test = (ArrayList<Artist>) session.getAttribute("artist");
            User u = (User) session.getAttribute("user");
            if (test != null) {
                try {
                    for (int i = 0; i < test.size(); i++) {
                        Artist a = test.get(i);


        %>
        
            
            
            <tr>
                <td><img src="<%=a.getImage()%>"></td>
                <td><h3><a href="artistInfo.jsp?action=<%=a.getName()%>"><%=new TextBundle("clickHere").getText(lang)%> <%=a.getName()%>'<%=new TextBundle("toProfile").getText(lang)%></a></h3></td>
        </tr>
        

        <%
            }
        } catch (JSONException e) {
        %>
        
        <td><h1>No artist with that name found</h1></td>
        </table>
    </div>
        <%
                }
            }
            if (u != null) {
        %>
        <h1>User<a href="userProfile.jsp?userName=<%=u.getUserName()%>"><%=u.getFirstName() + " " + u.getSurName()%></a> was found</h1>
        <%
        } else {
        %>
        <div class="col-md-5">
        <h1>No Users Found, please try again</h1>
        </div>
        <%
            }
        %>
    </body>

</html>
