package hotel.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class pagecontroller {

	@RequestMapping("/")
	public String Management() {
		
		return "Management";
	}
	
	@RequestMapping("/AboutUs")
	public String About() {
		return "AboutUs";
	}
	
	@RequestMapping("/Contact")
	public String Contact() {
		return "Contact";
	}
	
	@RequestMapping("/Gallery")
	public String Gallery() {
		return "Gallery";
	}
	
	@RequestMapping("/Register")
	public String Registration() {
		return "Registration";
	}
	@RequestMapping("/LandingpageForUser")
	public String LandingpageForUser() {
		return "LandingpageForUser";
	}
	
	@RequestMapping("/Reception2")
	public String Reception() {
		return "Reception2";
	}
	@RequestMapping("/Admin")
	public String Admin() {
		return "Admin";
	}

	@RequestMapping("/users")
	public String users() {
		return "users";
	}
	
}
