package com.viethq.shoppingonline.routes.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommonController {

    @GetMapping("/login")
    public ModelAndView login() {
        return new ModelAndView("/auth/login");
    }

    @GetMapping("/403denied")
    public ModelAndView accessDenied() {
        return new ModelAndView("/auth/403denied");
    }

}
