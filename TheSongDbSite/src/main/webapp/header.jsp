<%-- 
    Document   : header
    Created on : Jan 29, 2018, 3:53:24 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import="java.util.Locale"%>
        <%@page import="java.util.ResourceBundle"%>
        <%@page import="Daos.UserDao"%>
        <%@page import="Dtos.User"%>
        <%@include file="internationalization.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

    </head>


    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <%                    Object logName = session.getAttribute("login");
                    if (logName != null) {
                        User user = (User) logName;
                        session.setAttribute("userId", user.getUserId());
                        int userId = user.getUserId();
                %>
                <a class="navbar-brand" href="home.jsp">TheSongDb</a>

                <%
                } else {
                %>
                <a class="navbar-brand" href="index.jsp">TheSongDb</a>
                <%                    }
                %>
            </div>
            <%
                if (logName != null) {
                    User user = (User) logName;
                    session.setAttribute("userId", user.getUserId());
                    int userId = user.getUserId();
            %>
            <ul class="nav navbar-nav">
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Friends<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Friend 1</a></li>
                        <li><a href="#">Friend 2</a></li>
                        <li><a href="#">Friend 3</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Music<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="displayTopArtists.jsp?size=1">Top 10 Artists</a></li>
                    </ul>
                </li>
                <li><a href="sendMessage.jsp">Send message</a></li>
                <form class="navbar-form navbar-left" action="FrontController" method="post">
                    <div class="input-group">
                        <input type="text" class="form-control" name="search" placeholder="Search">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                        </div>
                    </div>
                    <input type="hidden" name="action" value="search"/>
                </form> 
            </ul>
            <%
                }
            %>
            <ul class="nav navbar-nav navbar-right">
                <%
                    if (logName != null) {
                        User user = (User) logName;
                        session.setAttribute("userId", user.getUserId());
                        int userId = user.getUserId();
                %>

                <li><a href="profile.jsp"><span class="glyphicon glyphicon-user"></span> Hello <%= user.getFirstName()%></a></li>

                <%
                } else {
                %>
                <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Register</a></li>
                <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    <%                        }
                    %>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-asterisk"></span> Settings <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <%
                            if (logName != null) {
                                User user = (User) logName;
                                session.setAttribute("userId", user.getUserId());
                                int userId = user.getUserId();
                                try {
                                    String locale = request.getParameter("lang");
                                    if (!request.getParameterMap().containsKey("lang") || locale.equalsIgnoreCase("lt")) { %>
                        <li><a href="?lang=en">Keisti &#303; angl&#371; kalb&#261;</a></li><%} else {%>
                        <li><a href="?lang=lt">Switch to Lithuanian</a></li><% }
                            } catch (NullPointerException ex) {
                                System.out.println("An error occured when trying to get language parameter from url:" + ex);
                            } %>
                        <li><a href="FrontController?action=logout">Logout</a></li>


                        <%
                        } else {
                            try {
                                String locale = request.getParameter("lang");
                                if (!request.getParameterMap().containsKey("lang") || locale.equalsIgnoreCase("en")) { %>
                        <li><a href="?lang=lt">Switch to Lithuanian</a></li><%} else {%>
                        <li><a href="?lang=en">Switch to English</a></li><% }
                            } catch (NullPointerException ex) {
                                System.out.println("An error occured when trying to get language parameter from url:" + ex);
                            } %>
                        <li><a href="#">Page 1-2</a></li>
                        <li><a href="#">Page 1-3</a></li>
                            <%
                                }
                            %>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</body>

</html>
