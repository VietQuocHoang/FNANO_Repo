package com.viethq.shoppingonline.repositories;

import com.viethq.shoppingonline.entities.Category;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

    Category findById(int id);

    @Query("Select c from Category c where lower(c.name) like concat('%', lower(:name), '%') and c.enabled=true")
    List<Category> findAndPaging(@Param("name") String name, Pageable pageable);

    @Query("Select count(c) from Category c where lower(c.name) like concat('%', lower(:name),'%') and c.enabled=true")
    int searchByNameAndcount(@Param("name") String name);


    @Query("Select count(c) from Category c")
    int countAllCategory();
}
