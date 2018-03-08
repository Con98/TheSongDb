/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.MessageDao;
import Daos.StatusDao;
import Dtos.Message;
import Dtos.Status;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tadas
 */
public class DeleteStatusCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";

        String statusId = request.getParameter("statusId");
            StatusDao statusDao = new StatusDao("TheSongDb", "jdbc/TheSongDb");
            Status s = statusDao.findStatusById(statusId);
            boolean deleted = statusDao.deleteStatus(s);
            if (deleted) {
                forwardToJsp = "profile.jsp";
            } else {
                forwardToJsp = "error.jsp";

                HttpSession session = request.getSession();

                session.setAttribute("errorMessage", "A parameter value required was missing");

                // Set the page to be viewed to the results page
            }
        return forwardToJsp;
    }
}
