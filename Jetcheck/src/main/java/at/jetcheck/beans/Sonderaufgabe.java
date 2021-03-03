/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.beans;

import java.time.LocalDate;

/**
 *
 * @author Matio Tawdrous
 */
public class Sonderaufgabe {
    private String beschreibung;
    private LocalDate datum;
    private String Mitarbeiter;
    private String name;
    private String id;

    public Sonderaufgabe(String beschreibung, LocalDate datum, String Mitarbeiter, String name, String id) {
        this.beschreibung = beschreibung;
        this.datum = datum;
        this.Mitarbeiter = Mitarbeiter;
        this.name = name;
        this.id = id;
    }

    public Sonderaufgabe() {
    }
    
    public String getBeschreibung() {
        return beschreibung;
    }

    public void setBeschreibung(String beschreibung) {
        this.beschreibung = beschreibung;
    }

    public LocalDate getDatum() {
        return datum;
    }

    public void setDatum(LocalDate datum) {
        this.datum = datum;
    }

    public String getMitarbeiter() {
        return Mitarbeiter;
    }

    public void setMitarbeiter(String Mitarbeiter) {
        this.Mitarbeiter = Mitarbeiter;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
