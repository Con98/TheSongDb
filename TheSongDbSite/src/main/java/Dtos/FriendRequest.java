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
public class FriendRequest {
    private User friend1;
    private User friend2;
    
    private FriendRequest(){
        
    }
    
    public FriendRequest(User friend1, User friend2){
        User tmp;
        
        if(friend1.compareTo(friend2) > 0){
            tmp = friend2;
            this.friend2 = friend1;
            this.friend1 = tmp;
        } else{
            this.friend1 = friend1;
            this.friend2 = friend2;
        }
    }

    public User getFriend1() {
        return friend1;
    }

    public void setFriend1(User friend1) {
        this.friend1 = friend1;
    }

    public User getFriend2() {
        return friend2;
    }

    public void setFriend2(User friend2) {
        this.friend2 = friend2;
    }
}
