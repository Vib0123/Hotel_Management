package hotel.Model;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Transactional;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BookingDao {

    private final JdbcTemplate jdbcTemplate;
    private static final Logger LOGGER = Logger.getLogger(BookingDao.class.getName());

    public BookingDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<String> getRoomsByCategory(String category) {
        String sql = "SELECT RoomNo FROM Roominfo2 WHERE Category = ? AND is_Occupied = 0";
        return jdbcTemplate.queryForList(sql, new Object[]{category}, String.class);
    }

    public List<Roominfo2> getAllRooms() {
        String query = "SELECT * FROM Roominfo2";
        return jdbcTemplate.query(query, new BeanPropertyRowMapper<>(Roominfo2.class));
    }

    public Map<String, Object> getRoomDetailsByNumber(int roomNo) {
        try {
            String query = "SELECT * FROM Roominfo2 WHERE RoomNo = ?";
            return jdbcTemplate.queryForMap(query, roomNo);
        } catch (EmptyResultDataAccessException e) {
            LOGGER.log(Level.WARNING, "No room found with RoomNo: " + roomNo);
            return Collections.emptyMap();
        }
    }

    @Transactional
    public double bookRoom(String customerName, int roomNo, int days) {
        try {
            String checkQuery = "SELECT is_Occupied FROM Roominfo2 WHERE RoomNo = ?";
            Boolean isOccupied = jdbcTemplate.queryForObject(checkQuery, new Object[]{roomNo}, Boolean.class);

            if (isOccupied == null || isOccupied) {
                throw new RuntimeException("Room is already occupied or does not exist!");
            }

            String bookingQuery = "INSERT INTO Booking (CustomerName, RoomNo, Category, Days, Date) " +
                    "SELECT ?, ?, Category, ?, ? FROM Roominfo2 WHERE RoomNo = ?";
            KeyHolder keyHolder = new GeneratedKeyHolder();

            jdbcTemplate.update(connection -> {
                PreparedStatement ps = connection.prepareStatement(bookingQuery, Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, customerName);
                ps.setInt(2, roomNo);
                ps.setInt(3, days);
                ps.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
                ps.setInt(5, roomNo);
                return ps;
            }, keyHolder);

            int bookingId = keyHolder.getKey().intValue();
            jdbcTemplate.update("UPDATE Roominfo2 SET is_Occupied = TRUE WHERE RoomNo = ?", roomNo);

            Double pricePerDay = jdbcTemplate.queryForObject("SELECT Roomprice FROM Roominfo2 WHERE RoomNo = ?", 
                    new Object[]{roomNo}, Double.class);
            if (pricePerDay == null) {
                throw new RuntimeException("Room price not found!");
            }

            double totalAmount = pricePerDay * days;
            jdbcTemplate.update("INSERT INTO roombills (Bill_ID, TotalAmount, Bill_date) VALUES (?, ?, ?)", 
                    bookingId, totalAmount, new Timestamp(System.currentTimeMillis()));

            return totalAmount;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error booking room: " + e.getMessage(), e);
            throw new RuntimeException("Booking failed, please try again.");
        }
    }

    @Transactional
    public boolean checkoutRoom(int roomNo) {
        try {
            String checkRoomQuery = "SELECT is_Occupied FROM Roominfo2 WHERE RoomNo = ?";
            Boolean isOccupied = jdbcTemplate.queryForObject(checkRoomQuery, new Object[]{roomNo}, Boolean.class);

            if (isOccupied == null || !isOccupied) {
                throw new RuntimeException("Room is not occupied or does not exist!");
            }

            int rowsAffected = jdbcTemplate.update("UPDATE Roominfo2 SET is_Occupied = FALSE WHERE RoomNo = ?", roomNo);
            return rowsAffected > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error during checkout: " + e.getMessage(), e);
            return false;
        }
    }

    public Map<String, Object> getLastBookingDetails() {
        try {
            String query = "SELECT b.Bill_ID, b.CustomerName, b.RoomNo, b.Category, b.Days, " +
                    "COALESCE(rb.TotalAmount, 0) AS TotalAmount, " +
                    "COALESCE(rb.Bill_date, NOW()) AS Bill_date " +
                    "FROM Booking b " +
                    "LEFT JOIN roombills rb ON b.Bill_ID = rb.Bill_ID " +
                    "ORDER BY b.Bill_ID DESC LIMIT 1";

            Map<String, Object> result = jdbcTemplate.queryForMap(query);
            return result.isEmpty() ? Collections.emptyMap() : result;
        } catch (EmptyResultDataAccessException e) {
            LOGGER.log(Level.WARNING, "No booking details found!");
            return Collections.emptyMap();
        } catch (DataAccessException e) {
            LOGGER.log(Level.SEVERE, "Database error: " + e.getMessage(), e);
            return Collections.emptyMap();
        }
    }
}
