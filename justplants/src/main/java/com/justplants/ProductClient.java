package com.justplants;

public class ProductClient {

    String id;
    String name;
    String image;
    int price;
    String size;
    String othername;
    String dscrptn;
    String water;
    String light;
    String friend = "best kept away from pets and children";   

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getOtherName() {
        return othername;
    }

    public void setOtherName(String othername) {
        this.othername = othername;
    }

    public String getDescription() {
        return dscrptn;
    }

    public void setDescription(String dscrptn) {
        this.dscrptn = dscrptn;
    }

    public String getWater() {
        return water;
    }

    public void setWater(String water) {
        this.water = water;
    }

    public String getLight() {
        return light;
    }

    public void setLight(String light) {
        this.light = light;
    }

    public String getFriend() {
        return friend;
    }

    public void setFriend(String friend) {
        this.friend = friend;
    }
}
