package com.viethq.shoppingonline.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
    @GetMapping("/home")
    public String home() {
        return "skeleton";
    }
}
