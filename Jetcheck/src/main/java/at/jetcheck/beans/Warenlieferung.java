/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.beans;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

/**
 *
 * @author Matio Tawdrous
 */
public class Warenlieferung {
    private String warenname;
    private LocalDate lieferdatum;
    private LocalDate ablaufdatum;
    private static final DateTimeFormatter DTF = DateTimeFormatter.ofPattern("dd.MM.yyyy");

    public Warenlieferung() {
    }
    
    public Warenlieferung(String warenname, LocalDate lieferdatum, LocalDate ablaufdatum) {
        this.warenname = warenname;
        this.lieferdatum = lieferdatum;
        this.ablaufdatum = ablaufdatum;
    }

    public String getWarenname() {
        return warenname;
    }

    public void setWarenname(String warenname) {
        this.warenname = warenname;
    }

    public LocalDate getLieferdatum() {
        return lieferdatum;
    }

    public void setLieferdatum(LocalDate lieferdatum) {
        this.lieferdatum = lieferdatum;
    }

    public LocalDate getAblaufdatum() {
        return ablaufdatum;
    }

    public void setAblaufdatum(LocalDate ablaufdatum) {
        this.ablaufdatum = ablaufdatum;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + Objects.hashCode(this.warenname);
        hash = 29 * hash + Objects.hashCode(this.lieferdatum);
        hash = 29 * hash + Objects.hashCode(this.ablaufdatum);
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
        final Warenlieferung other = (Warenlieferung) obj;
        if (!Objects.equals(this.warenname, other.warenname)) {
            return false;
        }
        if (!Objects.equals(this.lieferdatum, other.lieferdatum)) {
            return false;
        }
        if (!Objects.equals(this.ablaufdatum, other.ablaufdatum)) {
            return false;
        }
        return true;
    }
    
    
    
    @Override
    public String toString() {
        return warenname + ", " + lieferdatum.format(DTF) + ", " + ablaufdatum.format(DTF);
    }
}
