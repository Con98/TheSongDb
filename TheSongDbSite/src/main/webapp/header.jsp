<%-- 
    Document   : header
    Created on : Jan 29, 2018, 3:53:24 PM
    Author     : Thomas
--%>

<%@page import="Dtos.Friend"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.FriendDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import="java.util.Locale"%>
        <%@page import="java.util.ResourceBundle"%>
        <%@page import="Daos.UserDao"%>
        <%@page import="Dtos.User"%>
        <%@include file="createLocale.jsp" %>
        <%@include file="loginCheck.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/extra.css" rel="stylesheet">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

    </head>
    <script>
        $(document).ready(function () {
            $('.dropdown-submenu a.test').on("click", function (e) {
                $(this).next('ul').toggle();
                e.stopPropagation();
                e.preventDefault();
            });
        });
    </script>
    <%        int toId = 0;
    %>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <%                    Object logName = session.getAttribute("login");
                    if (logName != null) {
                        User user = (User) logName;
                        session.setAttribute("userId", user.getUserId());
                        int userId = user.getUserId();
                %>
                
                
                <a href="https://www.last.fm/home"><img src="images/lastfmicon.png" alt="" width="50" height="50"  /></a>
                
                <a class="navbar-brand" href="home.jsp">TheSongDb /</a>
                
                <%
                } else {
                %>
                <a href="https://www.last.fm/home"><img src="images/lastfmicon.png" alt="" width="50" height="50"  /></a>
                <a class="navbar-brand" href="index.jsp">TheSongDb /</a>
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
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><%=new TextBundle("friends").getText(lang)%><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <%
                            FriendDao fDao = new FriendDao("TheSongDb", "jdbc/TheSongDb");
                            ArrayList<Friend> friends = fDao.displayAllFriends(user.getUserName());
                            for (Friend f : friends) {
                        %>
                        <li class="dropdown-submenu">
                            <a class="test"href="#"><%=f.getFriend2().getFirstName()%> <%=f.getFriend2().getSurName()%><span class="caret"></span></a>

                            <ul class="dropdown-menu">
                                <li><a href="userProfile.jsp?userName=<%=f.getFriend2().getUserName()%>">View Profile</a></li>
                                <li class="dropdown-submenu">
                                    <a class="test" href="#">Send Message</a>
                                        <ul class="dropdown-menu">
                                            <div>
                                            <form class="form-horizontal" action="FrontController" method="post">



                                <h3 style="text-align:center;"><%=new TextBundle("subject").getText(lang)%></h3>
                                <input type="hidden"name="toId" value="<%=f.getFriend2().getUserId()%>" required>
                                

                                <input type="text" class="form-control" name="subjectLine" placeholder="<%=new TextBundle("enterSubject").getText(lang)%>" required>

                                <div class="form-group" style="text-align:center;">


                                    <h3><%=new TextBundle("message").getText(lang)%></h3>
                                    <textarea rows="4" cols="50" type="text" class="form-control" name="messageContent" placeholder="<%=new TextBundle("enterMessage").getText(lang)%>" required></textarea>

                                </div>

                                <input type="submit" value="<%=new TextBundle("sendMessage").getText(lang)%>" class="btn btn-default">
                                <br>

                                <input type="hidden" name="fromId" value="<%= userId%>"/>
                                <input type="hidden" name="action" value="sendMessage"/>
                            </form>
                                            </div>
                                        </ul>
                                    </li>


                                        

                                    </a></li>
                        
                            </ul>
                        </li>
                        <%
                            }
                        %>

                    </ul>



                </li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><%=new TextBundle("music").getText(lang)%><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="displayTopArtists.jsp"><%=new TextBundle("top10Artists").getText(lang)%></a></li>
                    </ul>
                </li>
                <li><a href="inbox.jsp">Inbox</a></li>
                <form class="navbar-form navbar-left" action="FrontController" method="post">
                    <div class="input-group">
                        <input type="text" class="form-control" name="search" placeholder="<%=new TextBundle("search").getText(lang)%>">
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

                <li><a href="profile.jsp"><span class="glyphicon glyphicon-user"></span> <%=new TextBundle("hello").getText(lang)%> <%= user.getFirstName()%></a></li>

                <%
                } else {
                %>
                <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> <%=new TextBundle("register").getText(lang)%></a></li>
                <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> <%=new TextBundle("login").getText(lang)%></a></li>
                    <%                        }
                    %>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-asterisk"></span> <%=new TextBundle("settings").getText(lang)%> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <%
                            if (logName != null) {
                                User user = (User) logName;
                                session.setAttribute("userId", user.getUserId());
                                int userId = user.getUserId();
                        %>
                        <li><label for="cld">Change Language:</label></li>
                        <li id="cld"><%@include file="internationalization.jsp" %></li>
                        <li><a href="FrontController?action=logout"><%=new TextBundle("logout").getText(lang)%></a></li>
                        <li><a href="help.jsp">Help Page</a></li>
                            <%
                                if (user.isType() == true) {

                            %>
                        <li><a href="adminSettings.jsp">Admin Settings</a></li>
                            <%                            }
                            } else {
                            %>
                        <li><label for="cld">Change Language:</label></li>
                        <li><%@include file="internationalization.jsp" %></li>
                        <li><a href="help.jsp">Help Page</a></li>
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
