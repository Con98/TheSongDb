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
        <div id="leftColumn">
            <%
                UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
                Object user = session.getAttribute("userName");
                String username = (String) user;
                if (username != null) {
                    FriendDao friendDao = new FriendDao("TheSongDb", "jdbc/TheSongDb");
                    ArrayList<Friend> friends = friendDao.displayAllFriends(username);

            %>
            <h1><%=username%>'s Friend List</h1>
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
                <%
                    MessageDao messageDao = new MessageDao("TheSongDb", "jdbc/TheSongDb");
                    ArrayList<Message> messages = messageDao.displayAllMessages(loggedUser.getUserId());
                %>
            </table>
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
        </div>
    </section>
    <%
        }
    %>
</body>
</html>