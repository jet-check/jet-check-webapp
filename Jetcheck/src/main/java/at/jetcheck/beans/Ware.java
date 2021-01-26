/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.beans;

import java.util.Objects;

/**
 *
 * @author Matio Tawdrous
 */
public class Ware {
    private String warenname;

    public Ware(String warenname) {
        this.warenname = warenname;
    }

    public Ware() {
    }

    public String getWarenname() {
        return warenname;
    }

    public void setWarenname(String warenname) {
        this.warenname = warenname;
    }

    @Override
    public String toString() {
        return warenname;
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
        final Ware other = (Ware) obj;
        if (!Objects.equals(this.warenname, other.warenname)) {
            return false;
        }
        return true;
    }
}
