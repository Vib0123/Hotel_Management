package hotel.Model;

import java.util.Date;

public class Bills {
	  private int Bill_ID;
	  private String customerName;
	     private double Totalprice;
	     private Date date;
		private String CustomerNmae;
		public int getBill_ID() {
			return Bill_ID;
		}
		public void setBill_ID(int bill_ID) {
			Bill_ID = bill_ID;
		}
		public String getCustomerNmae() {
			return CustomerNmae;
		}
		public void setCustomerNmae(String customerNmae) {
			CustomerNmae = customerNmae;
		}
		public double getTotalprice() {
			return Totalprice;
		}
		public void setTotalprice(double totalprice) {
			Totalprice = totalprice;
		}
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		public Bills(int bill_ID, String customerNmae, double totalprice, Date date) {
			super();
			Bill_ID = bill_ID;
			CustomerNmae = customerNmae;
			Totalprice = totalprice;
			this.date = date;
		}
		public Bills() {
			super();
			// TODO Auto-generated constructor stub
		}
		@Override
		public String toString() {
			return "Bills [Bill_ID=" + Bill_ID + ", CustomerNmae=" + CustomerNmae + ", Totalprice=" + Totalprice + ", date="
					+ date + "]";
		}


}
