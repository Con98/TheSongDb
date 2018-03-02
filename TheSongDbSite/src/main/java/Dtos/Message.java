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
public class Message {
    private int messageId;
    private int fromId;
    private int toId;
    private String sentOn;
    private String subjectLine;
    private String messageContent;
    
    /**
     * Constructor of user.
     *
     * Construct the user and sets all fields except userId, which is
     * automatically incremented in database when new user is created.
     *
     * @param messageId Unique ID for every message
     * @param fromId userID of the user sending the message
     * @param toId UserID of the user receiving the message
     * @param subjectLine short description of what the message is about
     * @param messageContent the actual message itself
     */
    public Message(){
    
    }
    
        public Message(int messageId, int fromId, int toId, String subjectLine, String messageContent){
            this.messageId = messageId;
            this.fromId = fromId;
            this.toId = toId;
            this.subjectLine = subjectLine;
            this.messageContent = messageContent;
        }
        public Message(int messageId, int fromId, int toId, String sentOn, String subjectLine, String messageContent){
            this.messageId = messageId;
            this.fromId = fromId;
            this.toId = toId;
            this.sentOn = sentOn;
            this.subjectLine = subjectLine;
            this.messageContent = messageContent;
        }

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public int getFromId() {
        return fromId;
    }

    public void setFromId(int fromId) {
        this.fromId = fromId;
    }

    public int getToId() {
        return toId;
    }

    public void setToId(int toId) {
        this.toId = toId;
    }

    public String getSubjectLine() {
        return subjectLine;
    }

    public void setSubjectLine(String subjectLine) {
        this.subjectLine = subjectLine;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public String getSentOn() {
        return sentOn;
    }

    public void setSentOn(String sentOn) {
        this.sentOn = sentOn;
    }

    @Override
    public String toString() {
        return "Message{" + "messageId=" + messageId + ", fromId=" + fromId + ", toId=" + toId + ", sentOn=" + sentOn + ", subjectLine=" + subjectLine + ", messageContent=" + messageContent + '}';
    }
    
}
