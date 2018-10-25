package com.viethq.shoppingonline.repositories;

import com.viethq.shoppingonline.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query("select p from Product p where p.category.id=:categoryId")
    List<Product> findByCategoryId(@Param("categoryId") int id);
}
