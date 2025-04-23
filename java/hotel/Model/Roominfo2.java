package hotel.Model;

public class Roominfo2 {
	 private int RoomNo;
     private String Category;
     private double Roomprice;
	private boolean is_Occupied;
	public int getRoomNo() {
		return RoomNo;
	}
	public void setRoomNo(int roomNo) {
		RoomNo = roomNo;
	}
	public String getCategory() {
		return Category;
	}
	public void setCategory(String category) {
		Category = category;
	}
	public double getRoomprice() {
		return Roomprice;
	}
	public void setRoomprice(double roomprice) {
		Roomprice = roomprice;
	}
	public boolean isIs_Occupied() {
		return is_Occupied;
	}
	public void setIs_Occupied(boolean is_Occupied) {
		this.is_Occupied = is_Occupied;
	}
	public Roominfo2(int roomNo, String category, double roomprice, boolean is_Occupied) {
		super();
		RoomNo = roomNo;
		Category = category;
		Roomprice = roomprice;
		this.is_Occupied = is_Occupied;
	}
	public Roominfo2() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Roominfo2 [RoomNo=" + RoomNo + ", Category=" + Category + ", Roomprice=" + Roomprice
				+ ", is_Occupied=" + is_Occupied + "]";
	}
}
