/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import java.io.StringReader;
import java.util.ArrayList;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import json.JSONArray;
import json.JSONException;
import json.JSONObject;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author Thomas
 */
public class MusicDao {

    public MusicDao() {

    }
    private final String api_key = "581cca30b41a4cc0d5b3eb59d502b651";
    public ArrayList<JSONObject> getTop10Artists() {
        RestTemplate restTemplate = new RestTemplate();
        String artist = restTemplate.getForObject("http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&api_key="+ api_key +"&limit=10&format=json", String.class);

        JSONObject j = new JSONObject(artist);
        JSONObject getSth = j.getJSONObject("artists");
        JSONArray ja = getSth.getJSONArray("artist");

        ArrayList<JSONObject> jlist = new ArrayList();
        for (int i = 0; i < 10; i++) {
            JSONObject j1 = ja.getJSONObject(i);
            jlist.add(j1);
        }

        return jlist;
    }

    public ArrayList<JSONObject> getTop10Albums(String name) {
        RestTemplate restTemplate = new RestTemplate();
        String album = restTemplate.getForObject("http://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist=" + name + "&api_key="+ api_key +"&limit=10&format=json", String.class);
        ArrayList<JSONObject> jlist = new ArrayList();
        try{
        JSONObject j = new JSONObject(album);

        JSONObject getSth = j.getJSONObject("topalbums");
        JSONArray ja = getSth.getJSONArray("album");

        
        for (int i = 0; i < 10; i++) {
            JSONObject j1 = ja.getJSONObject(i);
            jlist.add(j1);
        }
        }catch(JSONException e){
            return null;
        }
        return jlist;
    }

    public ArrayList<String> getArt(int size) {
        MusicDao music = new MusicDao();
        ArrayList<JSONObject> artists = music.getTop10Artists();
        ArrayList<String> art = new ArrayList();

        for (int i = 0; i < artists.size(); i++) {
            JSONArray images = artists.get(i).getJSONArray("image");
            String ob = images.getJSONObject(size).get("#text").toString();
            art.add(ob);
        }
        return art;

    }
    
    public ArrayList<String> getAlbumArt(int size, String name) {
        MusicDao music = new MusicDao();
        ArrayList<String> art = new ArrayList();
        ArrayList<JSONObject> albums = music.getTop10Albums(name);
        for (int i = 0; i < albums.size(); i++) {
            JSONArray images = albums.get(i).getJSONArray("image");
            String ob = images.getJSONObject(size).get("#text").toString();
            art.add(ob);
        }
        return art;
    }
    
    public JSONObject getArtist(String artistName){
        RestTemplate restTemplate = new RestTemplate();
        String artist = restTemplate.getForObject("http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist="+ artistName +"&api_key="+ api_key +"&format=json", String.class);

        JSONObject j = new JSONObject(artist);
        JSONObject artistDetails = j.getJSONObject("artist");
        

        

        return artistDetails;
    }
    public JSONObject getArtistBio(String artistName){
        RestTemplate restTemplate = new RestTemplate();
        String artist = restTemplate.getForObject("http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist="+ artistName +"&api_key="+ api_key +"&format=json", String.class);

        JSONObject j = new JSONObject(artist);
        JSONObject artistDetails = j.getJSONObject("artist");
        JSONObject artistBio = artistDetails.getJSONObject("bio");
        

        

        return artistBio;
    }
    
    public ArrayList<JSONObject> getAlbumDetails(String artistName, String albumName) {
        RestTemplate restTemplate = new RestTemplate();
        String album = restTemplate.getForObject("http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key="+ api_key +"&artist=" + artistName + "&album=" + albumName + "&limit=10&format=json", String.class);
        ArrayList<JSONObject> jlist = new ArrayList();
        try{
        JSONObject j = new JSONObject(album);

        JSONObject getSth = j.getJSONObject("album");
        JSONObject track = getSth.getJSONObject("tracks");
        JSONArray ja = track.getJSONArray("track");

        
        for (int i = 0; i < ja.length(); i++) {
            JSONObject j1 = ja.getJSONObject(i);
            jlist.add(j1);
        }
        }catch(JSONException e){
            return null;
        }
        return jlist;
    }
}
