/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.MessageDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thomas
 */
public class SendMessageCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";

        String fromId = request.getParameter("fromId");
        String toId = request.getParameter("toId");
        String subjectLine = request.getParameter("subjectLine");
        String messageContent = request.getParameter("messageContent");
        if (toId != null && toId != null) {

            MessageDao messageDao = new MessageDao("TheSongDb", "jdbc/TheSongDb");
            boolean sent = messageDao.sendMessage(fromId, toId, subjectLine, messageContent);
            if(sent){
            forwardToJsp = "messages.jsp";
            }
            else{
                forwardToJsp = "sendMessage.jsp";
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
