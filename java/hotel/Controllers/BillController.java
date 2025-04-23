package hotel.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import hotel.Model.BillsDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

@Controller
public class BillController {
    private final BillsDao bill;

    public BillController(BillsDao bill) {
        this.bill = bill;
    }

    // 📌 **1️⃣ Place Order & Redirect to Success Page**
    @PostMapping("/placeOrder")
    public String placeOrder(@RequestParam("customerName")String CustmerName ,HttpServletRequest request, Model model) {
		/*
		 * String customerName = request.getParameter("customerName");
		 */
        if (CustmerName == null || CustmerName.trim().isEmpty()) {
            model.addAttribute("error", "Customer name is required");
            return "menuPage"; // Redirect back to menu page if name is missing
        }

        // Extract selected menu items
        Map<String, String[]> paramMap = request.getParameterMap();
        List<Map<String, Object>> selectedItems = bill.getSelectedItems(paramMap);

        if (selectedItems.isEmpty()) {
            model.addAttribute("error", "Please select at least one item.");
            return "Reception1"; // Redirect if no items are selected
        }

        // Generate bill & return bill ID
        int billId = bill.generateBill(CustmerName, selectedItems);

        model.addAttribute("customerName", CustmerName);
        model.addAttribute("billId", billId);

        return "billsuccess"; // Redirect to bill success page
    }

 // ✅ **1️⃣ Generate & Download PDF**
    @GetMapping("/downloadBill")
    public void downloadBill(@RequestParam("billId") int billId, HttpServletResponse response) {
        try {
            // Retrieve bill details
            Map<String, Object> billData = bill.getBillDetailsByLastBillId();
            if (billData == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Bill not found");
                return;
            }

            Map<String, Object> billInfo = (Map<String, Object>) billData.get("bill");
            List<Map<String, Object>> billItems = (List<Map<String, Object>>) billData.get("billDetails");

            // Set response headers
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=Bill_" + billId + ".pdf");

            // Generate PDF
            OutputStream out = response.getOutputStream();
            generateBillPdf(out, billId, billInfo, billItems);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ **2️⃣ Generate PDF Content**
    private void generateBillPdf(OutputStream out, int billId, Map<String, Object> billInfo, List<Map<String, Object>> billItems) throws Exception {
        Document document = new Document();
        PdfWriter.getInstance(document, out);
        document.open();

        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20, BaseColor.BLUE);
        Font headerFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14, BaseColor.BLACK);
        Font textFont = FontFactory.getFont(FontFactory.HELVETICA, 12, BaseColor.BLACK);

        // 🔹 **Hotel Name & Bill Details**
        Paragraph title = new Paragraph("HOTEL RAJMUDRA", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        document.add(title);
        document.add(new Paragraph("\n"));

        document.add(new Paragraph("Bill ID: " + billId, headerFont));
        document.add(new Paragraph("Customer Name: " + billInfo.get("CustomerName"), headerFont));
        document.add(new Paragraph("Date: " + billInfo.get("Date"), textFont));
        document.add(new Paragraph("---------------------------------------------------"));
        document.add(new Paragraph("\n"));

        // 🔹 **Bill Items Table**
        PdfPTable table = new PdfPTable(3);
        table.setWidthPercentage(100);
        table.setSpacingBefore(10f);
        table.setSpacingAfter(10f);
        table.setWidths(new float[]{3, 1, 2});

        // 🏷 Table Headers
        table.addCell(new PdfPCell(new Phrase("Item", headerFont)));
        table.addCell(new PdfPCell(new Phrase("Quantity", headerFont)));
        table.addCell(new PdfPCell(new Phrase("Price", headerFont)));

        // 📝 Add Bill Items
        double totalAmount = 0;
        for (Map<String, Object> item : billItems) {
            table.addCell(new PdfPCell(new Phrase((String) item.get("DishName"), textFont)));
            table.addCell(new PdfPCell(new Phrase(String.valueOf(item.get("quntity")), textFont)));
            table.addCell(new PdfPCell(new Phrase(String.valueOf(item.get("Totalprice")), textFont)));
            totalAmount += ((Number) item.get("Totalprice")).doubleValue();
        }
        document.add(table);

        // 🔹 **Total Amount**
        document.add(new Paragraph("\n"));
        document.add(new Paragraph("Total Amount: ₹" + totalAmount, headerFont));

        document.close();
    }
}