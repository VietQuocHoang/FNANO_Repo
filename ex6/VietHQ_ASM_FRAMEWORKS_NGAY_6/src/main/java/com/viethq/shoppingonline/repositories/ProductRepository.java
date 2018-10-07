package com.viethq.shoppingonline.repositories;

import com.viethq.shoppingonline.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Integer> {

}
