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
//    @Test
//    public void testDisplayAllFriendRequests(){
//        System.out.println("displayAllFriendRequests");
//        User u1 = new User();
//        User u2 = new User();
//        FriendRequest fr = new FriendRequest(u1, u2);
//        FriendRequestDao instance = new FriendRequestDao("thesongdbtest", "jdbc/TheSongDb");
//        ArrayList<String> expResult = new ArrayList<>();
//        expResult.add(new FriendRequest(u1, u2));
//        ArrayList<String> result = instance.displayAllFriendRequests(u1.getUserName());
//        assertEquals(expResult, result);
//    }

    /**
     * Test of addFriendship method, of class FriendRequestDao.
     */
    @Test
    public void testAddFriendship() {
        System.out.println("addFriendship");
        User u1 = new User();
        User u2 = new User();
        String username1 = u1.getUserName();
        String username2 = u2.getUserName();
        FriendRequestDao instance = new FriendRequestDao("thesongdbtest", "jdbc/TheSongDb");
        int expResult = 1;
        int result = instance.addFriendship(username1, username2);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of checkFriendRequest method, of class FriendRequestDao.
     */
    @Test
    public void testCheckFriendRequest() {
        System.out.println("checkFriendRequest");
        User u1 = new User();
        User u2 = new User();
        String username1 = u1.getUserName();
        String username2 = u2.getUserName();
        FriendRequestDao instance = new FriendRequestDao("thesongdbtest", "jdbc/TheSongDb");
        int expResult = 0;
        int result = instance.checkFriendRequest(username1, username2);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of denyFriendship method, of class FriendRequestDao.
     */
    @Test
    public void testDenyFriendship() {
        System.out.println("denyFriendship");
        User u1 = new User();
        User u2 = new User();
        String username1 = u1.getUserName();
        String username2 = u2.getUserName();
        FriendRequestDao instance = new FriendRequestDao("thesongdbtest", "jdbc/TheSongDb");
        boolean expResult = true;
        boolean result = instance.denyFriendship(username1, username2);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
