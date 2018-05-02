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
        User u1 = new User("user", "one", "user1", "user1@user.com", false, "userPassword");
        String username1 = u1.getUserName();
        FriendDao instance = new FriendDao("thesongdbtest", "jdbc/TheSongDb");
        ArrayList<Friend> expResult = new ArrayList<>();
        ArrayList<Friend> result = instance.displayAllFriends(username1);
        assertEquals(expResult, result);
    }
    
    /**
     * Test of removeFriendship method, a class of FriendsDao
     */
    @Test
    public void testRemoveFriendship(){
        System.out.println("removeFriendship");
        User u1 = new User("user", "one", "user1", "user1@user.com", false, "userPassword");
        String username1 = u1.getUserName();
        User u2 = new User("user", "two", "user2", "user2@user.com", false, "userPassword");
        String username2 = u2.getUserName();
        FriendDao instance = new FriendDao("thesongdbtest", "jdbc/TheSongDb");
        instance.confirmFriendship(username1, username2);
        boolean expResult = false;
        boolean result = instance.removeFriendship(username1, username2);
        assertEquals(expResult, result);
    }
    /**
     * Test if confirmFriendship method, a class of FriendDao
     */
    @Test
    public void testConfirmFriendship(){
        System.out.println("confirmFriendship");
        User u1 = new User("user", "one", "user1", "user1@user.com", false, "userPassword");
        String username1 = u1.getUserName();
        User u2 = new User("user", "two", "user2", "user2@user.com", false, "userPassword");
        String username2 = u2.getUserName();
        FriendDao instance = new FriendDao("thesongdbtest", "jdbc/TheSongDb");
        int expResult = 0;
        int result = instance.confirmFriendship(username1, username2);
        assertEquals(expResult, result);
        instance.removeUserFriends(username1);
        instance.removeUserFriends(username2);
        UserDao test = new UserDao("thesongdbtest", "jdbc/TheSongDb");
        boolean removed = test.deleteUser(u1.getUserId());
        removed = test.deleteUser(u2.getUserId());
    }
    
    /**
     * Test of removeUserFriends method, a class of FriendDao
     */
    @Test
    public void testRemoveUserFriends(){
        System.out.println("removeUserFriends");
        User u1 = new User("user", "one", "user1", "user1@user.com", false, "userPassword");
        User u2 = new User("user", "two", "user2", "user2@user.com", false, "userPassword");
        User u3 = new User("user", "three", "user3", "user3@user.com", false, "userPassword");
        Friend f1 = new Friend(u1, u2);
        Friend f2 = new Friend(u1, u3);
        FriendDao instance = new FriendDao("thesongdbtest", "jdbc/TheSongDb");
        boolean expResult = true;
        boolean result = instance.removeUserFriends(u1.getUserName());
        instance.removeUserFriends(u1.getUserName());
        instance.removeUserFriends(u2.getUserName());
        UserDao test = new UserDao("thesongdbtest", "jdbc/TheSongDb");
        boolean removed = test.deleteUser(u1.getUserId());
        removed = test.deleteUser(u2.getUserId());
    }
    
    /**
     * Test of checkFriendshipStatus method, a class of FriendDao
     */
    @Test
    public void testCheckFriendshipStatus(){
        System.out.println("checkFriendshipStatus");
        User u1 = new User("user", "one", "user1", "user1@user.com", false, "userPassword");
        String username1 = u1.getUserName();
        User u2 = new User("user", "two", "user2", "user2@user.com", false, "userPassword");
        String username2 = u2.getUserName();
        Friend f1 = new Friend(u1, u2);
        FriendDao instance = new FriendDao("thesongdbtest", "jdbc/TheSongDb");
        instance.confirmFriendship(username1, username2);
        FriendDao testFriend = new FriendDao("thesongdbtest", "jdbc/TheSongDb");
        Friend expResult = new Friend(u1, u2);
        expResult = testFriend.checkFriendshipStatus(username1, username2);
        Friend result = instance.checkFriendshipStatus(username1, username2);
        assertEquals(expResult, result);
        instance.removeFriendship(username1, username2);
        instance.removeUserFriends(username1);
        instance.removeUserFriends(username2);
        UserDao test = new UserDao("thesongdbtest", "jdbc/TheSongDb");
        boolean removed = test.deleteUser(u1.getUserId());
        removed = test.deleteUser(u2.getUserId());
    }
    
    /**
     * Test of checkIfFriends method, a class of FriendDao
     */
    @Test
    public void testCheckIfFriends(){
        System.out.println("checkIfFriends");
        User u1 = new User("user", "one", "user1", "user1@user.com", false, "userPassword");
        User u2 = new User("user", "two", "user2", "user2@user.com", false, "userPassword");
        
        FriendDao instance = new FriendDao("thesongdbtest", "jdbc/TheSongDb");
        Friend f1 = new Friend(u1, u2);
        boolean expResult = false;
        boolean result = instance.checkIfFriends(u1.getUserName(), u2.getUserName());
        assertEquals(expResult, result);
        instance.removeFriendship(u1.getUserName(), u2.getUserName());
        instance.removeUserFriends(u1.getUserName());
        instance.removeUserFriends(u2.getUserName());
        UserDao test = new UserDao("thesongdbtest", "jdbc/TheSongDb");
        boolean removed = test.deleteUser(u1.getUserId());
        removed = test.deleteUser(u2.getUserId());
    }
}
