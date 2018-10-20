package com.viethq.shoppingonline.routes.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
    @GetMapping("/skeleton")
    public String skeleton() {
        return "skeleton";
    }
}
