package com.viethq.shoppingonline.repositories;

import com.viethq.shoppingonline.entities.Product;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query("Select p from Product p where p.category.id=:categoryId")
    List<Product> findByCategoryId(@Param("categoryId") int categoryId);

    @Query("Select p from Product p where p.name like concat('%', lower(:name), '%') and p.category.id=:categoryId")
    List<Product> findByNameAndCategoryAndSorting(@Param("name") String name, @Param("categoryId") int categoryId, Pageable pageable);

    @Query("Select p from Product p where p.name like concat('%', lower(:name), '%')")
    List<Product> findByNameAndSorting(@Param("name") String name, Pageable pageable);

    @Query("Select count(p) from Product p where p.name like concat('%', lower(:name), '%')")
    int countByNameAndSorting(@Param("name") String name);

    @Query("Select count(p) from Product p where p.name like concat('%', lower(:name), '%') and p.category.id=:categoryId")
    int countByNameAndCategoryAndSorting(@Param("name") String name, @Param("categoryId") int categoryId);
}
