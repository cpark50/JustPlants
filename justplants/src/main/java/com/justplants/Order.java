package com.justplants;

import java.util.HashMap;
import java.util.Map;

public class Order {
    String id;
    int uid;
    String shipping;
    // List<String> orders = new ArrayList<String>();
    Map<String, Integer> orderInfo = new HashMap<String, Integer>();

    public String getId() {
        return id;
    }

    public int getUid(){
        return uid;
    }

    public String getShipping(){
        return shipping;
    }

    public Map<String, Integer> getOrderInfo(){
        return orderInfo;
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

    public void addOrder(String order, int quant){
        orderInfo.put(order, quant);
    }
}
