/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.htlkaindorf.beans;

import java.time.LocalDate;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;

/**
 *
 * @author Gottl
 */
@Data
@AllArgsConstructor
public class Movie {
    private String id;
    private String title;
    private LocalDate releaseDate;
    private int runtime;
    private String rating;
    private List<String> genres;
    private String director;
    private List<String> writers;
    private List<String> actors;
    private String production;
    private String plot;
    private String poster;
    private String metacritics;
    private String imdbRating;  
}
