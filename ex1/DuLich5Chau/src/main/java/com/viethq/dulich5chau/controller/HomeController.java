package com.viethq.dulich5chau.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
    @RequestMapping(value="/", method = RequestMethod.GET)
    public String home(){
        return "home";
    }

    @RequestMapping(value="/dia-diem", method = RequestMethod.GET)
    public String location(){
        return "location";
    }

    @RequestMapping(value = "/lich-trinh", method = RequestMethod.GET)
    public String schedule(){
        return "schedule";
    }
}
