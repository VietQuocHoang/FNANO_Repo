package com.viethq.shoppingonline.routes.api;

import com.viethq.shoppingonline.entities.Product;
import com.viethq.shoppingonline.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/product")
public class ProductAPI {

    private ProductRepository productRepository;

    @Autowired
    public void setProductRepository(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @GetMapping("/")
    public List<Product> getAll() {
        return productRepository.findAll();
    }

    @GetMapping("/{id}")
    public Product findById(@PathVariable("id") int id) {
        return productRepository.findOne(id);
    }

    @PostMapping("")
    public Product insert(Product product) {
        return productRepository.save(product);
    }

    @PutMapping("")
    public Product update(Product product) {
        return productRepository.save(product);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity delete(@PathVariable("id") int id) {
        Product product = productRepository.findOne(id);
        product.setEnabled(false);
        productRepository.save(product);
        return new ResponseEntity("Delete successfully", HttpStatus.OK);
    }
}
