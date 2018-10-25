package com.viethq.shoppingonline.routes.controller;


import com.viethq.shoppingonline.entities.Order;
import com.viethq.shoppingonline.services.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/history")
public class HistoryController {

    private HistoryService historyService;

    @Autowired
    public void setHistoryService(HistoryService historyService) {
        this.historyService = historyService;
    }

    @GetMapping("")
    private ModelAndView getHistory(Principal principal) {
        if (principal == null) {
            return new ModelAndView("/403denied");
        }
        ModelAndView mav = new ModelAndView("/history/index");
        String username = principal.getName();
        List<Order> orderList = historyService.getOrderHistoryByUsername(username);
        mav.addObject("orderList", orderList);
        return mav;
    }
}
