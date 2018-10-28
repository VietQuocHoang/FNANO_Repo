package com.viethq.shoppingonline.routes.controller;

import com.viethq.shoppingonline.model.report.ProductPerCategoryModel;
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
        ProductPerCategoryModel productAmountPerCategoryReport = reportService.getProductAmountPerCategoryReport();
        ProductPerCategoryModel productPerCategoryModel = reportService.getProductPerCategoryReport();
        mav.addObject("productAmountModel", productAmountPerCategoryReport);
        mav.addObject("productModel", productPerCategoryModel);
        return mav;
    }
}
