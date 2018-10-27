package com.viethq.shoppingonline.routes.controller;

import com.viethq.shoppingonline.entities.Order;
import com.viethq.shoppingonline.model.TopActiveUserModel;
import com.viethq.shoppingonline.services.DashboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class DashboardController {

    private DashboardService dashboardService;

    @Autowired
    public void setDashboardService(DashboardService dashboardService) {
        this.dashboardService = dashboardService;
    }

    @RequestMapping("/dashboard")
    public ModelAndView dashboard() {
        ModelAndView mav = new ModelAndView("/dashboard");
        float revenue = dashboardService.getRevenueFromADay();
        int numOfOrder = dashboardService.getNumberOfOrderInADay();
        int numOfProduct = dashboardService.getNumberOfProduct();
        int numOfCategory = dashboardService.getNumberOfCategory();
        List<Order> orderList = dashboardService.getTop5RecentlyOrder();
        List<TopActiveUserModel> userList = dashboardService.getTop5ActiveUser();
        mav.addObject("revenue", revenue);
        mav.addObject("numOfOrder", numOfOrder);
        mav.addObject("numOfProduct", numOfProduct);
        mav.addObject("numOfCategory", numOfCategory);
        mav.addObject("userList", userList);
        mav.addObject("orderList", orderList);
        return mav;
    }

}
