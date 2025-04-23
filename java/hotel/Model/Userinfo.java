package hotel.Model;

public class Userinfo {
	private String Name;
	private String Address;
	private String AddharNo;
	private String ContactNo;
	private String UserName;
	private String Userpassword;
	private String Role;
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		Role = role;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getAddharNo() {
		return AddharNo;
	}
	public void setAddharNo(String addharNo) {
		AddharNo = addharNo;
	}
	public String getContactNo() {
		return ContactNo;
	}
	public void setContactNo(String contactNo) {
		ContactNo = contactNo;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getUserpassword() {
		return Userpassword;
	}
	public void setUserpassword(String userpassword) {
		Userpassword = userpassword;
	}
	/*
	 * public Userinfo(String name,String userName, String address, String
	 * userpassword, String addharNo, String contactNo,String role) { super(); Name
	 * = name; Address = address; AddharNo = addharNo; ContactNo = contactNo;
	 * UserName = userName; Userpassword = userpassword; Role=role; }
	 */
	
	public Userinfo(String name, String address, String addharNo, String contactNo, String userName, String userpassword,
			String role) {
		super();
		Name = name;
		Address = address;
		AddharNo = addharNo;
		ContactNo = contactNo;
		UserName = userName;
		Userpassword = userpassword;
		Role = role;
	}
	public Userinfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Userinfo [Name=" + Name + ", Address=" + Address + ", AddharNo=" + AddharNo + ", ContactNo=" + ContactNo
				+ ", UserName=" + UserName + ", Userpassword=" + Userpassword + "]";
	}
	
}
