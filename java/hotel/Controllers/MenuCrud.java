package hotel.Controllers;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import hotel.Model.menuinfo;
import hotel.Model.menuinfoDao;

@Controller
public class MenuCrud {

    private final menuinfoDao menuDao;

    public MenuCrud(menuinfoDao menuDao) {
        this.menuDao = menuDao;
    }

    @GetMapping("/showMenu")
    public String showMenu(Model model) {
        List<menuinfo> menus = menuDao.showAll();
        model.addAttribute("menus", menus);
        return "ShowMenu";  
    }

    @PostMapping("/updateMenu")
    public String updateMenu(@ModelAttribute menuinfo menu) {
        menuDao.update(menu);
        return "redirect:/showMenu";
    }

    @GetMapping("/deleteMenu")
    public String deleteMenu(@RequestParam("menuId") int menuId) {  
        menuDao.deleteById(menuId);  
        return "redirect:/showMenu";
    }

}
