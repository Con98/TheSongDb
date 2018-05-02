/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Api.Album;
import Dtos.Api.Artist;
import Dtos.Api.Track;
import java.util.ArrayList;
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
        ArrayList<Artist> expResult = instance.getTop10Artists();
        ArrayList<Artist> result = instance.getTop10Artists();
        assertEquals(expResult, result);
        
    }

    /**
     * Test of getTop10Albums method, of class MusicDao.
     */
    @Test
    public void testGetTop10Albums() {
        System.out.println("getTop10Albums");
        String name = "";
        MusicDao instance = new MusicDao();
        ArrayList<Album> expResult = null;
        ArrayList<Album> result = instance.getTop10Albums(name);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getArtist method, of class MusicDao.
     */
    @Test
    public void testGetArtist() {
        System.out.println("getArtist");
        String artistName = "";
        MusicDao instance = new MusicDao();
        Artist expResult = null;
        Artist result = instance.getArtist(artistName);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAlbumTracks method, of class MusicDao.
     */
    @Test
    public void testGetAlbumTracks() {
        System.out.println("getAlbumTracks");
        String albumName = "";
        String artistName = "";
        MusicDao instance = new MusicDao();
        ArrayList<Track> expResult = null;
        ArrayList<Track> result = instance.getAlbumTracks(albumName, artistName);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of searchArtist method, of class MusicDao.
     */
    @Test
    public void testSearchArtist() {
        System.out.println("searchArtist");
        String artistName = "";
        MusicDao instance = new MusicDao();
        ArrayList<Artist> expResult = null;
        ArrayList<Artist> result = instance.searchArtist(artistName);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of searchAlbum method, of class MusicDao.
     */
    @Test
    public void testSearchAlbum() {
        System.out.println("searchAlbum");
        String albumName = "";
        MusicDao instance = new MusicDao();
        ArrayList<Album> expResult = null;
        ArrayList<Album> result = instance.searchAlbum(albumName);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
