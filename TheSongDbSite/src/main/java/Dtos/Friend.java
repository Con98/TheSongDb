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
    private int userId1;
    private int userId2;
    
    private Friend(){
        
    }
    
    private Friend(int friendId, int userId1, int userId2){
        this.friendId = friendId;
        this.userId1 = userId1;
        this.userId2 = userId2;
    }

    public int getFriendId() {
        return friendId;
    }

    public void setFriendId(int friendId) {
        this.friendId = friendId;
    }

    public int getUserId1() {
        return userId1;
    }

    public void setUserId1(int userId1) {
        this.userId1 = userId1;
    }

    public int getUserId2() {
        return userId2;
    }

    public void setUserId2(int userId2) {
        this.userId2 = userId2;
    }
}
