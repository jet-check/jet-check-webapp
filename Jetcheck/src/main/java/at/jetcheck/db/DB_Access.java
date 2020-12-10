/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Matio Tawdrous
 */
public class DB_Access {
    private static DB_Access dbInstance = null;
    private DB_Database db;
    private String insertProduct ="INSERT INTO public.\"Ware\" VALUES(?)";
    private String getAllProductsString = "SELECT * FROM public.\"Ware\"";
    private PreparedStatement insertProductStat;
    private PreparedStatement getAllProductsStat;
    
    
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
    
    public boolean insertNewProduct(String productName) throws SQLException{
        if(insertProductStat == null){
            insertProductStat = db.getConnection().prepareStatement(insertProduct);
        }
        if(productName.trim().equals("")){
            return false;
        }
        insertProductStat.setString(1, productName);
        int result = insertProductStat.executeUpdate();
        if(result != 0)
            return true;
        return false; 
    }
    public List<String> getAllProducts() throws SQLException{
        if(getAllProductsStat == null){
            getAllProductsStat = db.getConnection().prepareStatement(getAllProductsString);
        }
        List<String> productList = new ArrayList<>();
        ResultSet products = getAllProductsStat.executeQuery();
        while(products.next()){
            productList.add(products.getString("Warenname"));
        }
        return productList;
    
    }
    
}
