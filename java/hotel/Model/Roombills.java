package hotel.Model;

import java.sql.Date;

public class Roombills {
	 private int id; 
     private int Bill_ID;
     private double TotalAmount;
     private Date Bill_date;
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
	public double getTotalAmount() {
		return TotalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		TotalAmount = totalAmount;
	}
	public Date getBill_date() {
		return Bill_date;
	}
	public void setBill_date(Date bill_date) {
		Bill_date = bill_date;
	}
	public Roombills(int id, int bill_ID, double totalAmount, Date bill_date) {
		super();
		this.id = id;
		Bill_ID = bill_ID;
		TotalAmount = totalAmount;
		Bill_date = bill_date;
	}
	public Roombills() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Roombills [id=" + id + ", Bill_ID=" + Bill_ID + ", TotalAmount=" + TotalAmount + ", Bill_date="
				+ Bill_date + "]";
	}
}
