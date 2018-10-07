package com.viethq.shoppingonline.controllers;

import com.viethq.shoppingonline.entities.Category;
import com.viethq.shoppingonline.repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/category")
public class CategoryController {

    private CategoryRepository categoryRepository;

    @Autowired
    public void setCategoryRepository(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
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

    @PostMapping(value = {"/create", "/edit"})
    public ModelAndView create(@ModelAttribute("category") Category category,
                               BindingResult result){
        if(result.hasErrors()){
            return new ModelAndView("error");
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
        categoryRepository.delete(id);
        return mav;
    }

}
