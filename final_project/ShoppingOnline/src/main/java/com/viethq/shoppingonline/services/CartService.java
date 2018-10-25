package com.viethq.shoppingonline.services;

import com.viethq.shoppingonline.entities.Order;
import com.viethq.shoppingonline.entities.OrderDetails;
import com.viethq.shoppingonline.entities.Product;
import com.viethq.shoppingonline.entities.User;
import com.viethq.shoppingonline.model.cart.Cart;
import com.viethq.shoppingonline.model.cart.CartItem;
import com.viethq.shoppingonline.repositories.OrderDetailRepository;
import com.viethq.shoppingonline.repositories.OrderRepository;
import com.viethq.shoppingonline.repositories.ProductRepository;
import com.viethq.shoppingonline.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class CartService {

    private ProductRepository productRepository;
    private UserRepository userRepository;
    private OrderRepository orderRepository;
    private OrderDetailRepository orderDetailRepository;

    @Autowired
    public void setProductRepository(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Autowired
    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Autowired
    public void setOrderRepository(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    @Autowired
    public void setOrderDetailRepository(OrderDetailRepository orderDetailRepository) {
        this.orderDetailRepository = orderDetailRepository;
    }

    public void updateProductList(Cart cart) {
        if (cart != null && cart.getCartItemList() != null && !cart.getCartItemList().isEmpty()) {
            Set<Integer> idsSet = new HashSet<>();
            for (CartItem c : cart.getCartItemList()) {
                idsSet.add(c.getProductId());
            }
            List<Product> productList = productRepository.findByProductIds(idsSet);
            for (Product p : productList) {
                CartItem cartItem = cart.findCartItem(p.getId());
                if (cartItem != null) {
                    cartItem.setProduct(p);
                }
            }
        }
    }

    public User findUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public void saveOrder(Cart cartList, User user) {
        Order order = new Order();
        order.setUser(user);
        order.setCreatedDate(new Date(System.currentTimeMillis()));
        order.setTotal(cartList.getTotalPrice());
        order = orderRepository.save(order);
        List<OrderDetails> orderDetailsList = new ArrayList<>();
        for (CartItem c : cartList.getCartItemList()) {
            OrderDetails orderDetails = new OrderDetails();
            orderDetails.setOrder(order);
            orderDetails.setProduct(c.getProduct());
            orderDetails.setAmount(c.getQuantity());
            orderDetailsList.add(orderDetails);
        }
        orderDetailRepository.save(orderDetailsList);
    }
}
