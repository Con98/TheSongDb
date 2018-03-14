<%@page import="Dtos.User"%>
<%@page import="Daos.UserDao"%>
<%  
            try {
                User updateStatLoggedUser = (User) session.getAttribute("login");
                String userName = updateStatLoggedUser.getUserName();
                int updateStatUserId = updateStatLoggedUser.getUserId();
        %>
        <div style="width: 50%; text-align: center;">
            <form class="form-horizontal" action="FrontController" method="post">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="statusContent"><%=new TextBundle("status").getText(lang) %>:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="statusContent" placeholder="<%=new TextBundle("enterStatus").getText(lang) %>" required>
                    </div>
                </div>
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" value="<%=new TextBundle("updateStatus").getText(lang) %>" class="btn btn-default">
                </div>
                <br>

                <input type="hidden" name="userId" value="<%= updateStatUserId%>"/>
                <input type="hidden" name="action" value="updateStatus"/>
            </form>
        </div>
        <% } catch (NullPointerException ex) {
                //Display an error message to the log
                System.out.println("An error occured when trying to update status: " + ex.getMessage());
            }%>