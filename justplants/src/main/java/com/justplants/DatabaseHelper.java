package com.justplants;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseHelper {
    static String schemaName="JustPlantsProducts";
    static String passwd="aliceqiu367";

    static String product="products";
    static String order="order_info";
    static String rating="ratings";
    static String user="user_info";

    public Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/" + schemaName, "root", passwd);
            return con;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public String getProduct(){
        return product;
    }
}