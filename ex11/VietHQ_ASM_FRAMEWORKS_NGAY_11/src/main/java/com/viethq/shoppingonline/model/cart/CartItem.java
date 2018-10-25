package com.viethq.shoppingonline.model.cart;

import com.viethq.shoppingonline.entities.Product;

public class CartItem {
    private int productId;
    private int quantity;
    private Product product;

    public CartItem() {
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
