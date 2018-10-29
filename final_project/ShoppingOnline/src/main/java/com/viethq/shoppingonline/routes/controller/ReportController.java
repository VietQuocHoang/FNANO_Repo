package com.viethq.shoppingonline.routes.controller;

import com.viethq.shoppingonline.model.report.PieChart;
import com.viethq.shoppingonline.model.report.ProductLineChart;
import com.viethq.shoppingonline.services.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/report")
public class ReportController {


    private ReportService reportService;

    @Autowired
    public void setReportService(ReportService reportService) {
        this.reportService = reportService;
    }

    @GetMapping("")
    public ModelAndView productPerCategory() {
        ModelAndView mav = new ModelAndView("report/report");
        PieChart productAmountModel = reportService.getProductAmountPerCategoryReport();
        PieChart productModel = reportService.getProductPerCategoryReport();
        ProductLineChart productLineChart = reportService.getProductLineChartReport();
        mav.addObject("minMaxAvgProduct", productLineChart);
        mav.addObject("productAmountModel", productAmountModel);
        mav.addObject("productModel", productModel);
        return mav;
    }
}
