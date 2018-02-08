/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.UserDao;
import Dtos.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thomas
 */
public class LoginCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";

        String name = request.getParameter("email");
        String pass = request.getParameter("password");
        if (name != null && pass != null) {

            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            User user = userDao.login(name, pass);
            if(user == null || user.getFirstName() == null || user.getPassword() == null){   
            forwardToJsp = "loginFailed.jsp";
            }
            else if(user.isType() == false){
                HttpSession session = request.getSession();
            session.setAttribute("login", user);
                forwardToJsp = "home.jsp";
            }
            else if(user.isType() == true){
                HttpSession session = request.getSession();
            session.setAttribute("login", user);
            forwardToJsp = "adminLogin.jsp";
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
