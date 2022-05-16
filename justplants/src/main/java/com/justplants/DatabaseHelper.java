package com.justplants;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseHelper {
    static String schemaName="pa124";
    static String passwd="cindy1234";

    static String product="products";
    static String order="order_info";
    static String rating="ratings";
    static String user="user_info";
    public static String zip="zip_codes";
    public static String tax="tax_rates";

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