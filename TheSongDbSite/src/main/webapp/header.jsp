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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>


    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <%
                    Object logName = session.getAttribute("login");
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
                <%
                    }
                    %>
            </div>
            <ul class="nav navbar-nav">
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Friends<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Friend 1</a></li>
                        <li><a href="#">Friend 2</a></li>
                        <li><a href="#">Friend 3</a></li>
                    </ul>
                </li>
                <li><a href="#">Music</a></li>
            </ul>
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
                    <%
                        }
                    %>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-asterisk"></span> Settings <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <%
                    
                    if (logName != null) {
                        User user = (User) logName;
                        session.setAttribute("userId", user.getUserId());
                        int userId = user.getUserId();
                %>

                <li><a href="FrontController?action=logout">Logout</a></li>

                <%
                } else{
                %>
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
