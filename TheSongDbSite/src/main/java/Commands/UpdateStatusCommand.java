/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.StatusDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tadas
 */
public class UpdateStatusCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";

        String userId = request.getParameter("userId");
        String statusContent = request.getParameter("statusContent");
        if (statusContent != null) {

            StatusDao statusDao = new StatusDao("TheSongDb", "jdbc/TheSongDb");
            boolean sent = statusDao.sendStatus(userId, statusContent);
            if(sent){
            forwardToJsp = "home.jsp";
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
