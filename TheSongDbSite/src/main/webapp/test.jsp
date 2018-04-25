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
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/extra.css" rel="stylesheet">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <%@page import="Daos.MusicDao"%>
        <%@page import="Daos.UserDao"%>
        <%@page import="Dtos.Api.Artist"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results</title>
    </head>
    
    <body>
        <div class="container">
            <div class="row">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Image</th>
                                <th>Name</th>
                            </tr>
                        </thead>
                        
                        <tbody id="myTable">
                            <%
                            ArrayList<Artist> test = (ArrayList<Artist>) session.getAttribute("artist");
                            if (test != null) {
                                try {
                                    for (int i = 0; i < test.size(); i++) {
                                        Artist a = test.get(i);
                        %>
                            <tr>
                                <td><%=i + 1%></td>
                                <td><img src="<%=a.getImage()%>"></td>
                                <td><h3><a href="artistInfo.jsp?action=<%=a.getName()%>"><%=a.getName()%></a></h3></td>
                            </tr>
                            <%
                                }
                                %>
                        </tbody>
                    </table>   
                </div>
                <div class="col-md-12 text-center">
                    <ul class="pagination" id="myPager"></ul>
                </div>
            </div>
        </div>
        <%
            
        } catch (JSONException e) {
        %>

        <h1>No artist with that name found</h1>
        <%
                }
            }
            %>
    </body>

</html>
