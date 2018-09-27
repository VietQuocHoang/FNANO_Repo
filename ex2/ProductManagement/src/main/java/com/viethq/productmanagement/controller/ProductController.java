package com.viethq.productmanagement.controller;

import com.viethq.productmanagement.models.Product;
import com.viethq.productmanagement.models.ProductData;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/product")
public class ProductController {

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
        if (ProductData.findById(product.getId()) == null) {
            ProductData.productList.add(product);
        }
        return "redirect:/product/index";
    }

    @GetMapping(value = "/details")
    public ModelAndView details(@RequestParam(value = "id", required = false) int id) {
        Product p = ProductData.findById(id);
        ModelAndView mav = new ModelAndView("/product/details");
        mav.addObject("product", p);
        return mav;
    }

    @GetMapping(value = "/edit")
    public ModelAndView edit(@RequestParam(value = "id", required = false) int id, ModelMap mm) {
        Product p = ProductData.findById(id);
        ModelAndView mav = new ModelAndView("/product/edit");
        mav.getModel().put("product", p);
        return mav;
    }

    @GetMapping(value = "/delete")
    public ModelAndView delete(@RequestParam(value = "id", required = false) int id) {
        ProductData.deleteById(id);
        ModelAndView mav = new ModelAndView("redirect:/product/index");
        return mav;
    }


    @PostMapping(value = "/update")
    public String update(@ModelAttribute("product") Product product) {
        ProductData.update(product);
        return "redirect:/product/index";
    }

}
