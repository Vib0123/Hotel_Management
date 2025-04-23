package hotel.Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class menuinfoDao {
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Insert new menu item
    public int insert(menuinfo menu) {
        String query = "INSERT INTO menuinfo (Dishprice, DishName, DishCategory, DishImage) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(query, menu.getDishprice(), menu.getDishName(), menu.getDishCategory(), menu.getDishImage());
    }

    // Update existing menu item
   

    // Delete a menu item
    public int delete(String dishName) {
        String query = "DELETE FROM menuinfo WHERE DishName=?";
        return jdbcTemplate.update(query, dishName);
    }
 // Fetch a menu item by dish name
    public menuinfo getMenuItemByName(String dishName) {
        String query = "SELECT DishID, DishName, DishCategory, Dishprice, DishImage FROM menuinfo WHERE DishName = ?";
        return jdbcTemplate.queryForObject(query, new Object[]{dishName}, new RowMapper<menuinfo>() {
            @Override
            public menuinfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                menuinfo menu = new menuinfo();
                menu.setDishId(rs.getInt("DishID"));
                menu.setDishName(rs.getString("DishName"));
                menu.setDishCategory(rs.getString("DishCategory"));
                menu.setDishprice(rs.getDouble("Dishprice"));
                menu.setDishImage(rs.getString("DishImage"));
                return menu;
            }
        });
    }
    public List<menuinfo> getMenuByCategory(String category) {
        String query = "SELECT DishID, DishName, DishCategory, Dishprice, DishImage FROM menuinfo WHERE DishCategory = ?";
        return jdbcTemplate.query(query, new Object[]{category}, new RowMapper<menuinfo>() {
            @Override
            public menuinfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                menuinfo menu = new menuinfo();
                menu.setDishId(rs.getInt("DishID"));
                menu.setDishName(rs.getString("DishName"));
                menu.setDishCategory(rs.getString("DishCategory"));
                menu.setDishprice(rs.getDouble("Dishprice"));
                menu.setDishImage(rs.getString("DishImage"));
                return menu;
            }
        });
    }


    public int update(menuinfo menu) {
        String query = "UPDATE menuinfo SET DishName=?, DishCategory=?, Dishprice=?,DishImage=? WHERE DishID=?";
        return jdbcTemplate.update(query,menu.getDishName(),menu.getDishCategory(),menu.getDishprice(),menu.getDishImage(),menu.getDishId());
    }

    public int deleteById(int menuId) {  
        String query = "DELETE FROM menuinfo WHERE DishID=?";  
        return jdbcTemplate.update(query, menuId);  
    }

    public List<menuinfo> showAll() {
        String query = "SELECT DishID, DishName,DishCategory,Dishprice, DishImage FROM menuinfo";
        return jdbcTemplate.query(query, new RowMapper<menuinfo>() {
            @Override
            public menuinfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                return new menuinfo(
                    rs.getInt("DishID"),
                    rs.getString("DishName"),
                    rs.getString("DishCategory"),
                    rs.getDouble("Dishprice"),
                    rs.getString("DishImage")
                );
            }
        });
    }
}
