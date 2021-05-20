/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.beans;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Matio Tawdrous
 */
public class Gebaeckverderb {
    private String name;
    private LocalDate date;
    private int amount;
    private static final DateTimeFormatter DTF = DateTimeFormatter.ofPattern("dd.MM.yyyy");

    public Gebaeckverderb(String name, LocalDate date, int amount) {
        this.name = name;
        this.date = date;
        this.amount = amount;
    }

    public Gebaeckverderb() {
    }

    public String getGebaeckname() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getDateFormatted() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getAnzahl() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
    @Override
    public String toString() {
        return name + ", " + date.format(DTF) + ", " + amount;
    }
}
