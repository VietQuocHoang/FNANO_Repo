package com.viethq.shoppingonline.controllers;


import com.viethq.shoppingonline.entities.Category;
import com.viethq.shoppingonline.entities.Product;
import com.viethq.shoppingonline.repositories.CategoryRepository;
import com.viethq.shoppingonline.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {


    private ProductRepository productRepository;
    private CategoryRepository categoryRepository;

    @Autowired
    public void setProductRepository(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Autowired
    public void setCategoryRepository(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @GetMapping("/index")
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView("/product/index");
        List<Product> productList = productRepository.findAll();
        mav.addObject("productList", productList);
        return mav;
    }


    @GetMapping("/create")
    public ModelAndView create(){
        ModelAndView mav = new ModelAndView("/product/create");
        List<Category> categoryList = categoryRepository.findAll();
        mav.addObject("product", new Product());
        mav.addObject("categoryList", categoryList);
        return mav;
    }

    @GetMapping("/details")
    public ModelAndView details(@RequestParam("id") int id){
        ModelAndView mav = new ModelAndView("/product/details");
        Product product = productRepository.findOne(id);
        mav.addObject("product", product);
        return mav;
    }

    @GetMapping("/edit")
    public ModelAndView edit(@RequestParam("id") int id){
        ModelAndView mav = new ModelAndView("/product/edit");
        Product product = productRepository.findOne(id);
        List<Category> categoryList = categoryRepository.findAll();
        mav.addObject("product", product);
        mav.addObject("categoryList", categoryList);
        return mav;
    }


    @PostMapping(value = {"/create", "/edit"})
    public ModelAndView save(@ModelAttribute("product") Product product){
        ModelAndView mav = new ModelAndView("redirect:index");
        productRepository.save(product);
        return mav;
    }

    @GetMapping("/delete")
    public ModelAndView delete(@RequestParam("id") int id){
        ModelAndView mav = new ModelAndView("redirect:index");
        productRepository.delete(id);
        return mav;
    }

}
