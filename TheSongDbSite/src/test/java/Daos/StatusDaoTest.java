/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Status;
import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author tadas
 */
public class StatusDaoTest {

    public StatusDaoTest() {
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
     * Test of sendStatus method, of class StatusDao.
     */
    @Test
    public void testSendStatus() {
        System.out.println("sendStatus");
        int userId = 2;
        String userIdString = userId + "";
        String statusContent = "testing Status";
        StatusDao instance = new StatusDao("thesongdbtest", "jdbc/TheSongDb");
        boolean expResult = true;
        boolean result = instance.sendStatus(userIdString, statusContent);
        assertEquals(expResult, result);
        instance.deleteStatus(new Status(1, userId, statusContent));
    }

    /**
     * Test of displayOwnStatuses method, of class StatusDao.
     */
    @Test
    public void testDisplayOwnStatuses() {
        System.out.println("displayOwnStatuses");
        int userLoggedIn = 1;
        StatusDao instance = new StatusDao("thesongdbtest", "jdbc/TheSongDb");
        ArrayList<Status> expResult = new ArrayList<>();
        expResult.add(new Status(2, 2, "2018-04-25 20:42:43", "testing display"));
        ArrayList<Status> result = instance.displayOwnStatuses(userLoggedIn);
        assertEquals(expResult, result);
    }

    /**
     * Test of findStatusById method, of class StatusDao.
     */
    @Test
    public void testFindStatusById() {
        System.out.println("findStatusById");
        String inputStatId = "2";
        StatusDao instance = new StatusDao("thesongdbtest", "jdbc/TheSongDb");
        Status expResult = new Status(2, 2, "2018-03-15 01:05:12", "testing test");
        Status result = instance.findStatusById(inputStatId);
        assertEquals(expResult, result);
    }

    /**
     * Test of deleteStatus method, of class StatusDao.
     */
    @Test
    public void testDeleteStatus() {
        System.out.println("deleteStatus");
        StatusDao instance = new StatusDao("thesongdbtest", "jdbc/TheSongDb");
        instance.sendStatus("2", "testingDeleteStatus");
        Status s = new Status(1, 2, "testingDeleteStatus");
        boolean expResult = true;
        boolean result = instance.deleteStatus(s);
        assertEquals(expResult, result);
    }

}
