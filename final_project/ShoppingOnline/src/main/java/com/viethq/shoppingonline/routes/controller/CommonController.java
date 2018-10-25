package com.viethq.shoppingonline.routes.controller;

import com.viethq.shoppingonline.entities.User;
import com.viethq.shoppingonline.services.UserService;
import com.viethq.shoppingonline.utils.auth.RoleType;
import com.viethq.shoppingonline.utils.routes.URL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

@Controller
public class CommonController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public ModelAndView login(Principal principal) {
        if (principal == null) {
            return new ModelAndView("/auth/login");
        }
        String username = principal.getName();
        User user = userService.findByUsername(username);
        if (user == null) {
            return new ModelAndView("/auth/login");
        } else {
            String role = user.getRole().getName();
            if (role.equals(RoleType.ADMIN)) {
                return new ModelAndView(URL.REDIRECT_DASHBOARD);
            } else {
                return new ModelAndView(URL.REDIRECT_HOME);
            }
        }
    }

    @GetMapping("/403denied")
    public ModelAndView accessDenied() {
        return new ModelAndView("/auth/403denied");
    }

}
