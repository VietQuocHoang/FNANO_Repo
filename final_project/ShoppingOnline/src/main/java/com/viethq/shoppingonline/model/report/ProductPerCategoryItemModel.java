package com.viethq.shoppingonline.model.report;

public class ProductPerCategoryItemModel {
    private int id;
    private String name;
    private int amount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public void fromObjects(Object[] objects) {
        id = Integer.parseInt(String.valueOf(objects[0]));
        name = String.valueOf(objects[1]);
        amount = Integer.parseInt(String.valueOf(objects[2]));
    }
}
