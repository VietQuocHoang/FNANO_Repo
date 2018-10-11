package com.viethq.shoppingonline.controllers;

import com.viethq.shoppingonline.entities.Category;
import com.viethq.shoppingonline.entities.Product;
import com.viethq.shoppingonline.repositories.CategoryRepository;
import com.viethq.shoppingonline.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    private CategoryRepository categoryRepository;
    private ProductRepository productRepository;


    @Autowired
    public void setCategoryRepository(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Autowired
    public void setProductRepository(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @GetMapping("/index")
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView("/category/index");
        mav.addObject("categoryList", categoryRepository.findAll());
        return mav;
    }

    @GetMapping("/create")
    public ModelAndView create(){
        ModelAndView mav = new ModelAndView("/category/create");
        mav.addObject("category", new Category());
        return mav;
    }

    @PostMapping(value = "/create")
    public ModelAndView create(@Valid @ModelAttribute("category") Category category,
                               BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("/category/create");
        }
        categoryRepository.save(category);
        return new ModelAndView("redirect:index");
    }

    @PostMapping(value = "/edit")
    public ModelAndView edit(@Valid @ModelAttribute("category") Category category,
                               BindingResult result){
        if(result.hasErrors()){
            return new ModelAndView("/category/edit");
        }
        categoryRepository.save(category);
        return new ModelAndView("redirect:index");
    }

    @GetMapping("/details")
    public ModelAndView details(@RequestParam("id") int id){
        ModelAndView mav = new ModelAndView("category/details");
        Category category = categoryRepository.findById(id);
        mav.addObject("category", category);
        return mav;
    }

    @GetMapping("/edit")
    public ModelAndView edit(@RequestParam("id") int id){
        ModelAndView mav = new ModelAndView("category/edit");
        Category category = categoryRepository.findById(id);
        mav.addObject("category", category);
        return mav;
    }


    @GetMapping("/delete")
    public ModelAndView delete(@RequestParam("id") int id){
        ModelAndView mav = new ModelAndView("redirect:index");
        List<Product> productList = productRepository.findByCategoryId(id);
        if (productList == null || productList.isEmpty()) {
            categoryRepository.delete(id);
        }
        return mav;
    }

}
