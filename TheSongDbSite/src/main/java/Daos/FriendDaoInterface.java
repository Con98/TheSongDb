/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Friend;
import java.util.ArrayList;

/**
 *
 * @author emmet
 */
public interface FriendDaoInterface {

    //public Friend addNewFriend();
    public ArrayList<Friend> displayAllFriends(String username);

    public boolean removeFriendship(String username1, String username2);

    public boolean removeUserFriends(String username1);

    public Friend checkFriendshipStatus(String username1, String username2);
    
    public boolean checkIfFriends(String username1, String username2);
    
    public int confirmFriendship(String username1, String username2);
}
