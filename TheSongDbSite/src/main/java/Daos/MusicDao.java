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
import json.JSONObject;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author Thomas
 */
public class MusicDao {

    public MusicDao() {

    }

    public ArrayList<JSONObject> getTop10Artists() {
        RestTemplate restTemplate = new RestTemplate();
        String artist = restTemplate.getForObject("http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&api_key=581cca30b41a4cc0d5b3eb59d502b651&limit=10&format=json", String.class);

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

    public ArrayList<JSONObject> getTop10Albums(String mbid) {
        RestTemplate restTemplate = new RestTemplate();
        String album = restTemplate.getForObject("http://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&mbid=" + mbid + "&api_key=581cca30b41a4cc0d5b3eb59d502b651&limit=10&format=json", String.class);

        JSONObject j = new JSONObject(album);

        JSONObject getSth = j.getJSONObject("topalbums");
        JSONArray ja = getSth.getJSONArray("album");

        ArrayList<JSONObject> jlist = new ArrayList();
        for (int i = 0; i < 10; i++) {
            JSONObject j1 = ja.getJSONObject(i);
            jlist.add(j1);
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
}
