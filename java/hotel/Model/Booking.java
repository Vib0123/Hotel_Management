package hotel.Model;

import java.sql.Date;

public class Booking {
    private int billId;
    private String customerName;
    private int roomNo;
    private String category;
    private int days;
    private Date date;
    private double totalAmount;
    private Date checkInDate;
    private Date checkOutDate;

    public Booking() {}

    public Booking(int billId, String customerName, int roomNo, String category, int days, Date date, double totalAmount) {
        this.billId = billId;
        this.customerName = customerName;
        this.roomNo = roomNo;
        this.category = category;
        this.days = days;
        this.date = date;
        this.totalAmount = totalAmount;
    }

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(int roomNo) {
        this.roomNo = roomNo;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "billId=" + billId +
                ", customerName='" + customerName + '\'' +
                ", roomNo=" + roomNo +
                ", category='" + category + '\'' +
                ", days=" + days +
                ", date=" + date +
                ", totalAmount=" + totalAmount +
                ", checkInDate=" + checkInDate +
                ", checkOutDate=" + checkOutDate +
                '}';
    }
}
