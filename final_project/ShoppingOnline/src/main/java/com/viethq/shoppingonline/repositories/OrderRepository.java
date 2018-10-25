package com.viethq.shoppingonline.repositories;

import com.viethq.shoppingonline.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {

    @Query("select o from Order o where o.user.username= :username order by o.createdDate desc")
    List<Order> findUserOrderHistory(@Param("username") String username);
}
