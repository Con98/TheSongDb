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
     * Creates new status to be published to user's profile
     * Inserts the status to database
     * @param userId the ID of the user who is signed in
     * @param statusContent the contents of the status to be published
     * @return returns boolean, true if added successfully, false if updating status failed
     */
    public boolean sendStatus(String userId, String statusContent);
    
    /**
     * Retrieves ArrayList of user's own statuses
     * @param userId the ID of the user who is signed in
     * @return ArrayList containing the user's(signed in) statuses
     */
    public ArrayList<Status> displayOwnStatuses(int userId);
    
    /**
     * Retrieves ArrayList of user's and friends statuses
     * @param userLoggedIn the ID of the user who is signed in
     * @return ArrayList containing the user's(signed in) and friend's statuses
     */
    public ArrayList<Status> displayStatuses(int userLoggedIn);
    
    /**
     * Retrieve status from the statusId provided 
     * @param inputStatId the ID of the status to retrieve
     * @return Object of type Status, can be null
     */
    public Status findStatusById(String inputStatId);
    
    /**
     * Deletes status provided in parameter
     * @param s The status that is to be deleted
     * @return boolean, returns true if status successfully deleted and false if failed to delete
     */
    public boolean deleteStatus(Status s);
}
