package com.viethq.shoppingonline.repositories;

import com.viethq.shoppingonline.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {

    @Query("select o from Order o where o.user.username= :username order by o.createdDate desc")
    List<Order> findUserOrderHistory(@Param("username") String username);

    @Query("select COALESCE(sum(o.total), 0) from Order o where o.createdDate between :startDate and :endDate")
    float findSumTotalPriceBetweenTime(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

    @Query("select count(o) from Order o where o.createdDate between :startDate and :endDate")
    int findNumberOfOrderBetweenTime(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

    @Query(value = "SELECT * " +
            "FROM ShopDB.tblOrder o " +
            "order by o.created_date desc limit 5", nativeQuery = true)
    List<Order> findTop5OrderByCreatedDate();

}
