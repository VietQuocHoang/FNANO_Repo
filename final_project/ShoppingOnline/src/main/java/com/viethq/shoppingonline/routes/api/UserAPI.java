package com.viethq.shoppingonline.routes.api;


import com.viethq.shoppingonline.entities.User;
import com.viethq.shoppingonline.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/user")
public class UserAPI {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("")
    public User save(@RequestBody User user) {
        user.encodePassword();
        return userService.save(user);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity delete(@PathVariable("id") int id) {
        userService.disableUser(id);
        return new ResponseEntity("Delete successfully", HttpStatus.OK);
    }
}
