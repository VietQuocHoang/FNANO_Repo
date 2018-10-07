package com.viethq.shoppingonline.controllers;


import com.viethq.shoppingonline.entities.Category;
import com.viethq.shoppingonline.entities.Product;
import com.viethq.shoppingonline.model.ProductWithImageModel;
import com.viethq.shoppingonline.repositories.CategoryRepository;
import com.viethq.shoppingonline.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {


    @Value("${resources.imageFolder}")
    private String IMAGE_FOLDER;

    private ProductRepository productRepository;
    private CategoryRepository categoryRepository;
    private ServletContext servletContext;

    @Autowired
    public void setProductRepository(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Autowired
    public void setCategoryRepository(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Autowired
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
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
    public ModelAndView save(@ModelAttribute("product") ProductWithImageModel product){
        ModelAndView mav = new ModelAndView("redirect:index");
        MultipartFile file = product.getThumbnail();
//        String filePath = servletContext.getRealPath("") + File.separator + "resources" + File.separator + "img";
        if(file != null) {
            File imgFile = new File(IMAGE_FOLDER, file.getOriginalFilename());
            try{
                file.transferTo(imgFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
            product.setFileName(file.getOriginalFilename());
        }
        Product p = product.toProduct();
        productRepository.save(p);
        return mav;
    }

    @GetMapping("/delete")
    public ModelAndView delete(@RequestParam("id") int id){
        ModelAndView mav = new ModelAndView("redirect:index");
        productRepository.delete(id);
        return mav;
    }

}
