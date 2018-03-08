/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;
import Dtos.Status;
import java.util.ArrayList;

/**
 *
 * @author emmet
 */
public interface StatusDaoInterface {
    /**
     * Gets all messages sent to user
     * Uses database field toId to distinguish (i.e. toId matched userId logged in)
     * Returns object type Message
     */
    //public ArrayList getMessages();
    
    /**
     * Creates new message to be sent to a user
     * Matches the fromId to tell who the message is coming from
     * Matches the toId to the user who is chosen to receive the message
     * @param userId
     * @param statusContent
     * @return 
     */
    //public Message createMessage();
    public boolean sendStatus(String userId, String statusContent);
    public ArrayList<Status> displayOwnStatuses(int userId);
    public ArrayList<Status> displayStatuses(int userLoggedIn);
    public Status findStatusById(String inputStatId);
    public boolean deleteStatus(Status s);
}