package com.viethq.shoppingonline.model.cart;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<CartItem> cartItemList;
    private float totalPrice;

    public Cart() {
        cartItemList = new ArrayList<>();
    }

    public List<CartItem> getCartItemList() {
        return cartItemList;
    }

    public void setCartItemList(List<CartItem> cartItemList) {
        this.cartItemList = cartItemList;
    }

    public void addCartItem(CartItem cartItem) {
        CartItem existed = findCartItem(cartItem);
        if (existed != null) {
            int sum = existed.getQuantity() + cartItem.getQuantity();
            if (existed.getProduct().getAmount() < sum) {
                sum = existed.getProduct().getAmount();
            }
            existed.setQuantity(sum);

            if (existed.getQuantity() == 0) {
                removeCartItem(existed);
            }
        } else {
            getCartItemList().add(cartItem);
        }
    }

    public CartItem findCartItem(CartItem cartItem) {
        for (CartItem c : getCartItemList()) {
            if (c.getProductId() == cartItem.getProductId()) {
                return c;
            }
        }
        return null;
    }

    public CartItem findCartItem(int productId) {
        for (CartItem c : getCartItemList()) {
            if (c.getProductId() == productId) {
                return c;
            }
        }
        return null;
    }

    public void removeCartItem(CartItem cartItem) {
        getCartItemList().remove(cartItem);
    }

    public void removeCartItem(int productId) {
        CartItem cartItem = findCartItem(productId);
        removeCartItem(cartItem);
    }

    public float getTotalPrice() {
        totalPrice = 0;
        for (CartItem c : cartItemList) {
            totalPrice += (c.getProduct().getPrice() * c.getQuantity());
        }
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }
}
