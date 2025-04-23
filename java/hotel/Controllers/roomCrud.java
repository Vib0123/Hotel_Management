package hotel.Controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.Model.Roominfo2;
import hotel.Model.Roominfo2Dao;

@Controller
public class roomCrud {

    private Roominfo2Dao roomDao;

    public roomCrud(Roominfo2Dao roomDao) {
        this.roomDao = roomDao;
    }

    // Show all rooms
    @GetMapping("/show")
    public String showRooms(Model model) {
        List<Roominfo2> roomList = roomDao.ShowAll();
        model.addAttribute("roomList", roomList);
        return "ShowRooms";
    }

    // Update room details (Category, Price, and Occupied Status)
    @PostMapping("/updateRoom")
    public String updateRoom(
            @RequestParam("roomNo") int roomNo,
            @RequestParam("category") String category,
            @RequestParam("price") double price,
            @RequestParam("isOccupied") boolean isOccupied) {

        List<Roominfo2> rooms = roomDao.ShowAll();
        Optional<Roominfo2> existingRoom = rooms.stream()
                                               .filter(r -> r.getRoomNo() == roomNo)
                                               .findFirst();

        if (existingRoom.isPresent()) {
            Roominfo2 room = existingRoom.get();
            room.setCategory(category);
            room.setRoomprice(price);
            room.setIs_Occupied(isOccupied);
            roomDao.Update(room);
            return "redirect:/show";  
        } else {
            return "errorPage";
        }
    }


    // Delete room
    @GetMapping("/deleteRoom")
    public String deleteRoom(@RequestParam("roomNo") int roomNo) {
        List<Roominfo2> rooms = roomDao.ShowAll();
        Optional<Roominfo2> existingRoom = rooms.stream()
                                               .filter(r -> r.getRoomNo() == roomNo)
                                               .findFirst();

        if (existingRoom.isPresent()) {
            roomDao.Delete(roomNo);
            return "redirect:/show";
        } else {
            return "errorPage";
        }
    }
}
