/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import java.util.ArrayList;
import Daos.UserDao;
import Dtos.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thomas
 */
public class RegisterCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";

        String firstName = request.getParameter("firstName");
        String surName = request.getParameter("surName");
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        if (firstName != null && surName != null && email != null && password != null) {

            UserDao userDao = new UserDao("TheSongDb", "jdbc/TheSongDb");
            int user = userDao.register(firstName, surName, userName, email, password);
            if(user == 0){   
            forwardToJsp = "registerError.jsp";
            }
            else if(user > 0){
                HttpSession session = request.getSession();
            session.setAttribute("register", user);
                forwardToJsp = "login.jsp";
            }
            else if(user == -1){
                forwardToJsp = "registerFailed.jsp";
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
