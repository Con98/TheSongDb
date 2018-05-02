/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.UserDao;
import Dtos.Message;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thomas
 */
public class DeleteUserCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";

        
            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            int userId = Integer.parseInt(request.getParameter("userId"));
            boolean deleted = userDao.deleteUser(userId);
            if (deleted) {
                forwardToJsp = "adminSettings.jsp";
            } else {
                forwardToJsp = "error.jsp";

                HttpSession session = request.getSession();

                session.setAttribute("errorMessage", "A parameter value required was missing");

                // Set the page to be viewed to the results page
            }
        return forwardToJsp;
    }
}
