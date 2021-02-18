/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.db;

import at.jetcheck.beans.Bruchware;
import at.jetcheck.beans.Ware;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Matio Tawdrous
 */
public class DB_Access {

    private static DB_Access dbInstance = null;
    private DB_Database db;
    private String insertProduct = "INSERT INTO public.\"Ware\" VALUES(?);";
    private String getAllProductsString = "SELECT * FROM public.\"Ware\";";
    private String insertBruchwareString = "INSERT INTO public.\"Bruchware\" VALUES(?, ?, ?);";
    private String getAllBruchwareString = "SELECT * FROM public.\"Bruchware\";";
    private String deleteWareString="DELETE FROM public.\"Ware\" WHERE LOWER(public.\"Ware\".\"Warenname\") = LOWER(?);";
    
    private PreparedStatement insertProductStat;
    private PreparedStatement getAllProductsStat;
    private PreparedStatement insertBruchwareStat;
    private PreparedStatement getAllBruchwareStat;
    private PreparedStatement deleteWareStat;

    public static DB_Access getInstance() {
        if (dbInstance == null) {
            dbInstance = new DB_Access();
        }
        return dbInstance;
    }

    private DB_Access() {
        try {
            db = new DB_Database();
            db.connect();
        } catch (ClassNotFoundException ex) {
            System.out.println("An error occured while connecting to the database");
            ex.printStackTrace();
        } catch (SQLException ex) {
            System.out.println("An error occured while performing SQL operations");
            ex.printStackTrace();
        }
    }

    public boolean insertNewProduct(String productName) throws SQLException {
        if (insertProductStat == null) {
            insertProductStat = db.getConnection().prepareStatement(insertProduct);
        }
        if (productName.trim().equals("")) {
            return false;
        }
        insertProductStat.setString(1, productName);
        int result = insertProductStat.executeUpdate();
        if (result != 0) {
            return true;
        }
        return false;
    }

    public List<String> getAllProducts() throws SQLException {
        if (getAllProductsStat == null) {
            getAllProductsStat = db.getConnection().prepareStatement(getAllProductsString);
        }
        List<String> productList = new ArrayList<>();
        ResultSet products = getAllProductsStat.executeQuery();
        while (products.next()) {
            productList.add(products.getString("Warenname"));
        }
        return productList;
    }
    
    public boolean deleteWare(String productName) throws SQLException {
        if (deleteWareStat == null) {
            deleteWareStat = db.getConnection().prepareStatement(deleteWareString);
        }
        if (productName.trim().equals("")) {
            return false;
        }
        deleteWareStat.setString(1, productName);
        int result = deleteWareStat.executeUpdate();
        return result != 0;
    }

    public boolean insertBruchware(String productName, LocalDate datum, int anzahl) throws SQLException {
        if (insertBruchwareStat == null) {
            insertBruchwareStat = db.getConnection().prepareStatement(insertBruchwareString);
        }
        //Ware ware = new Ware(productName);
        if (getAllProducts().contains(productName)) {
            insertBruchwareStat.setString(1, productName);
            insertBruchwareStat.setDate(2, Date.valueOf(datum));
            insertBruchwareStat.setInt(3, anzahl);
            int result = insertBruchwareStat.executeUpdate();
            if (result != 0) {
                return true;
            }
        }
        else{
            System.out.println("Ware existiert nicht");
        }
        return false;
    }

    public List<Bruchware> getAllBruchware() throws SQLException {
        if (getAllBruchwareStat == null) {
            getAllBruchwareStat = db.getConnection().prepareStatement(getAllBruchwareString);
        }
        List<Bruchware> bruchwareList = new ArrayList<>();
        ResultSet bruchwaren = getAllBruchwareStat.executeQuery();
        while (bruchwaren.next()) {
            String warenname = bruchwaren.getString("Warenname");
            LocalDate datum = LocalDate.parse(bruchwaren.getDate("Datum").toString());
            int anzahl = bruchwaren.getInt("Anzahl");
            bruchwareList.add(new Bruchware(warenname, datum, anzahl));
        }
        return bruchwareList;
    }
}
