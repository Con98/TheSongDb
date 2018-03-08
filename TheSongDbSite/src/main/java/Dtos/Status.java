/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

/**
 *
 * @author emmet
 */
public class Status {

    private int statusId;
    private int userId;
    private String sentOn;
    private String statusContent;

    public Status() {

    }

    public Status(int statusId, int userId, String statusContent) {
        this.statusId = statusId;
        this.userId = userId;
        this.statusContent = statusContent;
    }

    /**
     * Constructor of user.
     *
     * Construct the user and sets all fields except userId, which is
     * automatically incremented in database when new user is created.
     *
     * @param statusId Unique ID for every status
     * @param userId userID of the user sending the status
     * @param sentOn the date and time the status was updated
     * @param statusContent the actual message itself
     */
    public Status(int statusId, int userId, String sentOn, String statusContent) {
        this.statusId = statusId;
        this.userId = userId;
        this.sentOn = sentOn;
        this.statusContent = statusContent;
    }

    public int getStatusId() {
        return statusId;
    }

    public int getUserId() {
        return userId;
    }

    public String getSentOn() {
        return sentOn;
    }

    public String getStatusContent() {
        return statusContent;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setSentOn(String sentOn) {
        this.sentOn = sentOn;
    }

    public void setStatusContent(String statusContent) {
        this.statusContent = statusContent;
    }

}
