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
public class Friend {
    private int friendId;
    private String friend1;
    private String friend2;
    
    private Friend(){
        
    }
    
    private Friend(int friendId, String friend1, String friend2){
        this.friendId = friendId;
        this.friend1 = friend1;
        this.friend2 = friend2;
    }

    public int getFriendId() {
        return friendId;
    }

    public void setFriendId(int friendId) {
        this.friendId = friendId;
    }

    public String getFriend1() {
        return friend1;
    }

    public void setFriend1(String friend1) {
        this.friend1 = friend1;
    }

    public String getFriend2() {
        return friend2;
    }

    public void setFriend2(String friend2) {
        this.friend2 = friend2;
    }

    
}
