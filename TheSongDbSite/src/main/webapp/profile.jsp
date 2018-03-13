
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
    <%@page import = "Dtos.User" %>
    <%@page import = "Daos.UserDao" %>
    <%@page import = "Daos.MessageDao" %>
    <%@ include file="header.jsp"%>
    <%@page import="Dtos.Friend" %>
    <%@page import="Daos.FriendDao"%>
    <%@page import="java.util.ArrayList"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <title>Profile</title>
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

    <h1>Welcome To Your Profile</h1>
    <%
        User loggedUser = (User) session.getAttribute("login");
    %>

    <%
        if (loggedUser != null) {

    %>
    <h1>Welcome <%=loggedUser.getUserName()%></h1>

    <%@include file="updateStatus.jsp" %>

    <br/>
    <h2>Personal Info</h2>
    <table>
        <tr>
            <th>First Name: </th>
            <td><%=loggedUser.getFirstName()%></td>
        </tr>

        <tr>
            <th>Surname: </th>
            <td><%=loggedUser.getSurName()%></td>
        </tr>

        <tr>
            <th>Email Address: </th>
            <td><%=loggedUser.getEmail()%></td>
        </tr>
    </table>
    <section>
        <div id="rightColumn">
            <%
                FriendDao friendDao = new FriendDao("TheSongDb", "jdbc/TheSongDb");
                ArrayList<Friend> friends = friendDao.displayAllFriends(loggedUser.getUserName());

            %>
            <h1><%=loggedUser.getUserName()%>'s Friend List</h1>
            <table>
                <%
                    for (Friend f : friends) {
                %>
                <tr>
                    <td><%=f.getFriend2()%></td>
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
                <h1>Friend Requests</h1>
                <table>
                    <%
                        for (FriendRequest fr : friendRequests) {
                    %>
                    <tr>
                        <td><%=fr.getFriend2()%></td>
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
            <h1><%= loggedUser.getUserName()%>'s statuses</h1>
            <%
                StatusDao statusDao = new StatusDao("TheSongDb", "jdbc/TheSongDb");
                ArrayList<Status> statuses = statusDao.displayOwnStatuses(loggedUser.getUserId());
                if (!statuses.isEmpty()) { %>
            <table border="1">
                <tr>
                    <th>Status</th>
                    <th>Date updated</th>
                    <th>Delete</th>
                </tr>

                <%
                    for (Status s : statuses) {
                %>
                <tr>
                    <td><%= s.getStatusContent()%></td>
                    <td><%= s.getSentOn()%></td>
                    <td><a href="deleteStatus.jsp?id=<%= s.getStatusId()%>">Delete</a></td>
                </tr>
                <%
                    }
                %>

            </table>
            <% } else {
                    out.println("No statuses found");
                }%>
        </div>
    </section>
    <div id="leftColumn">
        <%
            MessageDao messageDao = new MessageDao("TheSongDb", "jdbc/TheSongDb");
            ArrayList<Message> messages = messageDao.displayAllMessages(loggedUser.getUserId());
        %>

        <h1><%= loggedUser.getUserName()%>'s messages</h1>
        <table border="1">
            <% if (!messages.isEmpty()) { %>
            <tr>
                <th>Sender</th>
                <th>Receiver</th>
                <th>Date sent</th>
                <th>Subject</th>
                <th>Message</th>
                <th>Delete</th>
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
                <td><a href="deleteMessage.jsp?id=<%=m.getMessageId()%>">Delete</a></td>
            </tr>
            <%
                }
            %>

        </table>
        <% } else {
                out.println("No messages found");
            }%>
        <%
            }
        %>
    </div>
</body>
</html>