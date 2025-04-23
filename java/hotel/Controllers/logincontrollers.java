package hotel.Controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import hotel.Model.Userinfo;
import hotel.Model.UserinfoDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class logincontrollers {

    private  UserinfoDao ud;

   

    public logincontrollers(UserinfoDao ud) {
		super();
		this.ud = ud;
	}

	// Show login page
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    // Process login request
    @RequestMapping(path = "/login", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("username") String username, 
                              @RequestParam("password") String password, 
                              HttpServletRequest request) {
        System.out.println("Attempting login: " + username);

        Userinfo user = ud.login(username, password);

        if (user == null) {
            System.out.println("Login failed: Invalid credentials");
            return new ModelAndView("login", "error", "Invalid username or password");
        }

        System.out.println("Login successful: " + user.getUserName() + " (" + user.getRole() + ")");

        // Creating session and storing user info
        HttpSession session = request.getSession();
        session.setAttribute("loggedInUser", user.getUserName());
        session.setAttribute("userRole", user.getRole());

        // Redirect based on role
        if ("admin".equalsIgnoreCase(user.getRole())) {
            return new ModelAndView("redirect:/Admin");
        } else {
            return new ModelAndView("redirect:/LandingpageForUser");
        }
    }
    @RequestMapping("/profile")
    public ModelAndView showProfile(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("loggedInUser");

        if (username == null) {
            return new ModelAndView("redirect:/login");
        }

        Userinfo user = ud.getUserByUsername(username);
        session.setAttribute("userDetails", user);

        return new ModelAndView("Profile");
    }
    @RequestMapping(path = "/updateProfile", method = RequestMethod.POST)
    public ModelAndView updateProfile(@RequestParam("name") String name,
                                      @RequestParam("address") String address,
                                      @RequestParam("contactNo") String contactNo,
                                      @RequestParam("password") String password,
                                      HttpServletRequest request) {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("loggedInUser");

        if (username == null) {
            return new ModelAndView("redirect:/login");
        }

        Userinfo user = ud.getUserByUsername(username);
        user.setName(name);
        user.setAddress(address);
        user.setContactNo(contactNo);

        if (!password.isEmpty()) {
            user.setUserpassword(password); 
        }

        ud.updateUser(user);
        session.setAttribute("userDetails", user);

        return new ModelAndView("Profile", "message", "Profile updated successfully");
    }


    // Logout and destroy session
    @RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Destroy session
        }
        return new ModelAndView("redirect:/login");
    }
}
