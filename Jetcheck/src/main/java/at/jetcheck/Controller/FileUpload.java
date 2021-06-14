/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.Controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "FileUpload", urlPatterns = {"/FileUpload"})
public class FileUpload extends HttpServlet {



    private final static String PATH_TO_WEBAPP = System.clearProperty("user.dir");
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
            List<FileItem> multifiles = sf.parseRequest(request);
            FileItem dienstplan = multifiles.get(0);

            dienstplan.write(new File("C:\\Users\\oujia\\Desktop\\jetcheck\\jet-check-webapp\\Jetcheck\\src\\main\\webapp\\" + "Dienstplan.pdf"));

            dienstplan.write(new File(request.getServletContext().getRealPath("/")+"Dienstplan.pdf"));

            request.setAttribute("dienstplan_path", dienstplan.getName());
        } catch (FileUploadException ex) {
            System.out.println(ex.toString());
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        
        System.out.println("file uploaded");
        request.getRequestDispatcher("DienstPlanView.jsp").forward(request, response);
    }

}
