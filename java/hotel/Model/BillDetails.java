package hotel.Model;

public class BillDetails {
	private int id;
	private int Bill_ID;
	private String DishName;
	private double price;
	private int quantity;
	private double totalPrice;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBill_ID() {
		return Bill_ID;
	}
	public void setBill_ID(int bill_ID) {
		Bill_ID = bill_ID;
	}
	public String getDishName() {
		return DishName;
	}
	public void setDishName(String dishName) {
		DishName = dishName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuntity() {
		return quantity;
	}
	public void setQuntity(int quntity) {
		this.quantity = quntity;
	}
	public double getTotalprice() {
		return totalPrice;
	}
	public void setTotalprice(double totalprice) {
		totalPrice = totalprice;
	}
	public BillDetails(int id, int bill_ID, String dishName, double price, int quntity, double totalprice) {
		super();
		this.id = id;
		Bill_ID = bill_ID;
		DishName = dishName;
		this.price = price;
		this.quantity = quntity;
		totalPrice = totalprice;
	}
	public BillDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "BillDetails [id=" + id + ", Bill_ID=" + Bill_ID + ", DishName=" + DishName + ", price=" + price
				+ ", quntity=" + quantity + ", Totalprice=" + totalPrice + "]";
	}
	
	
}
