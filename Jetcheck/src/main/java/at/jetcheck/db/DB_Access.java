/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.db;

import at.jetcheck.beans.Bruchware;
import at.jetcheck.beans.Gebaeckverderb;
import at.jetcheck.beans.Sonderaufgabe;
import at.jetcheck.beans.Warenlieferung;
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
    private String deleteBruchwareString = "DELETE FROM public.\"Bruchware\" WHERE LOWER(public.\"Bruchware\".\"Warenname\") = LOWER(?) AND (public.\"Bruchware\".\"Datum\" = (?)) AND (public.\"Bruchware\".\"Anzahl\" = (?));";
    private String insertLieferungString = "INSERT INTO public.\"Warenlieferung\" VALUES (?, ?, ?);";
    private String getAllLieferungString = "SELECT * FROM public.\"Warenlieferung\" ORDER BY public.\"Warenlieferung\".\"Ablaufsdatum\" ASC;";
    private String deleteLieferungString = "DELETE FROM public.\"Warenlieferung\" WHERE (public.\"Warenlieferung\".\"Ablaufsdatum\" = (?)) AND (public.\"Warenlieferung\".\"Lieferdatum\" = (?)) AND LOWER(public.\"Warenlieferung\".\"Warenname\") = LOWER(?);";
    private String insertSonderaufgabeString = "INSERT INTO public.\"Sonderaufgabe\"(\"Beschreibung\", \"Datum\", \"Mitarbeiter\", \"Sonderaufgabenname\", \"SonderaufgabenID\") VALUES (?, ?, ?, ?, ?);";
    private String getAllSonderaufgabeString = "SELECT * FROM public.\"Sonderaufgabe\";";
    private String deleteSonderaufgabeString = "DELETE FROM public.\"Sonderaufgabe\" WHERE (\"Sonderaufgabe\".\"SonderaufgabenID\" = (?)) AND (LOWER(\"Sonderaufgabe\".\"Sonderaufgabenname\") = LOWER(?)) AND (LOWER(public.\"Sonderaufgabe\".\"Mitarbeiter) = LOWER(?)) AND (public.\"Sonderaufgabe\".\"Datum\" = (?))";
    private String insertExpiredBreadString = "INSERT INTO public.\"GebaeckVerderb\" VALUES (?, ?, ?);";
    private String getExpiredBreadString = "SELECT * FROM public.\"GebaeckVerderb\"";
    private String deleteExpiredBreadString = "DELETE FROM public.\"GebaeckVerderb\" WHERE (LOWER(public.\"GebaeckVerderb\".\"Gebaeckname\") = LOWER(?)) AND (public.\"GebaeckVerderb\".\"Datum\" = (?)) AND (public.\"GebaeckVerderb\".\"Anzahl\" = (?);";
    private PreparedStatement insertProductStat;
    private PreparedStatement getAllProductsStat;
    private PreparedStatement deleteProductStat;
    private PreparedStatement insertBruchwareStat;
    private PreparedStatement getAllBruchwareStat;
    private PreparedStatement deleteBruchwareStat;
    private PreparedStatement insertLieferungStat;
    private PreparedStatement getAllLieferungStat;
    private PreparedStatement deleteLieferungStat;
    private PreparedStatement insertSonderaufgabeStat;
    private PreparedStatement getAllSonderaufgabeStat;
    private PreparedStatement deleteSonderaufgabeStat;
    private PreparedStatement insertExpiredBreadStat;
    private PreparedStatement getExpiredBreadStat;
    private PreparedStatement deleteExpiredBreadStat;
    
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
            System.out.println(ex);
        } catch (SQLException ex) {
            System.out.println("An error occured while performing SQL operations");
            System.out.println(ex);
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
        return result != 0;
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
        if (!getAllProducts().contains(productName)) {
            insertBruchwareStat.setString(1, productName);
            insertBruchwareStat.setDate(2, Date.valueOf(datum));
            insertBruchwareStat.setInt(3, anzahl);
            
            int result = insertBruchwareStat.executeUpdate();
            if (result != 0) {
                return true;
            }
        } else {
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

    public boolean deleteBruchware(String productName, LocalDate datum, int anzahl) throws SQLException {
        if (deleteBruchwareStat == null) {
            deleteBruchwareStat = db.getConnection().prepareStatement(deleteBruchwareString);
        }
        if (productName.trim().equals("") || anzahl == 0 || datum == null) {
            System.out.println("?????????????????????????");
            return false;
        }
        deleteBruchwareStat.setString(1, productName);
        deleteBruchwareStat.setDate(2, Date.valueOf(datum));
        deleteBruchwareStat.setInt(3, anzahl);
        int result = deleteBruchwareStat.executeUpdate();
        return result != 0;
    }

    public boolean insertLieferung(String productName, LocalDate Lieferdatum, LocalDate Ablaufdatum) throws SQLException {
        if (insertLieferungStat == null) {
            insertLieferungStat = db.getConnection().prepareStatement(insertLieferungString);
        }
        Warenlieferung warenlieferung = new Warenlieferung(productName, Lieferdatum, Ablaufdatum);
        if (!getAllLieferungen().contains(warenlieferung) && getAllProducts().contains(productName)) {
            insertLieferungStat.setDate(1, Date.valueOf(Ablaufdatum));
            insertLieferungStat.setDate(2, Date.valueOf(Lieferdatum));
            insertLieferungStat.setString(3, productName);
            int result = insertLieferungStat.executeUpdate();
            if (result != 0) {
                return true;
            }
        } else {
            System.out.println("Ware existiert nicht");
        }
        return false;
    }

    public List<Warenlieferung> getAllLieferungen() throws SQLException {
        if (getAllLieferungStat == null) {
            getAllLieferungStat = db.getConnection().prepareStatement(getAllLieferungString);
        }
        List<Warenlieferung> warenlieferungList = new ArrayList<>();
        ResultSet warenlieferungen = getAllLieferungStat.executeQuery();
        while (warenlieferungen.next()) {
            String warenname = warenlieferungen.getString("Warenname");
            LocalDate lieferdatum = LocalDate.parse(warenlieferungen.getDate("Lieferdatum").toString());
            LocalDate ablaufdatum = LocalDate.parse(warenlieferungen.getDate("Ablaufsdatum").toString());
            warenlieferungList.add(new Warenlieferung(warenname, lieferdatum, ablaufdatum));
        }
        return warenlieferungList;
    }

    public boolean deleteLieferung(String productName, LocalDate Lieferdatum, LocalDate Ablaufdatum) throws SQLException {
        if (deleteLieferungStat == null) {
            deleteLieferungStat = db.getConnection().prepareStatement(deleteLieferungString);
        }
        //Lieferdatum und Ablaufdatum verkehrt in jsp, daher reihenfolge hier geaendert :)
        deleteLieferungStat.setDate(1, Date.valueOf(Lieferdatum));
        deleteLieferungStat.setDate(2, Date.valueOf(Ablaufdatum));
        deleteLieferungStat.setString(3, productName);

        int result = deleteLieferungStat.executeUpdate();
        return result != 0;
    }

    public boolean insertSonderaufgabe(String beschreibung, LocalDate datum, String mitarbeiter, String name, int id) throws SQLException {
        if (insertSonderaufgabeStat == null) {
            insertSonderaufgabeStat = db.getConnection().prepareStatement(insertSonderaufgabeString);
        }
        Sonderaufgabe sonderaufgabe = new Sonderaufgabe(beschreibung, datum, mitarbeiter, name, id);
        if (!getAllSonderaufgabe().contains(sonderaufgabe)) {
            insertSonderaufgabeStat.setString(1, beschreibung);
            insertSonderaufgabeStat.setDate(2, Date.valueOf(datum));
            insertSonderaufgabeStat.setString(3, mitarbeiter);
            insertSonderaufgabeStat.setString(4, name);
            insertSonderaufgabeStat.setInt(5, id);
            int result = insertSonderaufgabeStat.executeUpdate();
            if (result != 0) {
                return true;
            }
        } else {
            System.out.println("error beim sonderaufgaben einfügen db_access");
        }
        return false;
    }

    public List<Sonderaufgabe> getAllSonderaufgabe() throws SQLException {
        if (getAllSonderaufgabeStat == null) {
            getAllSonderaufgabeStat = db.getConnection().prepareStatement(getAllSonderaufgabeString);
        }
        List<Sonderaufgabe> sonderaufgabeList = new ArrayList<>();
        ResultSet sonderaufgaben = getAllSonderaufgabeStat.executeQuery();
        while (sonderaufgaben.next()) {
            String beschreibung = sonderaufgaben.getString("Beschreibung");
            LocalDate datum = LocalDate.parse(sonderaufgaben.getDate("Datum").toString());
            String mitarbeiter = sonderaufgaben.getString("Mitarbeiter");
            String name = sonderaufgaben.getString("Sonderaufgabenname");
            int id = sonderaufgaben.getInt("SonderaufgabenID");
            sonderaufgabeList.add(new Sonderaufgabe(beschreibung, datum, mitarbeiter, name, id));
        }
        return sonderaufgabeList;
    }

    public boolean deleteSonderaufgabe(String beschreibung, LocalDate datum, String mitarbeiter, String name, int id) throws SQLException {
        if (deleteSonderaufgabeStat == null) {
            deleteSonderaufgabeStat = db.getConnection().prepareStatement(deleteSonderaufgabeString);
        }
        if (beschreibung.trim().equals("") || datum == null || mitarbeiter.trim().equals("") || name.trim().equals("")) {
            return false;
        }
        deleteSonderaufgabeStat.setString(1, beschreibung);
        deleteSonderaufgabeStat.setDate(2, Date.valueOf(datum));
        deleteSonderaufgabeStat.setString(3, mitarbeiter);
        deleteSonderaufgabeStat.setString(4, name);
        deleteSonderaufgabeStat.setInt(5, id);
        int result = deleteSonderaufgabeStat.executeUpdate();
        return result != 0;
    }
    
    public List<Warenlieferung> getExpireToday() throws SQLException {
        List<Warenlieferung> deliveryList = new ArrayList<>();
        getAllLieferungen().stream().filter(warenlieferung -> (warenlieferung.getAblaufdatum().equals(LocalDate.now()))).forEachOrdered(warenlieferung -> {
            deliveryList.add(warenlieferung);
        });
        return deliveryList;
    }
    
    public boolean insertExpiredBread(String name, LocalDate date, int amount) throws SQLException {
        if (insertExpiredBreadStat == null) {
            insertExpiredBreadStat = db.getConnection().prepareStatement(insertExpiredBreadString);
        }
        if (name.trim().equals("")) {
            return false;
        }
        insertExpiredBreadStat.setString(1, name);
        insertExpiredBreadStat.setDate(2, Date.valueOf(date));
        insertExpiredBreadStat.setInt(3, amount);
        int result = insertExpiredBreadStat.executeUpdate();
        return result != 0;
    }
    
    public List<Gebaeckverderb> getExpiredBread() throws SQLException {
        if (getExpiredBreadStat == null) {
            getExpiredBreadStat = db.getConnection().prepareStatement(getExpiredBreadString);
        }
        List<Gebaeckverderb> expiredBreadList = new ArrayList<>();
        ResultSet expiredBread = getExpiredBreadStat.executeQuery();
        while (expiredBread.next()) {
            expiredBreadList.add(new Gebaeckverderb(expiredBread.getString("Gebaeckname"), expiredBread.getDate("Datum").toLocalDate(), expiredBread.getInt("Anzahl")));
        }
        return expiredBreadList;
    }
    
    public boolean deleteExpiredBread(String name, LocalDate date, int amount) throws SQLException {
        if (deleteExpiredBreadStat == null) {
            deleteExpiredBreadStat = db.getConnection().prepareStatement(deleteExpiredBreadString);
        }
        if (name.trim().equals("") || date == null) {
            return false;
        }
        deleteExpiredBreadStat.setString(1, name);
        deleteExpiredBreadStat.setDate(2, Date.valueOf(date));
        deleteExpiredBreadStat.setInt(3, amount);
        int result = deleteExpiredBreadStat.executeUpdate();
        return result != 0;
    }
}
