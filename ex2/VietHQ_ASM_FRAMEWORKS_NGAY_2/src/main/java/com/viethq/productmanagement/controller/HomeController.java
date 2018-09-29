package com.viethq.productmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/home")
public class HomeController {

    @GetMapping(value = "/index")
    public String index(){
        return "/home/index";
    }

    @GetMapping(value = "/pushdata")
    public String pushDataToView(ModelMap mm){
        mm.put("info", "Huỳnh Nam");
        mm.put("number", 123456);

        return "/home/show";
    }

    @GetMapping(value="/getfromGET")
    public String getFromGET(@RequestParam(value = "id", required = false) int code,
                             @RequestParam(value="name", required = false) String fullname,
                             ModelMap mm){
        mm.put("code", code);
        mm.put("fullname", fullname);
        return "/home/fromget";
    }

    @GetMapping(value = "/register")
    public String register(){
        return "/home/register";
    }

    @PostMapping(value="/getfromPOST")
    public String getFromPost(@RequestParam(value="id", required = false) int code,
                              @RequestParam(value="name", required = false) String name,
                                ModelMap mm){
        mm.put("code", code);
        mm.put("fullname", name);
        return "/home/result";
    }
}
