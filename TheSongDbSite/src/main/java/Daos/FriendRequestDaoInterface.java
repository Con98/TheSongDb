/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.FriendRequest;
import java.util.ArrayList;

/**
 *
 * @author emmet
 */
public interface FriendRequestDaoInterface {
    
    public ArrayList<FriendRequest> displayAllFriendRequests(String username);
    
    public int addFriendship(String username1, String username2);
            
    public int checkFriendRequest(String username1, String username2);
    
    public boolean denyFriendship(String username1, String username2);
}
