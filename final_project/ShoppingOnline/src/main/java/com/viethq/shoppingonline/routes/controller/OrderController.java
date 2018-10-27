package com.viethq.shoppingonline.routes.controller;

import com.viethq.shoppingonline.entities.Order;
import com.viethq.shoppingonline.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    private OrderService orderService;

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("/order/index");
        List<Order> orderList = orderService.findAllSortByDateDesc();
        mav.addObject("orderList", orderList);
        return mav;
    }

    @GetMapping("/{id}")
    public ModelAndView details(@PathVariable("id") int id) {
        ModelAndView mav = new ModelAndView("/order/details");
        Order order = orderService.findById(id);
        mav.addObject("order", order);
        return mav;
    }
}
