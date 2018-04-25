
<%@page import="Dtos.FriendRequest"%>
<%@page import="Daos.FriendRequestDao"%>
<%@page import="Daos.StatusDao"%>
<%@page import="Dtos.Status"%>
<%@page import="Dtos.Message"%>
<!DOCTYPE html>
<%-- 
    Document   : profile
    Created on : 01-Feb-2018, 11:21:18
    Author     : emmet
--%>


<head>
    <%@page import="Dtos.User" %>
    <%@page import="Daos.UserDao" %>
    <%@page import="Daos.MessageDao" %>
    <%@ include file="header.jsp"%>
    <%@page import="Dtos.Friend" %>
    <%@page import="Daos.FriendDao"%>
    <%@page import="java.util.ArrayList"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <title><%=new TextBundle("profile").getText(lang) %></title>
</head>

<body>

    <%        try {
            if (session.getAttribute("login") == null) {
    %>

    <%
        }
        if (session.getAttribute("login") != null) {
            User loggedUser = (User) session.getAttribute("login");
            boolean userN = loggedUser.isType();

            if (loggedUser.isType() == userN) {
    %>

    <% } else {%>
    <!--Regular Nav-->
    <%
                }
            }
        } catch (Exception ex) {
            out.println(ex.getMessage());
        }
    %>

    <h1><%=new TextBundle("welcomeToProfile").getText(lang) %></h1>
    <%
        User loggedUser = (User) session.getAttribute("login");
    %>

    <%
        if (loggedUser != null) {

    %>
    <section>
    <div id="leftColumn">
    <h1><%=new TextBundle("welcome").getText(lang)%> <%=loggedUser.getUserName()%></h1>

    <%@include file="updateStatus.jsp" %>

    <br/>
    <h2><%=new TextBundle("personalInfo").getText(lang)%></h2>
    <table class="table table-bordered">
        <tr>
            <th class="col"><%=new TextBundle("name").getText(lang)%>: </th>
            <td class="row"><%=loggedUser.getFirstName()%></td>
        </tr>

        <tr>
            <th class="col"><%=new TextBundle("surname").getText(lang)%>: </th>
            <td class="row"><%=loggedUser.getSurName()%></td>
        </tr>

        <tr>
            <th class="col"><%=new TextBundle("email").getText(lang)%>: </th>
            <td class="row"><%=loggedUser.getEmail()%></td>
        </tr>
    </table>
    </section>
        <div id="leftColumn">
        <section>
            <h1><%= loggedUser.getUserName()%><%=new TextBundle("statuses").getText(lang)%></h1>
            <%
                StatusDao statusDao = new StatusDao("TheSongDb", "jdbc/TheSongDb");
                ArrayList<Status> statuses = statusDao.displayOwnStatuses(loggedUser.getUserId());
                if (!statuses.isEmpty()) { %>
            <table class="table table-bordered">
                <tr>
                    <th><%=new TextBundle("status").getText(lang)%></th>
                    <th><%=new TextBundle("datePublished").getText(lang)%></th>
                    <th><%=new TextBundle("delete").getText(lang)%></th>
                </tr>

                <%
                    for (Status s : statuses) {
                %>
                <tr>
                    <td><%= s.getStatusContent()%></td>
                    <td><%= s.getSentOn()%></td>
                    <td><a href="deleteStatus.jsp?id=<%= s.getStatusId()%>"><%=new TextBundle("delete").getText(lang)%></a></td>
                </tr>
                <%
                    }
                %>

            </table>
            <% } else {
                    new TextBundle("noStatusesFound").getText(lang);
                }%>
    </section>
        </div>
    <section>
        <div id="rightColumn">
            <%
                FriendDao friendDao = new FriendDao("TheSongDb", "jdbc/TheSongDb");
                ArrayList<Friend> friends = friendDao.displayAllFriends(loggedUser.getUserName());

            %>
            <h1><%=loggedUser.getUserName()%><%=new TextBundle("friendsList").getText(lang)%></h1>
            <table class="table table-bordered">
                <%
                    for (Friend f : friends) {
                %>
                <tr>
                    <td class="row"><%=f.getFriend2().getFirstName()%></td>
                    <%
                            }
                        } else {
                            out.println("No Friends Found");
                        }
                    %>
                </tr>
                <br/>
                <%
                    if (loggedUser != null) {
                        UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
                        Object user = session.getAttribute("userName");
                        String username = loggedUser.getUserName();

                        if (username != null) {
                            FriendRequestDao friendRequestDao = new FriendRequestDao("TheSongDb", "jdbc/TheSongDb");
                            ArrayList<String> friendRequests = friendRequestDao.displayAllFriendRequests(username);
                %>
            </table>
                <h1><%=new TextBundle("friendRequests").getText(lang)%></h1>
                <table class="table table-bordered">
                    <%
                        for (String fr : friendRequests) {
                    %>
                    <tr>
                        <td><%=fr%></td>
                        <form action="FrontController" method="post">
        <input type="hidden" name="currentUser" value="<%=loggedUser.getUserName()%>">
        <input type="hidden" name="friendRequest" value="<%=fr%>">
        <td><input type="submit" value="Accept Friend Request" class="btn btn-default"></td>
         <input type="hidden" name="action" value="AcceptFriend"/>
    </form>
                    <form action="FrontController" method="post">
        <input type="hidden" name="currentUser" value="<%=loggedUser.getUserName()%>">
        <input type="hidden" name="friendRequest" value="<%=fr%>">
        <td><input type="submit" value="Deny Friend Request" class="btn btn-default"></td>
         <input type="hidden" name="action" value="DenyFriend"/>
    </form>
                        <%
                                    }
                                } else {
                                    out.println("No Friend Requests Found");
                                }
                            }
                        %>
                    </tr>
                </table>
                </tr>
                <%

                %>
            </table>
        </div>
    </section>
            
    
</body>
</html>