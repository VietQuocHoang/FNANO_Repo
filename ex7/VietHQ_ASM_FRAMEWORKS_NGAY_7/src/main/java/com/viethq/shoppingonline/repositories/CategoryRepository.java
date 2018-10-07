package com.viethq.shoppingonline.repositories;

import com.viethq.shoppingonline.entities.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

    Category findById(int id);

}
