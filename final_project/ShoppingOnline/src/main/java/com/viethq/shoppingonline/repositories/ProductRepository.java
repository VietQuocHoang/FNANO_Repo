package com.viethq.shoppingonline.repositories;

import com.viethq.shoppingonline.entities.Product;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query("Select p from Product p where p.category.id=:categoryId and p.enabled=true")
    List<Product> findByCategoryId(@Param("categoryId") int categoryId);

    @Query("Select p from Product p where p.name like concat('%', lower(:name), '%') and p.category.id=:categoryId and p.enabled=true")
    List<Product> findByNameAndCategoryAndSorting(@Param("name") String name, @Param("categoryId") int categoryId, Pageable pageable);

    @Query("Select p from Product p where p.name like concat('%', lower(:name), '%') and p.enabled=true")
    List<Product> findByNameAndSorting(@Param("name") String name, Pageable pageable);

    @Query("Select count(p) from Product p where p.name like concat('%', lower(:name), '%') and p.enabled=true")
    int countByNameAndSorting(@Param("name") String name);

    @Query("Select count(p) from Product p where p.name like concat('%', lower(:name), '%') and p.category.id=:categoryId and p.enabled=true")
    int countByNameAndCategoryAndSorting(@Param("name") String name, @Param("categoryId") int categoryId);

    @Query("Select p from Product p where p.id IN :ids and p.enabled=true")
    List<Product> findByProductIds(@Param("ids") Set<Integer> ids);

    @Query("Select count(p) from Product p")
    int countAllProduct();

    @Query(value = "Select  c.id, c.name, coalesce(sum(p.amount),0) as totalAmount " +
            "from ShopDB.tblCategory c " +
            "left outer join ShopDB.tblProduct p " +
            "on p.category_id=c.id " +
            "group by c.id " +
            "order by totalAmount desc", nativeQuery = true)
    List<Object[]> findProductAmountPerCategory();

    @Query(value = "Select  c.id, c.name, coalesce(count(p.id),0) as totalAmount " +
            "from ShopDB.tblCategory c " +
            "left outer join ShopDB.tblProduct p " +
            "on p.category_id=c.id " +
            "group by c.id " +
            "order by totalAmount desc", nativeQuery = true)
    List<Object[]> findProductPerCategory();


    @Query(value = "Select c.id, c.name, coalesce(max(p.price), 0) as maxPrice, coalesce(min(p.price), 0) as minPrice, coalesce(avg(p.price), 0) as avgPrice " +
            "from ShopDB.tblCategory c " +
            "left outer join ShopDB.tblProduct p " +
            "on p.category_id = c.id " +
            "group by c.id", nativeQuery = true)
    List<Object[]> findProductMaxMinAvgByCategory();


}
