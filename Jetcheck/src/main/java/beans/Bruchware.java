/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.time.LocalDate;
import java.util.Objects;

/**
 *
 * @author Matio Tawdrous
 */
public class Bruchware {
    private String warenname;
    private LocalDate datum;
    private int anzahl;

    public Bruchware(String warenname, LocalDate datum, int anzahl) {
        this.warenname = warenname;
        this.datum = datum;
        this.anzahl = anzahl;
    }

    public Bruchware() {
    }

    public String getWarenname() {
        return warenname;
    }

    public void setWarenname(String warenname) {
        this.warenname = warenname;
    }

    public LocalDate getDatum() {
        return datum;
    }

    public void setDatum(LocalDate datum) {
        this.datum = datum;
    }

    public int getAnzahl() {
        return anzahl;
    }

    public void setAnzahl(int anzahl) {
        this.anzahl = anzahl;
    }

    @Override
    public int hashCode() {
        int hash = 5;
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
        final Bruchware other = (Bruchware) obj;
        if (this.anzahl != other.anzahl) {
            return false;
        }
        if (!Objects.equals(this.warenname, other.warenname)) {
            return false;
        }
        if (!Objects.equals(this.datum, other.datum)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return warenname + "," + datum + "," + anzahl;
    }
}
