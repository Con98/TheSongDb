/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Friend;
import Dtos.User;
import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author emmet
 */
public class FriendDaoTest {

    public FriendDaoTest() {

    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of displayAllFriends method, a class of FriendsDao
     *
     */
    @Test
    public void testDisplayAllFriends() {
        System.out.println("displayAllFriends");
        User u1 = new User();
        User u2 = new User();
        FriendDao instance = new FriendDao("thesongdbtest", "jdbc/TheSongDb");
        ArrayList<Friend> expResult = new ArrayList<>();
        expResult.add(new Friend(u1, u2));
        ArrayList<Friend> result = instance.displayAllFriends(u1.getUserName());
        assertEquals(expResult, result);
    }
    
    /**
     * Test of removeFriendship method, a class of FriendsDao
     */
    @Test
    public void testRemoveFriendship(){
        System.out.println("removeFriendship");
        User u1 = new User();
        User u2 = new User();
        Friend f = new Friend(u1,u2);
        FriendDao instance = new FriendDao("thesongdbtest");
        instance.confirmFriendship(u1.getUserName(), u2.getUserName());
        boolean expResult = true;
        boolean result = instance.removeFriendship(u1.getUserName(), u2.getUserName());
        assertEquals(expResult, result);
    }
    
    /**
     * Test if confirmFriendship method, a class of FriendDao
     */
    @Test
    public void testConfirmFriendship(){
        System.out.println("confirmFriendship");
        User u1 = new User();
        User u2 = new User();
        Friend f1 = new Friend(u1, u2);
        FriendDao instance = new FriendDao("thesongdbtest", "jdbc/TheSongDb");
        int expResult = 1;
        int result = instance.confirmFriendship(u1.getUserName(), u2.getUserName());
        assertEquals(expResult, result);
        
    }
    
    /**
     * Test of removeUserFriends method, a class of FriendDao
     */
    @Test
    public void testRemoveUserFriends(){
        System.out.println("removeUserFriends");
        User u1 = new User();
        User u2 = new User();
        User u3 = new User();
        Friend f1 = new Friend(u1, u2);
        Friend f2 = new Friend(u1, u3);
        FriendDao instance = new FriendDao("thesongdbtest", "jdbc/TheSongDb");
        boolean expResult = true;
        boolean result = instance.removeUserFriends(u1.getUserName());
    }
    
    /**
     * Test of checkFriendshipStatus method, a class of FriendDao
     */
    @Test
    public void testCheckFriendshipStatus(){
        System.out.println("checkFriendshipStatus");
        User u1 = new User();
        User u2 = new User();
        Friend f1 = new Friend(u1, u2);
        FriendDao instance = new FriendDao("thesongdbtest", "jdbc/TheSongDb");
        Friend expResult = new Friend(u1, u2);
        Friend result = instance.checkFriendshipStatus(u1.getUserName(), u2.getUserName());
        assertEquals(expResult, result);
        instance.removeFriendship(u1.getUserName(), u2.getUserName());
    }
    
    /**
     * Test of checkIfFriends method, a class of FriendDao
     */
    @Test
    public void testCheckIfFriends(){
        System.out.println("checkIfFriends");
        User u1 = new User();
        User u2 = new User();
        Friend f1 = new Friend(u1, u2);
        FriendDao instance = new FriendDao("thesongdbtest", "jdbc/TheSongDb");
        boolean expResult = true;
        boolean result = instance.checkIfFriends(u1.getUserName(), u2.getUserName());
        assertEquals(expResult, result);
        instance.removeFriendship(u1.getUserName(), u2.getUserName());
    }
}
