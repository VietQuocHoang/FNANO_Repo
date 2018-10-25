package com.viethq.shoppingonline.services;

import com.viethq.shoppingonline.entities.Order;
import com.viethq.shoppingonline.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HistoryService {

    private OrderRepository orderRepository;

    @Autowired
    public void setOrderRepository(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public List<Order> getOrderHistoryByUsername(String username) {
        return orderRepository.findUserOrderHistory(username);
    }
}
