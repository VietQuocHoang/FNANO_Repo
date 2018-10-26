package com.viethq.shoppingonline.routes.controller;

import com.viethq.shoppingonline.entities.User;
import com.viethq.shoppingonline.model.NewUserModel;
import com.viethq.shoppingonline.services.AuthService;
import com.viethq.shoppingonline.services.UserService;
import com.viethq.shoppingonline.utils.auth.RoleType;
import com.viethq.shoppingonline.utils.routes.URL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class CommonController {

    private UserService userService;
    private AuthService authService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setAuthService(AuthService authService) {
        this.authService = authService;
    }


    @GetMapping(value = {"/login", "/"})
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

    @GetMapping("/register")
    public ModelAndView register() {
        ModelAndView mav = new ModelAndView("/auth/register");
        mav.addObject("user", new NewUserModel());
        return mav;
    }

    @PostMapping("/register")
    public ModelAndView register(@Valid @ModelAttribute("user") NewUserModel user, BindingResult result) {
        boolean error = false;
        if (result.hasErrors()) {
            error = true;
        }

        if (authService.findByUsername(user.getUsername()) != null) {
            result.rejectValue("username", "error.username", "An account already existed with this username");
            error = true;
        }

        if (!user.getPassword().equals(user.getReconfirmPassword())) {
            result.rejectValue("reconfirmPassword", "error.reconfirmPassword", "Retype password does not match");
            error = true;
        }

        if (error) {
            return new ModelAndView("/auth/register");
        }

        authService.register(user);
        return new ModelAndView(URL.REDIRECT_LOGIN);
    }
}
