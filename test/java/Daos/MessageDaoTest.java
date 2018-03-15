/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Message;
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
public class MessageDaoTest {
    
    public MessageDaoTest() {
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
     * Test of sendMessage method, of class MessageDao.
     */
    @Test
    public void testSendMessage() {
        System.out.println("sendMessage");
        int fromId = 1;
        int toId = 2;
        String fromIdString = fromId + "";
        String toIdString = toId + "";
        String subjectLine = "testingPass";
        String messageContent = "JustTestingThePass";
        MessageDao instance = new MessageDao("TheSongDb", "jdbc/TheSongDb");
        boolean expResult = true;
        boolean result = instance.sendMessage(fromIdString, toIdString, subjectLine, messageContent);
        assertEquals(expResult, result);
        instance.deleteMessage(new Message(1, fromId, toId, subjectLine, messageContent));
    }

    /**
     * Test of displayAllMessages method, of class MessageDao.
     */
    @Test
    public void testDisplayAllMessages() {
        System.out.println("displayAllMessages");
        int userId = 1;
        MessageDao instance = new MessageDao("TheSongDb", "jdbc/TheSongDb");
        ArrayList<Message> expResult = new ArrayList<Message>();
        expResult.add(new Message(3, 2, 1, "2018-03-02 13:46:51", "test sub", "test mesg"));
        ArrayList<Message> result = instance.displayAllMessages(userId);
        assertEquals(expResult, result);
    }

    /**
     * Test of findMessageById method, of class MessageDao.
     */
    @Test
    public void testFindMessageById() {
        System.out.println("findMessageById");
        String inputMessId = "3";
        MessageDao instance = new MessageDao("TheSongDb", "jdbc/TheSongDb");
        Message expResult = new Message(3, 2, 1, "2018-03-02 13:46:51", "test sub", "test mesg");
        Message result = instance.findMessageById(inputMessId);
        assertEquals(expResult, result);
    }

    /**
     * Test of deleteMessage method, of class MessageDao.
     */
    @Test
    public void testDeleteMessage() {
        System.out.println("deleteMessage");
        Message m = new Message(1, 1, 2, "testing", "testing content");
        MessageDao instance = new MessageDao("TheSongDbTest", "jdbc/TheSongDb");
        instance.sendMessage("1", "2", "testing", "testing content");
        boolean expResult = false;
        boolean result = instance.deleteMessage(m);
        assertEquals(expResult, result);
    }
}
