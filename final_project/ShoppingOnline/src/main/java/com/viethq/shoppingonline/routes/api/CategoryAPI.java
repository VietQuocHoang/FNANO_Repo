package com.viethq.shoppingonline.routes.api;


import com.viethq.shoppingonline.entities.Category;
import com.viethq.shoppingonline.entities.Product;
import com.viethq.shoppingonline.repositories.CategoryRepository;
import com.viethq.shoppingonline.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/category")
public class CategoryAPI {


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
    public List<Category> getAll() {
        return categoryRepository.findAll();
    }

    @GetMapping("/{id}")
    public Category getById(@PathVariable("id") int id) {
        return categoryRepository.findById(id);
    }

    @PostMapping("")
    public Category insert(Category category) {
        return categoryRepository.save(category);
    }

    @PutMapping
    public Category update(Category category) {
        return categoryRepository.save(category);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity delete(@PathVariable("id") int id) {
        List<Product> productList = productRepository.findByCategoryId(id);
        if (productList != null && !productList.isEmpty()) {
            return new ResponseEntity("Please delete all product with category = " + id + " before proceeding", HttpStatus.NON_AUTHORITATIVE_INFORMATION);
        } else {
            categoryRepository.delete(id);
            return new ResponseEntity("Delete successfully", HttpStatus.OK);
        }
    }
}
