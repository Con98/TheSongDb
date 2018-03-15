/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.MusicDao;
import Daos.UserDao;
import Dtos.User;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import json.JSONException;
import json.JSONObject;

/**
 *
 * @author thoma
 */
public class SearchCommand implements Command{
        @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        HttpSession session = request.getSession();

        String input = request.getParameter("search");
        User userF = new User();
        JSONObject artist = new JSONObject();
        ArrayList<JSONObject> albums = new ArrayList();
        session.setAttribute("input", input);
        session.setAttribute("user", userF);
        session.setAttribute("artist", artist);
        if (!input.equalsIgnoreCase("")) {

            UserDao userDao = new UserDao("thesongdb", "jdbc/WebPatternsCA3");
            MusicDao musicDao = new MusicDao();
            userF = userDao.findUserByUsername(input);
            try{
            artist = musicDao.getArtist(input);
            }catch(JSONException e){
                session.setAttribute("artist", null);
            }
            if (userF != null) {
                session.setAttribute("user", userF);
            }else{
                session.setAttribute("user", userF);
            }
            if (artist != null) {
                session.setAttribute("artist", artist);
            }
            
            forwardToJsp = "searchResults.jsp";

        } else {
            forwardToJsp = "error.jsp";

            session.setAttribute("errorMessage", "A parameter value required was missing");

            // Set the page to be viewed to the results page
        }
        return forwardToJsp;
    }
}