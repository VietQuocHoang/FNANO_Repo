package com.viethq.shoppingonline.services;

import com.viethq.shoppingonline.entities.Product;
import com.viethq.shoppingonline.model.cart.Cart;
import com.viethq.shoppingonline.model.cart.CartItem;
import com.viethq.shoppingonline.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class CartService {

    private ProductRepository productRepository;

    @Autowired
    public void setProductRepository(ProductRepository productRepository) {
        this.productRepository = productRepository;
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

}
