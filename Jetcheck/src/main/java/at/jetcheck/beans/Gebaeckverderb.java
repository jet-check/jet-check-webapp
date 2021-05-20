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
public class Gebaeckverderb {
    private String name;
    private LocalDate date;
    private int amount;

    public Gebaeckverderb(String name, LocalDate date, int amount) {
        this.name = name;
        this.date = date;
        this.amount = amount;
    }

    public Gebaeckverderb() {
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
