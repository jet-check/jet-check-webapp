/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.db;

import at.jetcheck.beans.Bruchware;
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
    private String insertProductString = "INSERT INTO public.\"Ware\" VALUES(?);";
    private String getAllProductsString = "SELECT * FROM public.\"Ware\";";
    private String deleteProductString = "DELETE FROM public.\"Ware\" WHERE LOWER(public.\"Ware\".\"Warenname\") = LOWER(?);";
    private String insertBruchwareString = "INSERT INTO public.\"Bruchware\" VALUES(?, ?, ?);";
    private String getAllBruchwareString = "SELECT * FROM public.\"Bruchware\";";
    private String deleteBruchwareString = "DELETE FROM public.\"Bruchware\" WHERE (LOWER(public.\"Bruchware\".\"Warename\") = LOWER(?)) AND (public.\"Bruchware\".\"Anzahl\" = (?)) AND (public.\"Bruchware\".\"Datum\" = (?);";
    private String insertLieferungString = "INSERT INTO public.\"Warenlieferung\" VALUES (?, ?, ?);";
    private String getAllLieferungString = "SELECT * FROM public.\"Warenlieferung\";";
    private String deleteLiefeungString= "DELETE FROM public.\"Warenlieferung\" WHERE (LOWER(public.\"Warenlieferung\".\"Warenname\") = LOWER(?)) AND (public.\"Warenlieferung\".\"Lieferdatum\" = (?)) AND (public.\"Warenlieferung\".\"Ablaufdatum\" = (?);";
    private PreparedStatement insertProductStat;
    private PreparedStatement getAllProductsStat;
    private PreparedStatement deleteProductStat;
    private PreparedStatement insertBruchwareStat;
    private PreparedStatement getAllBruchwareStat;
    private PreparedStatement deleteBruchwareStat;
    private PreparedStatement insertLieferungStat;
    private PreparedStatement getAllLieferungStat;
    private PreparedStatement deleteLieferungStat;
    
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
            insertProductStat = db.getConnection().prepareStatement(insertProductString);
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
        if (deleteProductStat == null) {
            deleteProductStat = db.getConnection().prepareStatement(deleteProductString);
        }
        if (productName.trim().equals("")) {
            return false;
        }
        deleteProductStat.setString(1, productName);
        int result = deleteProductStat.executeUpdate();
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
