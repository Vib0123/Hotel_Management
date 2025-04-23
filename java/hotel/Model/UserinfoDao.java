package hotel.Model;

import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;

public class UserinfoDao {
    private JdbcTemplate jdbcTemplate;

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Updated login method to retrieve role information
    public Userinfo login(String userName, String userPassword) {
        String query = "SELECT UserName, UserPassword, Role FROM Userinfo WHERE UserName=? AND UserPassword=?";
        List<Userinfo> users = jdbcTemplate.query(query, (rs, rowNum) -> {
            Userinfo user = new Userinfo();
            user.setUserName(rs.getString("UserName"));
            user.setUserpassword(rs.getString("UserPassword"));
            user.setRole(rs.getString("Role")); // Fetch the role
            return user;
        }, userName, userPassword);
        return users.isEmpty() ? null : users.get(0);
    }

    // Insert new user into the database
    public void insert(Userinfo u) {
        String insertQuery = "INSERT INTO Userinfo (Name, Address, AddharNo, ContactNo, UserName, UserPassword, Role) VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(insertQuery, 
                            u.getName(), 
                            u.getAddress(), 
                            u.getAddharNo(), 
                            u.getContactNo(), 
                            u.getUserName(), 
                            u.getUserpassword(), 
                            u.getRole());
    }
    public Userinfo getUserByUsername(String username) {
        String sql = "SELECT * FROM Userinfo WHERE UserName = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{username}, (rs, rowNum) ->
            new Userinfo(
                rs.getString("Name"),
                rs.getString("Address"),
                rs.getString("AddharNo"),
                rs.getString("ContactNo"),
                rs.getString("UserName"),
                rs.getString("Userpassword"),
                rs.getString("Role")
            )
        );
    }
    public void updateUser(Userinfo user) {
        String sql = "UPDATE Userinfo SET Name=?, Address=?, ContactNo=?, Userpassword=? WHERE UserName=?";
        jdbcTemplate.update(sql, user.getName(), user.getAddress(), user.getContactNo(), user.getUserpassword(), user.getUserName());
    }


}
