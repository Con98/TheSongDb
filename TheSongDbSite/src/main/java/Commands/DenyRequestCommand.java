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
public class DenyRequestCommand implements Command{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";

        String f1 = request.getParameter("currentUser");
        String f2 = request.getParameter("friendRequest");
        if (f1 != null && f2 != null) {
            FriendRequestDao fDao = new FriendRequestDao("TheSongDb", "jdbc/TheSongDb");
            boolean success = fDao.denyFriendship(f1, f2);
            if(success = true){
            forwardToJsp = "profile.jsp";
            }
            else{
                forwardToJsp = "error.jsp";
            }
            
            
            

        }else {
            forwardToJsp = "error.jsp";

            HttpSession session = request.getSession();

            session.setAttribute("errorMessage", "A parameter value required was missing");

            // Set the page to be viewed to the results page
        }
        return forwardToJsp;
    }
}
