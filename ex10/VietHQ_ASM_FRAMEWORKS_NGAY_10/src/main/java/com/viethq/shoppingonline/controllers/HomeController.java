package com.viethq.shoppingonline.controllers;

import com.viethq.shoppingonline.entities.Category;
import com.viethq.shoppingonline.entities.Product;
import com.viethq.shoppingonline.repositories.CategoryRepository;
import com.viethq.shoppingonline.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/home")
public class HomeController {

    private int DEFAULT_PRODUCT_NUMBER_PER_PAGE = 3;

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
    public ModelAndView index(@RequestParam(value = "page", required = false) Integer page,
                              @RequestParam(value = "search", required = false) String search,
                              @RequestParam(value = "categoryId", required = false) Integer categoryId) {
        if (page == null) {
            page = 0;
        }
        if (search == null) {
            search = "";
        }
        int maximumCount;

        if (categoryId != null) {
            maximumCount = productRepository.countByNameAndCategoryAndSorting(search, categoryId);
        } else {
            maximumCount = productRepository.countByNameAndSorting(search);
        }


        int maximumPage = (maximumCount / DEFAULT_PRODUCT_NUMBER_PER_PAGE) - 1;
        int remaining = maximumCount % DEFAULT_PRODUCT_NUMBER_PER_PAGE;
        if (remaining > 0) {
            maximumPage += 1;
        }
        if (page > maximumPage) {
            page = 0;
        }

        Sort sort = new Sort(Sort.Direction.ASC, "name");
        Pageable pageable = new PageRequest(page, DEFAULT_PRODUCT_NUMBER_PER_PAGE, sort);
        List<Product> productList;

        if (categoryId != null) {
            productList = productRepository.findByNameAndCategoryAndSorting(search, categoryId, pageable);

        } else {
            productList = productRepository.findByNameAndSorting(search, pageable);
        }


        List<Category> categoryList = categoryRepository.findAll();

        ModelAndView mav = new ModelAndView("/home/index");
        mav.addObject("productList", productList);
        mav.addObject("search", search);
        mav.addObject("limit", maximumPage);
        mav.addObject("page", page);
        mav.addObject("categoryList", categoryList);
        mav.addObject("categoryId", categoryId);
        return mav;
    }


    @GetMapping("/details")
    public ModelAndView details(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView("/home/details");
        Product product = productRepository.findOne(id);
        mav.addObject("product", product);
        return mav;
    }
}
