package com.viethq.shoppingonline.model;

import com.viethq.shoppingonline.entities.Category;
import com.viethq.shoppingonline.entities.Product;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class ProductWithImageModel {

    private int id;
    private String name;
    private String description;
    private double price;
    private int amount;
    private MultipartFile thumbnail;
    private Category category;
    private String fileName;

    public ProductWithImageModel() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @NotNull
    @Size(min = 5, max = 20)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @NotNull
    @Size(min = 5, max = 50)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @DecimalMin(value = "0")
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @DecimalMin(value = "0")
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public MultipartFile getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(MultipartFile thumbnail) {
        this.thumbnail = thumbnail;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Product toProduct() {
        Product p = new Product();
        p.setId(id);
        p.setAmount(amount);
        p.setCategory(category);
        p.setDescription(description);
        p.setName(name);
        p.setPrice(price);
        p.setThumbnail(fileName);
        return p;
    }
}
