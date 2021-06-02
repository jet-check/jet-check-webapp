/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.bl;

import at.jetcheck.beans.Bruchware;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.HorizontalAlignment;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.UnitValue;
import java.io.FileNotFoundException;
import java.util.List;

public class PDF_Converter {

    private static Color jetcheck_yellow = new DeviceRgb(253, 196, 0);
    private static String[] BRUCHWARE_COLUMNNAME = {"Warenname", "Datum", "Anzahl"};
    
    public void exportBruchwarenPdf(List<Bruchware> bruchwaren, String von, String bis) throws FileNotFoundException {
        // Must have write permissions to the path folder
        PdfWriter writer = new PdfWriter(System.getProperty("user.home") + "Bruchwaren_von_" + von + "_bis_" + bis + ".pdf");
        PdfDocument pdf = new PdfDocument(writer);
        Document document = new Document(pdf);
        Paragraph header = new Paragraph("BRUCHWAREN von" + von + " bis " + bis).setTextAlignment(TextAlignment.CENTER).setFontSize(20);

        
        
        Table table = new Table(UnitValue.createPercentArray(3)).setHorizontalAlignment(HorizontalAlignment.CENTER);
        
        for (int i = 0; i < BRUCHWARE_COLUMNNAME.length; i++) {
            Cell header_cell = new Cell().setBackgroundColor(jetcheck_yellow);
            header_cell.add(new Paragraph(BRUCHWARE_COLUMNNAME[i]));
            table.addHeaderCell(header_cell).setTextAlignment(TextAlignment.CENTER).setBackgroundColor(jetcheck_yellow);
        }
        
        for (int i = 0; i < bruchwaren.size(); i++) {
            Cell warenname_zelle = new Cell();
            Cell datum_zelle = new Cell();
            Cell anzahl_zelle = new Cell();
            warenname_zelle.add(new Paragraph(bruchwaren.get(i).getWarenname()));
            datum_zelle.add(new Paragraph(bruchwaren.get(i).getDateFormatted()));
            anzahl_zelle.add(new Paragraph(bruchwaren.get(i).getAnzahl() + ""));
            
            table.addCell(warenname_zelle).setTextAlignment(TextAlignment.CENTER).setBackgroundColor(ColorConstants.WHITE);
            table.addCell(datum_zelle).setTextAlignment(TextAlignment.CENTER).setBackgroundColor(ColorConstants.WHITE);
            table.addCell(anzahl_zelle).setTextAlignment(TextAlignment.CENTER).setBackgroundColor(ColorConstants.WHITE);
        }

        document.add(header);
        document.add(table);
        document.close();
    }
}
