package com.justplants;

import java.util.List;

public class Order {
    String id;
    int uid;
    String shipping;
    List<String> orders;

    public String getId() {
        return id;
    }

    public int getUid(){
        return uid;
    }

    public String getShipping(){
        return shipping;
    }

    public List<String> getOrders() {
        return orders;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setUid(int uid){
        this.uid = uid;
    }

    public void setShipping(String shipping){
        this.shipping = shipping;
    }

    public void addOrder(String order){
        orders.add(order);
    }
}
