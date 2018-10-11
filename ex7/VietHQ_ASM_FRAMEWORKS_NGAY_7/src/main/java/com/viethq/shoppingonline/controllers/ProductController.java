package com.viethq.shoppingonline.controllers;


import com.viethq.shoppingonline.entities.Category;
import com.viethq.shoppingonline.entities.Product;
import com.viethq.shoppingonline.model.ProductWithImageModel;
import com.viethq.shoppingonline.repositories.CategoryRepository;
import com.viethq.shoppingonline.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
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

    @Autowired
    public void setProductRepository(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Autowired
    public void setCategoryRepository(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @GetMapping("/index")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("/product/index");
        List<Product> productList = productRepository.findAll();
        mav.addObject("productList", productList);
        return mav;
    }


    @GetMapping("/create")
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView("/product/create");
        List<Category> categoryList = categoryRepository.findAll();
        mav.addObject("product", new Product());
        mav.addObject("categoryList", categoryList);
        return mav;
    }

    @GetMapping("/details")
    public ModelAndView details(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView("/product/details");
        Product product = productRepository.findOne(id);
        mav.addObject("product", product);
        return mav;
    }

    @GetMapping("/edit")
    public ModelAndView edit(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView("/product/edit");
        Product product = productRepository.findOne(id);
        List<Category> categoryList = categoryRepository.findAll();
        mav.addObject("product", product);
        mav.addObject("categoryList", categoryList);
        return mav;
    }


    @PostMapping(value = "/create")
    public ModelAndView create(@Valid @ModelAttribute("product") ProductWithImageModel product,
                               BindingResult result) {
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView("/product/create");
            List<Category> categoryList = categoryRepository.findAll();
            mav.addObject("categoryList", categoryList);
            return mav;
        }
        ModelAndView mav = new ModelAndView("redirect:index");
        MultipartFile file = product.getThumbnail();
        product.setFileName(file.getOriginalFilename());
        Product p = product.toProduct();
        p = productRepository.save(p);
        product.setId(p.getId());
        saveFile(product, file);
        return mav;
    }


    @PostMapping(value = "/edit")
    public ModelAndView edit(@Valid @ModelAttribute("product") ProductWithImageModel product,
                             BindingResult result) {
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView("/product/edit");
            List<Category> categoryList = categoryRepository.findAll();
            mav.addObject("categoryList", categoryList);
            return mav;
        }
        ModelAndView mav = new ModelAndView("redirect:index");
        MultipartFile file = product.getThumbnail();
        saveFile(product, file);
        Product p = productRepository.findOne(product.getId());
        p.setName(product.getName());
        p.setDescription(product.getDescription());
        p.setPrice(product.getPrice());
        p.setAmount(product.getAmount());
        p.setCategory(product.getCategory());
        if (product.getFileName() != null && !product.getFileName().equals("")) {
            p.setThumbnail(product.getFileName());
        }
        productRepository.save(p);
        return mav;
    }

    @GetMapping("/delete")
    public ModelAndView delete(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView("redirect:index");
        productRepository.delete(id);
        return mav;
    }


    private String createImgUrlCorrespondingWithProduct(ProductWithImageModel p) {
        int id = p.getId();
        return IMAGE_FOLDER + File.separator + id + File.separator;
    }


    private void saveFile(ProductWithImageModel product, MultipartFile file) {
        if (file != null) {
            String folderPath = createImgUrlCorrespondingWithProduct(product);
            File imgDir = new File(folderPath);
            if (!imgDir.exists()) {
                imgDir.mkdir();
            }
            String fileName = file.getOriginalFilename();
            if (fileName != null && !fileName.equals("")) {
                File imgFile = new File(folderPath, file.getOriginalFilename());
                try {
                    file.transferTo(imgFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                product.setFileName(fileName);
            }
        }
    }


}
