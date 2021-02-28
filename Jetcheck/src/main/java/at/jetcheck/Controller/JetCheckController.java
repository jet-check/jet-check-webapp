/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.Controller;

import at.jetcheck.beans.Bruchware;
import at.jetcheck.db.DB_Access;
import at.jetcheck.bl.PasswordValidation;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Request;

/**
 *
 * @author Gottl
 */
@WebServlet(name = "JetCheckController", urlPatterns = {"/JetCheckController"})
public class JetCheckController extends HttpServlet {

    private DB_Access dba;
    private List<String> products = new ArrayList<>();
    private List<Bruchware> brokenproducts = new ArrayList<>(); // pls DB access for this one

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
        dba = DB_Access.getInstance();
        try {
            products = dba.getAllProducts();
            brokenproducts = dba.getAllBruchware();
        } catch (SQLException ex) {
            Logger.getLogger(JetCheckController.class.getName()).log(Level.SEVERE, null, ex);
        }
        config.getServletContext().setAttribute("products", products);
        config.getServletContext().setAttribute("brokenProducts", brokenproducts);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            
            request.getServletContext().setAttribute("products", products);
            request.getServletContext().setAttribute("brokenProducts", brokenproducts);
       
        if (request.getParameter("warenliste") != null) {
            request.getRequestDispatcher("Warenliste.jsp").forward(request, response);
        } else if (request.getParameter("bruchwarenliste") != null) {
            request.getRequestDispatcher("Bruchwarenliste.jsp").forward(request, response);
        } else if (request.getParameter("sonderaufgaben") != null){
            request.getRequestDispatcher("SonderaufgabenListe.jsp").forward(request, response);
        } else if (request.getParameter("waresubmenu") != null){
            this.getServletContext().setAttribute("authorized", false);
            request.getRequestDispatcher("WareSubmenu.jsp").forward(request, response);
        } else if (request.getParameter("infosubmenu") != null){
            request.getRequestDispatcher("InfoSubmenu.jsp").forward(request, response);
        } else if (request.getParameter("gebäcksubmenu") != null) {
            request.getRequestDispatcher("GebäckSubmenu.jsp").forward(request, response);
        }
        else {
            request.getRequestDispatcher("WareSubmenu.jsp").forward(request, response);
        }
        

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
        request.setCharacterEncoding("UTF-8");
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*
            Checks if password is correct
         */
        request.setCharacterEncoding("UTF-8");
        if (request.getParameter("password") != null) {
            String pw = request.getParameter("password");
            if (PasswordValidation.checkPassword(pw)) {
                this.getServletContext().setAttribute("authorized", true);
            } else {
                request.setAttribute("wrongPassword", true);
            }
        }
        /*
            Sets the auhorization to false
        */
        if(request.getParameter("cancel") != null) {
            this.getServletContext().setAttribute("authorized", false);
        }
        /*
            Inserts the broken products into the db
         */
        if (request.getParameter("brokenproductname") != null) {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String productname = request.getParameter("brokenproductname");
            LocalDate date = LocalDate.parse(request.getParameter("date"), dtf);
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            System.out.println(productname);
            try {
                dba.insertBruchware(productname, date, quantity);
                brokenproducts = dba.getAllBruchware();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        
        /*
            Inserts new product into database and updtates product list
         */
        if (request.getParameter("productname") != null) {
            String productname = request.getParameter("productname");
            try {
                boolean isInserted = dba.insertNewProduct(productname);
                products = dba.getAllProducts();
                if (isInserted) {
                } else {
                    request.setAttribute("insertError", true);
                }
            } catch (SQLException ex) {
                request.setAttribute("insertError", true);
            }
        }

        if (request.getParameter("deleteWaren") != null) {
            List<String> productsToDelete = new ArrayList<>();
            for (String product : products) {
                String cb = request.getParameter(String.format("cb_%s", product));
                if (cb != null) {
                    System.out.println(product);
                    productsToDelete.add(product);
                }
            }
            for (String product : productsToDelete) {
                try {
                    dba.deleteWare(product);
                    products = dba.getAllProducts();
                } catch (SQLException ex) {
                    System.out.println("Ware existiert nicht oder hat noch Verknüpfungen");
                }
            }
        }
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
