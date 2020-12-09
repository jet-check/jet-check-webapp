package servlet;

import beans.Ware;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Matio Tawdrous
 */
@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {
    private String WarenName;
    private Connection connection;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        WarenName = request.getParameter("warenname");
        request.getRequestDispatcher("WareSubmenu.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public void init() throws ServletException {
        super.init();
        connect();
    }
    
    public void connect () {
        try {
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://localhost:5432/jet-check";
            String username = "postgres";
            String password = "postgresql";
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Connection established!");
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex.toString());
        }
    }
    
    public void disconnect() {
        try {
            connection.close();
        } catch (SQLException ex) {
            System.out.println(ex.toString());
        }
    }
    
    public void insertWare() throws SQLException {
        List<Ware> warenliste = new ArrayList<>();
        String getWarenSqlString = "SELECT * FROM Ware";
        Statement stat = connection.createStatement();
        ResultSet rs = stat.executeQuery(getWarenSqlString);
        while (rs.next()) {
            String warenname = rs.getString("Warenname");
            warenliste.add(new Ware(warenname));
        }
        
        disconnect();
        connect();
        
        String insertWareSqlString = "INSERT INTO Ware (warenname) + VALUES (?);";
        PreparedStatement pStat = connection.prepareStatement(insertWareSqlString);
        pStat.setString(1, WarenName);
        pStat.executeUpdate();
    }
    
    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
