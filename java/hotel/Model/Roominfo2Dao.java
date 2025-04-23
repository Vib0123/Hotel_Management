package hotel.Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class Roominfo2Dao {
	  private JdbcTemplate jdbcTemplate;

		public JdbcTemplate getJdbcTemplate() {
			return jdbcTemplate;
		}

		
		
		
		public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
			this.jdbcTemplate = jdbcTemplate;
		}
		
		
		public int insert(Roominfo2 I) {
			String iquery="insert into Roominfo2(RoomNo,Category,Roomprice)values(?,?,?)";
			int update = this.jdbcTemplate.update(iquery,I.getRoomNo(),I.getCategory(),I.getRoomprice());
			return update;
		}
		
		 public int Update(Roominfo2 room) {
		        String query = "UPDATE Roominfo2 SET Category=?, Roomprice=?, is_Occupied=? WHERE RoomNo=?";
		        return jdbcTemplate.update(query, room.getCategory(), room.getRoomprice(), room.isIs_Occupied(), room.getRoomNo());
		    }

	    public int Delete(int roomNo) {
	        String query = "DELETE FROM Roominfo2 WHERE RoomNo=?";
	        return jdbcTemplate.update(query, roomNo);
	    }

	    public List<Roominfo2> ShowAll() {
	        String query = "SELECT RoomNo, Category, Roomprice, is_Occupied FROM Roominfo2"; // Include is_Occupied
	        return jdbcTemplate.query(query, new RowMapper<Roominfo2>() {
	            @Override
	            public Roominfo2 mapRow(ResultSet rs, int rowNum) throws SQLException {
	                Roominfo2 room = new Roominfo2();
	                room.setRoomNo(rs.getInt("RoomNo"));
	                room.setCategory(rs.getString("Category"));
	                room.setRoomprice(rs.getDouble("Roomprice"));
	                room.setIs_Occupied(rs.getBoolean("is_Occupied")); // Ensure correct data retrieval
	                return room;
	            }
	        });
	    }
}
