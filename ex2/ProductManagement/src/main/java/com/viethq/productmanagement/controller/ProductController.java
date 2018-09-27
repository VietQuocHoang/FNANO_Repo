package com.viethq.productmanagement.controller;

import com.viethq.productmanagement.models.Product;
import com.viethq.productmanagement.models.ProductData;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/product")
public class ProductController {

    //TODO hereeeeeeee
    @GetMapping(value = "/index")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("/product/index");
        mav.addObject("productList", ProductData.productList);
        return mav;
    }


    @GetMapping(value = "/create")
    public ModelAndView create() {
        return new ModelAndView("/product/create", "product", new Product());
    }

    @PostMapping("/create")
    public String create(@ModelAttribute("product") Product product, BindingResult result, ModelMap mm) {
        if (result.hasErrors()) {
            return "error";
        }
        ProductData.productList.add(product);
        return "/product/index";
    }

    @GetMapping(value = "/details")
    public ModelAndView details(@RequestParam(value = "id", required = false) int id) {
        Product p = ProductData.findById(id);
        ModelAndView mav = new ModelAndView("/product/details");
        mav.addObject("product", p);
        return mav;
    }

    @GetMapping(value = "/edit")
    public String edit(@RequestParam(value = "id", required = false) int id, ModelMap mm) {
        Product p = ProductData.findById(id);
        ModelAndView mav = new ModelAndView("/product/edit");
        mav.addObject("product", p);
        return "home/edit";
    }

}
