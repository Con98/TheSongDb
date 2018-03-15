/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Message;
import java.util.ArrayList;

/**
 *
 * @author emmet
 */
public interface MessageDaoInterface {
    /**
     * Inserts message to database using information provided
     * @param fromId ID of the user who is sending the message
     * @param toId ID of the user who is receiving the message
     * @param subjectLine Subject of the message
     * @param messageContent Message contents of the message to be sent
     * @return returns boolean, true if added successfully, false if updating status failed
     */
    public boolean sendMessage(String fromId, String toId, String subjectLine, String messageContent);
    
    /**
     * Display all messages of the user currently logged in
     * Retrieved from the database
     * @param userId the ID of the user who is signed in
     * @return ArrayList containing the user's(signed in) messages
     */
    public ArrayList<Message> displayAllMessages(int userId);
    
    /**
     * Retrieve message from the messageId provided 
     * @param messageId the ID of the message to retrieve
     * @return Object of type Message, can be null
     */
    public Message findMessageById(String messageId);
    
    /**
     * Deletes message provided in parameter
     * @param m The message that is to be deleted
     * @return boolean, returns true if message successfully deleted and false if failed to delete
     */
    public boolean deleteMessage(Message m);
}
