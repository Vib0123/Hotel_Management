package hotel.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.Model.Userinfo;
import hotel.Model.UserinfoDao;
@Controller
public class usercontroller {
	private UserinfoDao userinfo;

	public usercontroller(UserinfoDao userinfo) {
		super();
		this.userinfo = userinfo;
	}
	
	@RequestMapping(path="/register", method=RequestMethod.POST)
	public String Rigistration(@RequestParam("Name") String name,
	                           @RequestParam("Username") String username,
	                           @RequestParam("Password") String password, 
	                           @RequestParam("Address") String address,
	                           @RequestParam("AddharNo") String addhar,  // Change from int to String
	                           @RequestParam("ContactNo") String contact, // Change from int to String
	                           @RequestParam("Role") String role) {
	    Userinfo u = new Userinfo(name, address, addhar, contact, username, password, role);
	    userinfo.insert(u);
	    return "login"; // Return a valid JSP page
	}


}
