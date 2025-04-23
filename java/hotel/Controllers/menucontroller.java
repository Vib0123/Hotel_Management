package hotel.Controllers;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import hotel.Model.menuinfo;
import hotel.Model.menuinfoDao;

@Controller
public class menucontroller {
    private menuinfoDao menuDao;  // Changed variable name for clarity

    public menucontroller(menuinfoDao menuDao) {
        this.menuDao = menuDao;
    }

    @GetMapping("/addmenu")
    public String addMenuForm() {
        return "addmenu";  // Display form page
    }
    

    @PostMapping("/addmenu")
    public String addMenu(
        @RequestParam("menu-name") String name,
        @RequestParam("menu-price") double price,
        @RequestParam("menu-category") String category,
        @RequestParam("menu-image") String imagePath) {
    	
        menuinfo menuItem = new menuinfo(price, name, category, imagePath);
        menuDao.insert(menuItem);
        return "redirect:/showMenu";  // Redirect to the menu list
    }

    @RequestMapping("/Reception1")
	public String Reception1() {
		return "Reception1";
	}

	/*
	 * @GetMapping("/Reception1") public ModelAndView showMenu() { List<menuinfo>
	 * menuList = menuDao.ShowAll(); ModelAndView mav = new
	 * ModelAndView("Reception1"); // Ensure the correct JSP file name
	 * mav.addObject("menuList", menuList); return mav; }
	 */
    @GetMapping("/Reception1")
    public ModelAndView showMenu() {
        List<menuinfo> menuList = menuDao.showAll();
        Map<String, List<menuinfo>> menuByCategory = menuList.stream()
            .collect(Collectors.groupingBy(menuinfo::getDishCategory));
        
        ModelAndView mav = new ModelAndView("Reception1");
        mav.addObject("menuByCategory", menuByCategory);
        return mav;
    }
}
