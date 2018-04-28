/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.MusicDao;
import Daos.UserDao;
import Dtos.Api.Album;
import Dtos.Api.Artist;
import Dtos.Api.Track;
import Dtos.User;
import java.util.ArrayList;
import javax.json.JsonException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thoma
 */
public class SearchCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        HttpSession session = request.getSession();

        String input = request.getParameter("search");
        ArrayList<User> userF = new ArrayList();
        ArrayList<Artist> artist = new ArrayList();
        ArrayList<Album> albums = new ArrayList();
        ArrayList<Track> tracks = new ArrayList();
        session.setAttribute("input", input);
        session.setAttribute("user", userF);
        session.setAttribute("artist", artist);
        if (!input.equalsIgnoreCase("")) {

            UserDao userDao = new UserDao("thesongdb", "jdbc/WebPatternsCA3");
            MusicDao musicDao = new MusicDao();
            ArrayList<User> uTe = userDao.viewAllUsers();
            try {
                
                userF = userDao.findUserByName(input);
                System.out.println(userF.size());
                
                artist = musicDao.searchArtist(input);
           albums = musicDao.searchAlbum(input);
            } catch (JsonException e) {
                session.setAttribute("artist", null);
            }
            if (userF.size() > 0) {
                session.setAttribute("user", userF);
            } else {
                session.setAttribute("user", userF);
            }
            if (artist.size() > 0) {
                session.setAttribute("artist", artist);
            }else {
                session.setAttribute("artist", artist);
            }
            if (albums.size() > 0) {
                session.setAttribute("albums", albums);
            }else {
                session.setAttribute("albums", albums);
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
