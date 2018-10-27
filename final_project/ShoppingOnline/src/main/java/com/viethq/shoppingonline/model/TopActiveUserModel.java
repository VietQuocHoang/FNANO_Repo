package com.viethq.shoppingonline.model;

public class TopActiveUserModel {
    private int ID_COL = 0;
    private int USERNAME_COL = 1;
    private int NUM_OF_ORDER_COL = 2;
    private int id;
    private String username;
    private int numOfOrder;

    public TopActiveUserModel() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getNumOfOrder() {
        return numOfOrder;
    }

    public void setNumOfOrder(int numOfOrder) {
        this.numOfOrder = numOfOrder;
    }

    public void fromObjectArray(Object[] object) {
        id = Integer.parseInt(String.valueOf(object[ID_COL]));
        username = String.valueOf(object[USERNAME_COL]);
        numOfOrder = Integer.parseInt(String.valueOf(object[NUM_OF_ORDER_COL]));
    }

}
