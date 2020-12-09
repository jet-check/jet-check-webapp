/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Matio Tawdrous
 */
public class Ware {
    private String warenname;

    public Ware(String warenname) {
        this.warenname = warenname;
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
    
    
}
