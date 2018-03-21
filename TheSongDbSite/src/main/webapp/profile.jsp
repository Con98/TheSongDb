
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
    <h1><%=new TextBundle("welcome").getText(lang)%> <%=loggedUser.getUserName()%></h1>

    <%@include file="updateStatus.jsp" %>

    <br/>
    <h2><%=new TextBundle("personalInfo").getText(lang)%></h2>
    <table>
        <tr>
            <th><%=new TextBundle("name").getText(lang)%>: </th>
            <td><%=loggedUser.getFirstName()%></td>
        </tr>

        <tr>
            <th><%=new TextBundle("surname").getText(lang)%>: </th>
            <td><%=loggedUser.getSurName()%></td>
        </tr>

        <tr>
            <th><%=new TextBundle("email").getText(lang)%>: </th>
            <td><%=loggedUser.getEmail()%></td>
        </tr>
    </table>
    <section>
        <div id="rightColumn">
            <%
                FriendDao friendDao = new FriendDao("TheSongDb", "jdbc/TheSongDb");
                ArrayList<Friend> friends = friendDao.displayAllFriends(loggedUser.getUserName());

            %>
            <h1><%=loggedUser.getUserName()%><%=new TextBundle("friendsList").getText(lang)%></h1>
            <table>
                <%
                    for (Friend f : friends) {
                %>
                <tr>
                    <td><%=f.getFriend2().getFirstName()%></td>
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
                        String username = (String) user;

                        if (username != null) {
                            FriendRequestDao friendRequestDao = new FriendRequestDao("TheSongDb", "jdbc/TheSongDb");
                            ArrayList<FriendRequest> friendRequests = friendRequestDao.displayAllFriendRequests(username);
                %>
                <br/>
                <br/>
                <h1>Your New Friend Requests<%=new TextBundle("friendRequests").getText(lang)%></h1>
                <table>
                    <%
                        for (FriendRequest fr : friendRequests) {
                    %>
                    <tr>
                        <td><%=fr.getFriend2().getFirstName()%></td>
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
            </table>
        </div>
                    
    </section>
            <div id="leftColumn" style="float-left">
            <h1><%= loggedUser.getUserName()%><%=new TextBundle("statuses").getText(lang)%></h1>
            <%
                StatusDao statusDao = new StatusDao("TheSongDb", "jdbc/TheSongDb");
                ArrayList<Status> statuses = statusDao.displayOwnStatuses(loggedUser.getUserId());
                if (!statuses.isEmpty()) { %>
            <table border="1">
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
    
        <%
            MessageDao messageDao = new MessageDao("TheSongDb", "jdbc/TheSongDb");
            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            ArrayList<Message> messages = messageDao.displayAllMessages(loggedUser.getUserId());
        %>

        <h1><%= loggedUser.getUserName()%><%=new TextBundle("messages").getText(lang)%></h1>
        <table border="1">
            <% if (!messages.isEmpty()) { %>
            <tr>
                <th><%=new TextBundle("sender").getText(lang)%></th>
                <th><%=new TextBundle("receiver").getText(lang)%></th>
                <th><%=new TextBundle("timeSent").getText(lang)%></th>
                <th><%=new TextBundle("subject").getText(lang)%></th>
                <th><%=new TextBundle("message").getText(lang)%></th>
                <th><%=new TextBundle("delete").getText(lang)%></th>
            </tr>

            <%
                for (Message m : messages) {
                    User sender = userDao.getDetailsById(m.getFromId());
                    User receiver = userDao.getDetailsById(m.getToId());


            %>
            <tr>
                <td><%= sender.getUserName()%></td>
                <td><%= receiver.getUserName()%></td>
                <td><%= m.getSentOn()%></td>
                <td><%= m.getSubjectLine()%></td>
                <td><%= m.getMessageContent()%></td>
                <td><a href="deleteMessage.jsp?id=<%=m.getMessageId()%>"><%=new TextBundle("delete").getText(lang)%></a></td>
            </tr>
            <%
                }
            %>

        </table>
        <% } else {
                new TextBundle("noMessagesFound").getText(lang);
            }%>
    </div>
</body>
</html>