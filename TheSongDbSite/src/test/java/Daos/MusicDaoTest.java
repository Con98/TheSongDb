/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import java.util.ArrayList;
import json.JSONObject;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author thoma
 */
public class MusicDaoTest {
    
    public MusicDaoTest() {
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
     * Test of getTop10Artists method, of class MusicDao.
     */
    @Test
    public void testGetTop10Artists() {
        System.out.println("getTop10Artists");
        MusicDao instance = new MusicDao();
        ArrayList<JSONObject> expResult = instance.getTop10Artists();
        ArrayList<JSONObject> result = instance.getTop10Artists();
        assertEquals(expResult, result);
        
    }

    /**
     * Test of getTop10Albums method, of class MusicDao.
     */
    @Test
    public void testGetTop10Albums() {
        System.out.println("getTop10Albums");
        String name = "Kendrick Lamar";
        MusicDao instance = new MusicDao();
        ArrayList<JSONObject> expResult = instance.getTop10Albums(name);
        ArrayList<JSONObject> result = instance.getTop10Albums(name);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of getArt method, of class MusicDao.
     */
    @Test
    public void testGetArt() {
        System.out.println("getArt");
        int size = 2;
        MusicDao instance = new MusicDao();
        ArrayList<String> expResult = instance.getArt(size);
        ArrayList<String> result = instance.getArt(size);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of getAlbumArt method, of class MusicDao.
     */
    @Test
    public void testGetAlbumArt() {
        System.out.println("getAlbumArt");
        int size = 2;
        String name = "Kendrick Lamar";
        MusicDao instance = new MusicDao();
        ArrayList<String> expResult = instance.getAlbumArt(size, name);
        ArrayList<String> result = instance.getAlbumArt(size, name);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of getArtist method, of class MusicDao.
     */
    @Test
    public void testGetArtist() {
        System.out.println("getArtist");
        String artistName = "Taylor Swift";
        MusicDao instance = new MusicDao();
        JSONObject expResult = instance.getArtist(artistName);
        JSONObject result = instance.getArtist(artistName);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of getArtistBio method, of class MusicDao.
     */
    @Test
    public void testGetArtistBio() {
        System.out.println("getArtistBio");
        String artistName = "";
        MusicDao instance = new MusicDao();
        JSONObject expResult = null;
        JSONObject result = instance.getArtistBio(artistName);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
