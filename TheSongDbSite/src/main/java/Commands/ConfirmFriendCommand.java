/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.FriendDao;
import Daos.FriendRequestDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tadas
 */
public class ConfirmFriendCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";

        String f1 = request.getParameter("currentUser");
        String f2 = request.getParameter("friendRequest");
        if (f1 != null && f2 != null) {
            FriendDao fDao = new FriendDao("TheSongDb", "jdbc/TheSongDb");
            FriendRequestDao frDao = new FriendRequestDao("TheSongDb", "jdbc/TheSongDb");
            int success = fDao.confirmFriendship(f1, f2);
            if (success > 0) {
                frDao.denyFriendship(f1, f2);
                forwardToJsp = "profile.jsp";

            } else {
                forwardToJsp = "error.jsp";
            }

        } else {
            forwardToJsp = "error.jsp";

            HttpSession session = request.getSession();

            session.setAttribute("errorMessage", "A parameter value required was missing");

            // Set the page to be viewed to the results page
        }
        return forwardToJsp;
    }
}
