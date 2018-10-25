package com.viethq.shoppingonline.routes.api;


import com.viethq.shoppingonline.entities.User;
import com.viethq.shoppingonline.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user")
public class UserAPI {

    @Autowired
    private UserRepository userRepository;

    @PostMapping("")
    public User save(@RequestBody User user) {
        return userRepository.save(user);
    }
}
