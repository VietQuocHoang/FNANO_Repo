package com.viethq.shoppingonline.services;

import com.viethq.shoppingonline.entities.Order;
import com.viethq.shoppingonline.model.TopActiveUserModel;
import com.viethq.shoppingonline.repositories.CategoryRepository;
import com.viethq.shoppingonline.repositories.OrderRepository;
import com.viethq.shoppingonline.repositories.ProductRepository;
import com.viethq.shoppingonline.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class DashboardService {

    private int ONE_DAY = 24 * 60 * 60 * 1000;

    private UserRepository userRepository;
    private ProductRepository productRepository;
    private OrderRepository orderRepository;
    private CategoryRepository categoryRepository;

    @Autowired
    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Autowired
    public void setProductRepository(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Autowired
    public void setOrderRepository(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    @Autowired
    public void setCategoryRepository(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public float getRevenueFromADay() {
        Date today = new Date();
        Date yesterday = new Date(today.getTime() - ONE_DAY);
        return orderRepository.findSumTotalPriceBetweenTime(yesterday, today);
    }

    public int getNumberOfOrderInADay() {
        Date today = new Date();
        Date yesterday = new Date(today.getTime() - ONE_DAY);
        return orderRepository.findNumberOfOrderBetweenTime(yesterday, today);
    }

    public int getNumberOfProduct() {
        return productRepository.countAllProduct();
    }

    public int getNumberOfCategory() {
        return categoryRepository.countAllCategory();
    }

    public List<Order> getTop5RecentlyOrder() {
        return orderRepository.findTop5OrderByCreatedDate();
    }

    public List<TopActiveUserModel> getTop5ActiveUser() {
        List<Object[]> objectsList = userRepository.findTopActiveUser();
        List<TopActiveUserModel> userList = new ArrayList<>();
        TopActiveUserModel user;
        for (Object[] o : objectsList) {
            user = new TopActiveUserModel();
            user.fromObjectArray(o);
            userList.add(user);
        }
        return userList;
    }
}
