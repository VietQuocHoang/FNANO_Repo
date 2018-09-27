package com.viethq.productmanagement.models;

import java.util.ArrayList;
import java.util.List;

public class ProductData {
    public static List<Product> productList = new ArrayList<>();
    public static void loadData(){
        productList.add(new Product(1, "Sữa", 12, 12));
        productList.add(new Product(2, "Đường", 12, 12));
        productList.add(new Product(3, "Mía", 12, 12));
        productList.add(new Product(4, "Cam", 12, 12));
        productList.add(new Product(5, "Quít", 12, 12));
        productList.add(new Product(6, "Chanh", 12, 12));
    }
    public static Product findById(int id){
        Product product = null;
        for(Product p: productList){
            if(p.getId() == id){
                return p;
            }
        }
        return product;
    }
    public static boolean deleteById(int id){
        for(Product p: productList){
            if(p.getId() == id){
                productList.remove(p);
                return true;
            }
        }
        return false;
    }
}
