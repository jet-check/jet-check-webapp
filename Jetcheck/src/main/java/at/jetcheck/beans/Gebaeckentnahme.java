/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.beans;

import java.time.LocalDate;
import java.util.Objects;

public class Gebaeckentnahme {
    private LocalDate date;
    private int anzahl;
    private String gebaeckname;

    public Gebaeckentnahme(LocalDate date, int anzahl, String gebaeckname) {
        this.date = date;
        this.anzahl = anzahl;
        this.gebaeckname = gebaeckname;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getAnzahl() {
        return anzahl;
    }

    public void setAnzahl(int anzahl) {
        this.anzahl = anzahl;
    }

    public String getGebaeckname() {
        return gebaeckname;
    }

    public void setGebaeckname(String gebaeckname) {
        this.gebaeckname = gebaeckname;
    }

    @Override
    public int hashCode() {
        int hash = 7;
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
        final Gebaeckentnahme other = (Gebaeckentnahme) obj;
        if (this.anzahl != other.anzahl) {
            return false;
        }
        if (!Objects.equals(this.gebaeckname, other.gebaeckname)) {
            return false;
        }
        if (!Objects.equals(this.date, other.date)) {
            return false;
        }
        return true;
    }
    
    
}
