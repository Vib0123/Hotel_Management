package hotel.Controllers;


import hotel.Model.Roominfo2;
import hotel.Model.Roominfo2Dao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RoomController {
    private Roominfo2Dao roominfo2Dao;

    
    
    
    
    public RoomController(Roominfo2Dao roominfo2Dao) {
		super();
		this.roominfo2Dao = roominfo2Dao;
	}
    
    
    
@RequestMapping("/AddRoom")
	public String adroom() {
		return "addroom";
	}


    @RequestMapping(value = "/addRoom", method = RequestMethod.POST)
    public String addRoom(@ModelAttribute("roominfo") Roominfo2 room) {
        roominfo2Dao.insert(room);
        return "redirect:/roomList"; // Redirect to the list of rooms after insertion
    }
}
