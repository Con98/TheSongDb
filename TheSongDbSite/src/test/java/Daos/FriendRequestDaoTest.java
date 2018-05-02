/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.FriendRequest;
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
    public FriendRequestDaoTest(){
        
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
     * Test of displayAllFriendRequests method, of class friendRequestDao
     */
    @Test
    public void testDisplayAllFriendRequests(){
        System.out.println("displayAllFriendRequests");
        User u1 = new User();
        User u2 = new User();
        FriendRequest fr = new FriendRequest(u1, u2);
        FriendRequestDao instance = new FriendRequestDao("thesongdbtest", "jdbc/TheSongDb");
        ArrayList<FriendRequest> expResult = new ArrayList<>();
        expResult.add(fr);
        ArrayList<String> result = instance.displayAllFriendRequests(u1.getUserName());
        assertEquals(expResult, result);
    }

    /**
     * Test of addFriendship method, of class FriendRequestDao.
     */
    @Test
    public void testAddFriendship() {
        System.out.println("addFriendship");
        String username1 = "";
        String username2 = "";
        FriendRequestDao instance = null;
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
        String username1 = "";
        String username2 = "";
        FriendRequestDao instance = null;
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
        String username1 = "";
        String username2 = "";
        FriendRequestDao instance = null;
        boolean expResult = false;
        boolean result = instance.denyFriendship(username1, username2);
        assertEquals(expResult, result);

    }
    
}
