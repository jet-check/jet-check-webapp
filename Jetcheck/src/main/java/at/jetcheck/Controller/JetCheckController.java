/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.Controller;

import at.jetcheck.beans.Bruchware;
import at.jetcheck.beans.Gebaeckverderb;
import at.jetcheck.beans.Sonderaufgabe;
import at.jetcheck.beans.Warenlieferung;
import at.jetcheck.bl.PDF_Converter;
import at.jetcheck.db.DB_Access;
import at.jetcheck.bl.PasswordValidation;
import at.jetcheck.io.IO_Access;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Gottl
 */
@WebServlet(name = "JetCheckController", urlPatterns = {"/JetCheckController"})
public class JetCheckController extends HttpServlet {

    private DB_Access dba;
    private IO_Access ioa;
    private List<String> products = new ArrayList<>();
    private List<Bruchware> brokenproducts = new ArrayList<>();
    private List<Sonderaufgabe> specialTasks = new ArrayList<>();
    private List<Warenlieferung> deliveryList = new ArrayList<>();
    private DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private List<Warenlieferung> expireList = new ArrayList<>();
    private List<String> fruehaufgaben = new ArrayList<>();
    private List<String> zwischenaufgaben = new ArrayList<>();
    private List<String> spaetaufgaben = new ArrayList<>();
    private List<Gebaeckverderb> gebaeckverderb = new ArrayList<>();
    private List<String> gebaeck = new ArrayList<>();

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ioa = new IO_Access();
        dba = DB_Access.getInstance();
        try {
            products = dba.getAllProducts();
            brokenproducts = dba.getAllBruchware();
            specialTasks = dba.getAllSonderaufgabe();
            deliveryList = dba.getAllLieferungen();
            expireList = dba.getExpireToday();
            fruehaufgaben = ioa.getFruehaufgaben(getServletContext().getRealPath("src/fruehaufgaben.txt"));
            zwischenaufgaben = ioa.getZwischenaufgaben(getServletContext().getRealPath("src/zwischenaufgaben.txt"));
            spaetaufgaben = ioa.getSpaetaufgaben(getServletContext().getRealPath("src/spaetaufgaben.txt"));
            gebaeckverderb = dba.getExpiredBread();
            gebaeck = dba.getAllGebaeck();
        } catch (SQLException | IOException ex) {
            Logger.getLogger(JetCheckController.class.getName()).log(Level.SEVERE, null, ex);
        }
        config.getServletContext().setAttribute("products", products);
        config.getServletContext().setAttribute("brokenProducts", brokenproducts);
        config.getServletContext().setAttribute("Sonderaufgaben", specialTasks);
        config.getServletContext().setAttribute("deliveryList", deliveryList);
        config.getServletContext().setAttribute("expireToday", expireList);
        config.getServletContext().setAttribute("fruehaufgaben", fruehaufgaben);
        config.getServletContext().setAttribute("zwischenaufgaben", zwischenaufgaben);
        config.getServletContext().setAttribute("spaetaufgaben", spaetaufgaben);
        config.getServletContext().setAttribute("verderbGebaeck", gebaeckverderb);
        config.getServletContext().setAttribute("gebaeck", gebaeck);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        request.setAttribute("products", products);
        request.setAttribute("brokenProducts", brokenproducts);
        request.setAttribute("Sonderaufgaben", specialTasks);
        request.setAttribute("deliveryList", deliveryList);
        request.setAttribute("expireToday", expireList);
        request.setAttribute("fruehaufgaben", fruehaufgaben);
        request.setAttribute("zwischenaufgaben", zwischenaufgaben);
        request.setAttribute("speataufgaben", spaetaufgaben);
        request.setAttribute("verderbGebaeck", gebaeckverderb);
        request.setAttribute("gebaeck", gebaeck);
        
        if (request.getParameter("warenliste") != null) {
            request.getRequestDispatcher("Warenliste.jsp").forward(request, response);
        } else if (request.getParameter("bruchwarenliste") != null) {
            request.getRequestDispatcher("Bruchwarenliste.jsp").forward(request, response);
        } else if (request.getParameter("sonderaufgaben") != null) {
            request.getRequestDispatcher("SonderaufgabenListe.jsp").forward(request, response);
        } else if (request.getParameter("waresubmenu") != null) {
            this.getServletContext().setAttribute("authorized", false);
            request.getRequestDispatcher("WareSubmenu.jsp").forward(request, response);
        } else if (request.getParameter("infosubmenu") != null) {
            this.getServletContext().setAttribute("authorized", false);
            request.getRequestDispatcher("InfoSubmenu.jsp").forward(request, response);
        } else if (request.getParameter("gebäcksubmenu") != null) {
            this.getServletContext().setAttribute("authorized", false);
            request.getRequestDispatcher("GebäckSubmenu.jsp").forward(request, response);
        } else if (request.getParameter("lieferungenliste") != null) {
            request.getRequestDispatcher("LieferungenListe.jsp").forward(request, response);
        } else if (request.getParameter("dienstplan") != null) {
            request.getRequestDispatcher("DienstPlanView.jsp").forward(request, response);
        } else if (request.getParameter("schichtaufgaben") != null) {
            request.getRequestDispatcher("SchichtaufgabenSubmenu.jsp").forward(request, response);
        } else if (request.getParameter("frueh") != null) {
            request.getRequestDispatcher("Dienstanzeige.jsp").forward(request, response);
        } else if (request.getParameter("zwischen") != null) {
            request.getRequestDispatcher("Dienstanzeige.jsp").forward(request, response);
        } else if (request.getParameter("spaet") != null) {
            request.getRequestDispatcher("Dienstanzeige.jsp").forward(request, response);
        } else if (request.getParameter("GebaeckEntnahmen") != null){
            request.getRequestDispatcher("GebaeckEntnahmenView.jsp").forward(request, response);
        } else if (request.getParameter("gebaeckverderbliste") != null) {
            request.getRequestDispatcher("GebaeckVerderbListe.jsp").forward(request, response);
        } else {
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
        if (request.getParameter("cancel") != null) {
            this.getServletContext().setAttribute("authorized", false);
        }
        /*
            Inserts the broken products into the db
         */
        if (request.getParameter("brokenproductname") != null) {
            String productname = request.getParameter("brokenproductname");
            LocalDate date = LocalDate.parse(request.getParameter("date"), dtf);
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            System.out.println(productname);
            try {
                dba.insertBruchware(productname, date, quantity);
                brokenproducts = dba.getAllBruchware();

                for (Bruchware brokenproduct : brokenproducts) {
                    System.out.println(brokenproduct);
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

//          Delete Bruchwaren
        if (request.getParameter("deleteBWaren") != null) {
            List<Bruchware> brokenProductsToBeDeleted = new ArrayList<>();
            for (Bruchware brokenProduct : brokenproducts) {
                String cb = request.getParameter(String.format("cb_%s", brokenProduct));
                System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + cb);
                if (cb != null) {
                    brokenProductsToBeDeleted.add(brokenProduct);
                }
            }

            for (Bruchware brokenProduct : brokenProductsToBeDeleted) {
                try {
                    boolean test = dba.deleteBruchware(brokenProduct.getWarenname(), brokenProduct.getDatum(), brokenProduct.getAnzahl());
                    brokenproducts = dba.getAllBruchware();
                    System.out.println(test);
                } catch (SQLException ex) {
                    System.out.println(ex.toString());
                    System.out.println("Ware existiert nicht oder hat noch Verknüpfungen");
                }
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

        /*
            Deletes product from database
         */
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

        // Inserts special task
        if (request.getParameter("specialTask") != null) {
            String employee = request.getParameter("employeeName");
            String task = request.getParameter("specialTask");
            String dateStr = request.getParameter("date");
            String desc = request.getParameter("description");
            int id = specialTasks.size() + 1;
            System.out.println(dateStr);
            LocalDate date = LocalDate.parse(dateStr, dtf);

            try {
                dba.insertSonderaufgabe(desc, date, employee, task, id);
                specialTasks = dba.getAllSonderaufgabe();
            } catch (SQLException ex) {
                ex.printStackTrace();
                System.out.println("Fehler bei einfuegen der Sonderaufgabe!");
            }
        }

        // Inserts Delivery
        if (request.getParameter("deliveryproductname") != null) {
            String ware = request.getParameter("deliveryproductname");
            SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date(System.currentTimeMillis());
            String deliverydateStr = formatter.format(date);
            String expirydateStr = request.getParameter("ExpiryDate");
            LocalDate deliverydate = LocalDate.parse(deliverydateStr, dtf);
            LocalDate expirydate = LocalDate.parse(expirydateStr, dtf);

            try {
                dba.insertLieferung(ware, deliverydate, expirydate);
                deliveryList = dba.getAllLieferungen();
                expireList = dba.getExpireToday();
            } catch (SQLException ex) {
                ex.printStackTrace();
                System.out.println("Fehler beim Einfuegen der Lieferung!");
            }
        }

        // Deletes Delivery
        if (request.getParameter("deleteLieferung") != null) {
            List<Warenlieferung> deliveriesToDelete = new ArrayList<>();
            for (Warenlieferung delivery : deliveryList) {
                String cb = request.getParameter(String.format("cb_%s", delivery));
                if (cb != null) {
                    deliveriesToDelete.add(delivery);
                }
            }
            for (Warenlieferung lieferung : deliveriesToDelete) {
                try {
                    boolean test = dba.deleteLieferung(lieferung.getWarenname(), lieferung.getAblaufdatum(), lieferung.getLieferdatum());
                    deliveryList = dba.getAllLieferungen();
                    expireList = dba.getExpireToday();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                    System.out.println("Lieferung existiert nicht oder hat noch Verknüpfungen");
                }
            }
        }

        if (request.getParameter("frueh") != null) {
            request.setAttribute("schicht", "Frühdienst");
            request.setAttribute("todoList", fruehaufgaben);
        } else if (request.getParameter("zwischen") != null) {
            request.setAttribute("schicht", "Zwischendienst");
            request.setAttribute("todoList", zwischenaufgaben);
        } else if (request.getParameter("spaet") != null) {
            request.setAttribute("schicht", "Spätdienst");
            request.setAttribute("todoList", spaetaufgaben);
        }

        if (request.getParameter("exportBrokenProducts") != null) {
            PDF_Converter exportBrokenProductsToPdf = new PDF_Converter();
            try {
                LocalDate von_datum = LocalDate.parse(request.getParameter("vonDate"), dtf);
                LocalDate bis_datum = LocalDate.parse(request.getParameter("bisDate"), dtf);
                List<Bruchware> bruchwaren_to_be_exported = new LinkedList<>();
                List<Bruchware> all_bruchwaren = dba.getAllBruchware();
                System.out.println(request.getParameter("vonDate"));
                for (int i = 0; i < all_bruchwaren.size(); i++) {
                    LocalDate gotDate = all_bruchwaren.get(i).getDatum();
                    if(gotDate.isAfter(von_datum) && gotDate.isBefore(bis_datum)) {
                        bruchwaren_to_be_exported.add(all_bruchwaren.get(i));
                    }
                }
                
                exportBrokenProductsToPdf.exportBruchwarenPdf(bruchwaren_to_be_exported, von_datum.toString(), bis_datum.toString());
            } catch (SQLException ex) {
                ex.printStackTrace();
                System.out.println("Fehler beim Exportieren der Bruchwaren.");
            }
        }
        //Insert gebäckverderb into db
        if (request.getParameter("gebaeckverderbname") != null) {
            String productname = request.getParameter("gebaeckverderbname");
            String date = request.getParameter("date");
            int amount = Integer.parseInt(request.getParameter("quantity"));
            try {
                boolean isInserted = dba.insertExpiredBread(productname, LocalDate.parse(date), amount);
                gebaeckverderb = dba.getExpiredBread();
                gebaeck = dba.getAllGebaeck();
                if (isInserted) {
                } else {
                    request.setAttribute("insertError", true);
                }
            } catch (SQLException ex) {
                request.setAttribute("insertError", true);
            }
        }
        
        //Delete gebackverderb
        if (request.getParameter("gebaeckverderbliste") != null) {
            List<Gebaeckverderb> gebaeckverderbToDelete = new ArrayList<>();
            for (Gebaeckverderb gebaeck : gebaeckverderbToDelete) {
                String cb = request.getParameter(String.format("cb_%s", gebaeck));
                if (cb != null) {
                    gebaeckverderbToDelete.add(gebaeck);
                }
            }
            for (Gebaeckverderb gebaeck : gebaeckverderbToDelete) {
                try {
                    boolean test = dba.deleteExpiredBread(gebaeck.getGebaeckname(), gebaeck.getDateFormatted(), gebaeck.getAnzahl());
                    gebaeckverderb = dba.getExpiredBread();
                    this.gebaeck = dba.getAllGebaeck();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                    System.out.println("Verderb existiert nicht oder hat noch Verknüpfungen");
                }
            }
        }
        //edit Frühaufgaben
        if (request.getParameter("editFruehaufgabe") != null) {
            List<String> new_fruehaufgaben = new ArrayList<>();
            for (String string : new_fruehaufgaben) {
                String cb = request.getParameter(String.format("cb_%s", string));
                if (cb != null) {
                    new_fruehaufgaben.add(cb);
                }
            }
            ioa.editFruehaufgaben(new_fruehaufgaben, getServletContext().getRealPath("src/fruehaufgaben.txt"));
            fruehaufgaben = ioa.getFruehaufgaben(getServletContext().getRealPath("src/fruehaufgaben.txt"));
        }
        //edit Zwischenaufhaben
        if (request.getParameter("editZwischenaufgabe") != null) {
            List<String> new_zwischenaufgaben = new ArrayList<>();
            for (String string : new_zwischenaufgaben) {
                String cb = request.getParameter(String.format("cb_%s", string));
                if (cb != null) {
                    new_zwischenaufgaben.add(cb);
                }
            }
            ioa.editZwischenaufgaben(new_zwischenaufgaben, getServletContext().getRealPath("src/zwischenaufgaben.txt"));
            zwischenaufgaben = ioa.getFruehaufgaben(getServletContext().getRealPath("src/zwischenaufgaben.txt"));
        }
        //edit Spätaufgaben
        if (request.getParameter("editSpaetaufgaben") != null) {
            List<String> new_spaetaufgaben = new ArrayList<>();
            for (String string : new_spaetaufgaben) {
                String cb = request.getParameter(String.format("cb_%s", string));
                if (cb != null) {
                    new_spaetaufgaben.add(cb);
                }
            }
            ioa.editSpaetaufgaben(new_spaetaufgaben, getServletContext().getRealPath("src/spaetaufgaben.txt"));
            spaetaufgaben = ioa.getFruehaufgaben(getServletContext().getRealPath("src/spaetaufgaben.txt"));
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
