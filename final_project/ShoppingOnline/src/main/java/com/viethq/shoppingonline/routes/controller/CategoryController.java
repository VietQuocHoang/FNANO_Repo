package com.viethq.shoppingonline.routes.controller;

import com.viethq.shoppingonline.entities.Category;
import com.viethq.shoppingonline.entities.Product;
import com.viethq.shoppingonline.repositories.CategoryRepository;
import com.viethq.shoppingonline.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    private int PER_PAGE = 5;
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

    @GetMapping("")
    public ModelAndView index(@RequestParam(value = "page", required = false) Integer page,
                              @RequestParam(value = "search", required = false) String search) {
        ModelAndView mav = new ModelAndView("/category/index");
        if (page == null) {
            page = 0;
        }
        if (search == null) {
            search = "";
        }
        int numberOfCategory = categoryRepository.searchByNameAndcount(search);
        int maximumPage = (numberOfCategory / PER_PAGE) - 1;
        int remaining = numberOfCategory % PER_PAGE;
        if (remaining > 0) {
            maximumPage += 1;
        }
        if (page > maximumPage) {
            page = 0;
        }
        Sort sort = new Sort(new Sort.Order(Sort.Direction.ASC, "name"));
        Pageable pageable = new PageRequest(page, PER_PAGE, sort);
        mav.addObject("page", page);
        mav.addObject("limit", maximumPage);
        mav.addObject("search", search);
        mav.addObject("categoryList", categoryRepository.findAndPaging(search, pageable));
        return mav;
    }

    @GetMapping("/create")
    public ModelAndView create() {
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
        return new ModelAndView("redirect:/category/");
    }

    @PostMapping(value = "/edit")
    public ModelAndView edit(@Valid @ModelAttribute("category") Category category,
                             BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("/category/edit");
        }
        categoryRepository.save(category);
        return new ModelAndView("redirect:index");
    }

    @GetMapping(value = "/{id}")
    public ModelAndView details(@PathVariable("id") int id) {
        ModelAndView mav = new ModelAndView("category/details");
        Category category = categoryRepository.findById(id);
        mav.addObject("category", category);
        return mav;
    }

    @GetMapping("/edit/{id}")
    public ModelAndView edit(@PathVariable("id") int id) {
        ModelAndView mav = new ModelAndView("category/edit");
        Category category = categoryRepository.findById(id);
        mav.addObject("category", category);
        return mav;
    }


    @DeleteMapping("/{id}")
    public ModelAndView delete(@PathVariable("id") int id) {
        ModelAndView mav = new ModelAndView("redirect:index");
        List<Product> productList = productRepository.findByCategoryId(id);
        if (productList == null || productList.isEmpty()) {
            categoryRepository.delete(id);
        }
        return mav;
    }

}
