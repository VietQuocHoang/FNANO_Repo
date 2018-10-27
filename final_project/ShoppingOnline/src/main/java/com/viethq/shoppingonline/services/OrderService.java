package com.viethq.shoppingonline.services;


import com.viethq.shoppingonline.entities.Order;
import com.viethq.shoppingonline.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {


    private OrderRepository orderRepository;

    @Autowired
    public void setOrderRepository(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public List<Order> findAllSortByDateDesc() {
        return orderRepository.findAllSortByDateDesc();
    }

    public Order findById(int id) {
        return orderRepository.findOne(id);
    }
}
