/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

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
public class FriendRequestDaoTest {
    
    public FriendRequestDaoTest() {
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
     * Test of displayAllFriendRequests method, of class FriendRequestDao.
     */
    @Test
    public void testDisplayAllFriendRequests() {
        System.out.println("displayAllFriendRequests");
        User u1 = new User("user", "one", "user1", "user1@user.com", false, "userPassword");
        String username = u1.getUserName();
        FriendRequestDao instance = new FriendRequestDao("thesongdbtest", "jdbc/TheSongDb");
        ArrayList<String> expResult = new ArrayList<>();
        ArrayList<String> result = instance.displayAllFriendRequests(username);
        assertEquals(expResult, result);
    }

    /**
     * Test of addFriendship method, of class FriendRequestDao.
     */
    @Test
    public void testAddFriendship() {
        System.out.println("addFriendship");
        User u1 = new User("user", "one", "user1", "user1@user.com", false, "userPassword");
        String username1 = u1.getUserName();
        User u2 = new User("user", "two", "user2", "user2@user.com", false, "userPassword");
        String username2 = u2.getUserName();
        FriendRequestDao instance = new FriendRequestDao("thesongdbtest", "jdbc/TheSongDb");
        int expResult = 0;
        int result = instance.addFriendship(username1, username2);
        assertEquals(expResult, result);
    }

    /**
     * Test of checkFriendRequest method, of class FriendRequestDao.
     */
    @Test
    public void testCheckFriendRequest() {
        System.out.println("checkFriendRequest");
        User u1 = new User("user", "one", "user1", "user1@user.com", false, "userPassword");
        String username1 = u1.getUserName();
        User u2 = new User("user", "two", "user2", "user2@user.com", false, "userPassword");
        String username2 = u2.getUserName();
        FriendRequestDao instance = new FriendRequestDao("thesongdbtest", "jdbc/TheSongDb");
        int expResult = 0;
        int result = instance.checkFriendRequest(username1, username2);
        assertEquals(expResult, result);
    }

    /**
     * Test of denyFriendship method, of class FriendRequestDao.
     */
    @Test
    public void testDenyFriendship() {
        System.out.println("denyFriendship");
        User u1 = new User("user", "one", "user1", "user1@user.com", false, "userPassword");
        String username1 = u1.getUserName();
        User u2 = new User("user", "two", "user2", "user2@user.com", false, "userPassword");
        String username2 = u2.getUserName();
        FriendRequestDao instance = new FriendRequestDao("thesongdbtest", "jdbc/TheSongDb");
        boolean expResult = false;
        boolean result = instance.denyFriendship(username1, username2);
        assertEquals(expResult, result);
    }
    
}
