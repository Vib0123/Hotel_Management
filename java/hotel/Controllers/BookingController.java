package hotel.Controllers;

import hotel.Model.BookingDao;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.logging.Logger;

@Controller
@RequestMapping("/booking")
public class BookingController {

    private final BookingDao bookingDao;
    private static final Logger logger = Logger.getLogger(BookingController.class.getName());

    public BookingController(BookingDao bookingDao) {
        this.bookingDao = bookingDao;
    }

    @GetMapping("/selectRoom")
    public String selectRoom(@RequestParam("category") String category, Model model) {
        List<String> availableRooms = bookingDao.getRoomsByCategory(category);
        model.addAttribute("category", category);
        model.addAttribute("availableRooms", availableRooms);
        return "Booking";
    }

    @PostMapping("/confirm")
    public String confirmBooking(@RequestParam("customerName") String customerName,
                                 @RequestParam("roomNo") int roomNo,
                                 @RequestParam("days") int days,
                                 Model model) {
        try {
            double totalAmount = bookingDao.bookRoom(customerName, roomNo, days);
            model.addAttribute("message", "Booking successful! Total Amount: ₹" + totalAmount);
            model.addAttribute("roomNo", roomNo);
            model.addAttribute("days", days);
            model.addAttribute("pricePerDay", totalAmount / days);
            model.addAttribute("totalAmount", totalAmount);
        } catch (Exception e) {
            logger.severe("Error during booking: " + e.getMessage());
            model.addAttribute("error", "Error: " + e.getMessage());
        }
        return "ConfirmBook";
    }

    @PostMapping("/checkout")
    public String checkoutRoom(@RequestParam("roomNo") int roomNo, Model model) {
        try {
            bookingDao.checkoutRoom(roomNo);
            model.addAttribute("message", "Room " + roomNo + " is now available again.");
        } catch (Exception e) {
            logger.severe("Error during checkout: " + e.getMessage());
            model.addAttribute("error", "Error: " + e.getMessage());
        }
        return "Reception2";
    }

    @GetMapping("/generatePDF")
    public ResponseEntity<byte[]> generateBookingPDF() {
        try {
            Map<String, Object> bookingDetails = bookingDao.getLastBookingDetails();

            if (bookingDetails == null || bookingDetails.isEmpty()) {
                logger.warning("No booking details found!");
                return ResponseEntity.badRequest().build();
            }

            byte[] pdfBytes = createPdf(bookingDetails);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentDispositionFormData("attachment", "BookingDetails.pdf");
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentLength(pdfBytes.length);

            return new ResponseEntity<>(pdfBytes, headers, HttpStatus.OK);
        } catch (Exception e) {
            logger.severe("Error generating PDF: " + e.getMessage());
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 🔹 Helper Method to Create PDF
    private byte[] createPdf(Map<String, Object> bookingDetails) throws DocumentException {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        Document document = new Document();
        PdfWriter.getInstance(document, outputStream);
        document.open();

        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16, BaseColor.BLACK);
        Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 12, BaseColor.BLACK);

        document.add(new Paragraph("🏨 RajMudra Hotel Booking Bill", titleFont));
        document.add(new Paragraph("\n"));

        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100);
        table.setSpacingBefore(10f);

        addTableRow(table, "📌 Booking ID:", getValue(bookingDetails, "Bill_ID"), normalFont);
        addTableRow(table, "👤 Customer Name:", getValue(bookingDetails, "CustomerName"), normalFont);
        addTableRow(table, "🏠 Room No:", getValue(bookingDetails, "RoomNo"), normalFont);
        addTableRow(table, "🏷️ Category:", getValue(bookingDetails, "Category"), normalFont);
        addTableRow(table, "📅 Days:", getValue(bookingDetails, "Days"), normalFont);
        addTableRow(table, "💰 Total Amount:", "₹" + getValue(bookingDetails, "TotalAmount"), normalFont);
        addTableRow(table, "📆 Bill Date:", getValue(bookingDetails, "Bill_date"), normalFont);

        document.add(table);
        document.close();

        return outputStream.toByteArray();
    }

    // 🔹 Helper Method to Add Table Rows
    private void addTableRow(PdfPTable table, String key, String value, Font font) {
        PdfPCell cellKey = new PdfPCell(new Phrase(key, font));
        cellKey.setBackgroundColor(BaseColor.LIGHT_GRAY);
        cellKey.setPadding(5);
        table.addCell(cellKey);

        PdfPCell cellValue = new PdfPCell(new Phrase(value, font));
        cellValue.setPadding(5);
        table.addCell(cellValue);
    }

    // 🔹 Helper Method to Handle Null Values
    private String getValue(Map<String, Object> bookingDetails, String key) {
        return Optional.ofNullable(bookingDetails.get(key)).map(Object::toString).orElse("N/A");
    }
}
