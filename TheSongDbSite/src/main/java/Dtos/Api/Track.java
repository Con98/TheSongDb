/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos.Api;

import java.util.Objects;

/**
 *
 * @author Thomas
 */
public class Track {
    private String name;
    private String url;
    private String genre;
    private String genreUrl;
    private String imageUrl;

    public Track(String name, String url){
        this.name = name;
        this.url = url;
    }

    @Override
    public String toString() {
        return "Track{" + "name=" + name + ", url=" + url + ", genre=" + genre + ", genreUrl=" + genreUrl + '}';
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getGenreUrl() {
        return genreUrl;
    }

    public void setGenreUrl(String genreUrl) {
        this.genreUrl = genreUrl;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 23 * hash + Objects.hashCode(this.url);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Track other = (Track) obj;
        if (!Objects.equals(this.url, other.url)) {
            return false;
        }
        return true;
    }
    
    
}
