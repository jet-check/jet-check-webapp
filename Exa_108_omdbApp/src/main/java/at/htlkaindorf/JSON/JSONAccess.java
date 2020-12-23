/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.htlkaindorf.JSON;

import at.htlkaindorf.beans.Movie;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.json.JsonMapper;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gottl
 */
public class JSONAccess {
    private List<Movie> movies = new ArrayList<>();
    private JsonMapper json;
    private String urlBase;
    public JSONAccess(){
        json = new JsonMapper();
        urlBase = "http://www.omdbapi.com/?apikey=610a1d81";
    }
    public List<String> searchDatabase(String pattern) throws MalformedURLException, IOException{
        List<String> movieIds = new ArrayList<>();
        String urlString = urlBase + "%s=" + pattern;
        URL url = new URL(urlString);
        JsonNode node = json.readTree(url);
        
        return movieIds;
    }
    public List<Movie> getMovies(List<String> movieIds) throws MalformedURLException, IOException{
        if(movies.isEmpty()){
            for (String movieId : movieIds) {
                String urlString = urlBase + "%i=" + movieId;
                URL url = new URL(urlString);
                JsonNode node = json.readTree(url);
            }
        }
        return movies;
    }
    
    public void clearSearch(){
        movies.clear();
    }
    
    
}
