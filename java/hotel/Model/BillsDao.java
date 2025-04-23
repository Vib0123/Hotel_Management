package hotel.Model;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

public class BillsDao {

    private final JdbcTemplate jdbcTemplate;

    public BillsDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }
    double totalAmount = 0;
    public int generateBill(String customerName, List<Map<String, Object>> menuItems) {
        String billQuery = "INSERT INTO Bills(CustomerName, Totalprice, Date) VALUES (?, ?, ?)";
        KeyHolder billKeyHolder = new GeneratedKeyHolder();

        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(billQuery, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, customerName);
            ps.setDouble(2, totalAmount);
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            return ps;
        }, billKeyHolder);

        int billId = billKeyHolder.getKey().intValue();

        for (Map<String, Object> menuItem : menuItems) {
            int dishId = (int) menuItem.get("dishId");
            int quantity = (int) menuItem.get("quantity");

            if (quantity <= 0) continue;

            String menuQuery = "SELECT DishName, Dishprice FROM menuinfo WHERE DishID = ?";
            Map<String, Object> menuData = jdbcTemplate.queryForMap(menuQuery, dishId);

            String dishName = (String) menuData.get("DishName");
            double dishPrice = ((Number) menuData.get("Dishprice")).doubleValue();
            double totalPrice = dishPrice * quantity;

            String detailQuery = "INSERT INTO biildetails(Bill_ID, DishName, price, quntity, Totalprice) VALUES (?, ?, ?, ?, ?)";
            jdbcTemplate.update(detailQuery, billId, dishName, dishPrice, quantity, totalPrice);

            totalAmount += totalPrice;
        }

        String updateBillQuery = "UPDATE Bills SET Totalprice = ? WHERE Bill_ID = ?";
        jdbcTemplate.update(updateBillQuery, totalAmount, billId);

        return billId;
    }

    public List<Map<String, Object>> getSelectedItems(Map<String, String[]> paramMap) {
        List<Map<String, Object>> selectedItems = new ArrayList<>();

        for (Map.Entry<String, String[]> entry : paramMap.entrySet()) {
            String key = entry.getKey();
            String[] values = entry.getValue();

            if (key.startsWith("quantity_") && values.length > 0) {
                try {
                    int dishId = Integer.parseInt(key.replace("quantity_", ""));
                    int quantity = Integer.parseInt(values[0]);

                    if (quantity > 0) {
                        Map<String, Object> item = new HashMap<>();
                        item.put("dishId", dishId);
                        item.put("quantity", quantity);
                        selectedItems.add(item);
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Invalid input: " + values[0]);
                }
            }
        }
        return selectedItems;
    }
    
    public Map<String, Object> getBillDetailsByLastBillId() {
        String lastBillQuery = "SELECT * FROM Bills ORDER BY Bill_ID DESC LIMIT 1";
        Map<String, Object> billData = jdbcTemplate.queryForMap(lastBillQuery);
        
        if (billData.isEmpty()) {
            return null;
        }
        
        int billId = (int) billData.get("Bill_ID");
        
        String billDetailsQuery = "SELECT * FROM biildetails WHERE Bill_ID = ?";
        List<Map<String, Object>> billDetails = jdbcTemplate.queryForList(billDetailsQuery, billId);
        
        Map<String, Object> result = new HashMap<>();
        result.put("bill", billData);
        result.put("billDetails", billDetails);
        
        return result;
    }
}
