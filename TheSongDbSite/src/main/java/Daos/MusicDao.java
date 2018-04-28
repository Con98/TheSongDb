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
import Dtos.Api.Artist;
import Dtos.Api.Album;
import Dtos.Api.Track;
import java.net.URI;
import java.util.Scanner;
import javax.json.JsonArray;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;

import javax.ws.rs.client.ClientBuilder;
import org.jboss.resteasy.client.jaxrs.ResteasyClient;
import org.jboss.resteasy.client.jaxrs.ResteasyClientBuilder;
import org.jboss.resteasy.client.jaxrs.ResteasyWebTarget;

/**
 *
 * @author Thomas
 */
public class MusicDao {

    public MusicDao() {

    }
    private final String api_key = "581cca30b41a4cc0d5b3eb59d502b651";
//    private Client client = ClientBuilder.newBuilder().build();
//    public Client getClient(){
//        return client;
//    }

    public ArrayList<Artist> getTop10Artists() {
        ResteasyClient client = new ResteasyClientBuilder().build();
        String url = "http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&api_key=" + api_key + "&limit=10&format=json";

        URI uri = URI.create(url);
        ResteasyWebTarget target = client.target(uri);

        StringReader sr = new StringReader(target.request().get(String.class));
        JsonReader jr = Json.createReader(sr);

        JsonObject j = jr.readObject().getJsonObject("artists");
        JsonArray k = j.getJsonArray("artist");

        ArrayList<Artist> jlist = new ArrayList();
        for (int i = 0; i < 10; i++) {
            String z = k.getJsonObject(i).getJsonArray("image").getJsonObject(1).getString("#text");
            String t = k.getJsonObject(i).getString("name");
            String u = k.getJsonObject(i).getString("url");

            Artist a = new Artist(z, t, u);
            jlist.add(a);
        }

        return jlist;
    }

    public ArrayList<Album> getTop10Albums(String name) {
        ResteasyClient client = new ResteasyClientBuilder().build();
        String aName = name.replaceAll("\\s", "%20");
        String url = "http://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist=" + aName + "&api_key=" + api_key + "&limit=10&format=json";
        URI uri = URI.create(url);
        ResteasyWebTarget target = client.target(uri);
        StringReader sr = new StringReader(target.request().get(String.class));
        JsonReader jr = Json.createReader(sr);

        ArrayList<Album> jlist = new ArrayList();

        JsonObject j = jr.readObject().getJsonObject("topalbums");
        JsonArray k = j.getJsonArray("album");

        for (int i = 0; i < 10; i++) {
            String im = k.getJsonObject(i).getJsonArray("image").getJsonObject(1).getString("#text");
            String lIm = k.getJsonObject(i).getJsonArray("image").getJsonObject(3).getString("#text");
            String t = k.getJsonObject(i).getString("name");
            int z = k.getJsonObject(i).getInt("playcount");
            String u = k.getJsonObject(i).getString("url");

            Album a = new Album(t, u);
            a.setPlaycount(z);
            a.setImage(im);
            a.setLargeImage(lIm);
            jlist.add(a);
        }

        return jlist;
    }

    public Artist getArtist(String artistName) {
        ResteasyClient client = new ResteasyClientBuilder().build();
        String aName = artistName.replaceAll("\\s", "%20");
        String url = "http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=" + aName + "&api_key=" + api_key + "&format=json";
        URI uri = URI.create(url);

        ResteasyWebTarget target = client.target(uri);

        StringReader sr = new StringReader(target.request().get(String.class));
        JsonReader jr = Json.createReader(sr);

        JsonObject j = jr.readObject().getJsonObject("artist");
        JsonObject k = j.getJsonObject("bio");
        String bio = k.getString("summary");

        String im = j.getJsonArray("image").getJsonObject(3).getString("#text");
        String name = j.getString("name");
        String ur = j.getString("url");

        Artist a = new Artist(im, name, ur);
        a.setBio(bio);

        return a;
    }

    public ArrayList<Track> getAlbumTracks(String albumName, String artistName) {
        ResteasyClient client = new ResteasyClientBuilder().build();
        String arName = artistName.replaceAll("\\s", "%20");
        String alName = albumName.replaceAll("\\s", "%20");
        String url = "http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=" + api_key + "&artist=" + arName + "&album=" + alName + "&format=json";

        URI uri = URI.create(url);
        ResteasyWebTarget target = client.target(uri);

        StringReader sr = new StringReader(target.request().get(String.class));
        JsonReader jr = Json.createReader(sr);

        ArrayList<Track> jlist = new ArrayList();

        JsonObject getSth = jr.readObject().getJsonObject("album");
        
        JsonObject track = getSth.getJsonObject("tracks");
        JsonArray e = track.getJsonArray("track");

        
        for (int i = 0; i < e.size(); i++) {
            JsonObject t = e.getJsonObject(i);

            String tn = t.getString("name");
            String turl = t.getString("url");
            Track t1 = new Track(tn, turl);
            jlist.add(t1);
        }

        return jlist;

    }

    public ArrayList<Artist> searchArtist(String artistName) {
        ResteasyClient client = new ResteasyClientBuilder().build();
        String aName = artistName.replaceAll("\\s", "%20");
        String url = "http://ws.audioscrobbler.com/2.0/?method=artist.search&artist=" + aName + "&api_key=" + api_key + "&format=json";
        URI uri = URI.create(url);

        ResteasyWebTarget target = client.target(uri);

        StringReader sr = new StringReader(target.request().get(String.class));
        JsonReader jr = Json.createReader(sr);

        JsonObject j = jr.readObject().getJsonObject("results");
        JsonObject k = j.getJsonObject("artistmatches");
        JsonArray e = k.getJsonArray("artist");
        ArrayList<Artist> results = new ArrayList();
        for (int i = 0; i < e.size(); i++) {
            JsonObject t = e.getJsonObject(i);
            String im = t.getJsonArray("image").getJsonObject(1).getString("#text");
            String name = t.getString("name");
            String ur = t.getString("url");

            Artist a = new Artist(im, name, ur);
            results.add(a);
        }

        

        return results;
    }
    
    public ArrayList<Album> searchAlbum(String albumName) {
        ResteasyClient client = new ResteasyClientBuilder().build();
        String aName = albumName.replaceAll("\\s", "%20");
        String url = "http://ws.audioscrobbler.com/2.0/?method=album.search&album=" + aName + "&api_key=" + api_key + "&format=json";
        URI uri = URI.create(url);

        ResteasyWebTarget target = client.target(uri);

        StringReader sr = new StringReader(target.request().get(String.class));
        JsonReader jr = Json.createReader(sr);

        JsonObject j = jr.readObject().getJsonObject("results");
        JsonObject k = j.getJsonObject("albummatches");
        JsonArray e = k.getJsonArray("album");
        ArrayList<Album> results = new ArrayList();
        for (int i = 0; i < e.size(); i++) {
            JsonObject t = e.getJsonObject(i);
            String im = t.getJsonArray("image").getJsonObject(1).getString("#text");
            String lIm = t.getJsonArray("image").getJsonObject(3).getString("#text");
            String name = t.getString("name");
            String artist = t.getString("artist");
            String ur = t.getString("url");
            
            Album a = new Album(name, ur);
            a.setImage(im);
            a.setLargeImage(lIm);
            a.setArtist(artist);
            results.add(a);
        }

        

        return results;
    }
}
    


