package com.justplants;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@Path("/order")
public class OrderApi {
    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getOrder(@PathParam("id") String id) throws SQLException {
        DatabaseHelper databaseHelper = new DatabaseHelper();
        Connection con = databaseHelper.getConnection();
        Statement stmt = con.createStatement();
        String sql = "SELECT id FROM " + databaseHelper.getOrder() + " WHERE id=" + id;
        ResultSet rs = stmt.executeQuery(sql);

        Order order = new Order();
        order.setId(id);

        if (!rs.next()) {
            return Response.status(Response.Status.NOT_FOUND).build();
        } else {
            while (rs.next()) {
                order.setShipping(rs.getString("shipping"));
                order.setUid(rs.getInt("u_id"));
                for (int i = 1; i < 11; i++) {
                    if (rs.getInt("p_" + i) == 1)
                        order.addOrder("p_" + i);
                }
            }
        }
        return Response.ok(order, MediaType.APPLICATION_JSON).build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addOrder(Order order) throws SQLException {
        try {
            DatabaseHelper databaseHelper = new DatabaseHelper();
            Connection con = databaseHelper.getConnection();
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO " + databaseHelper.getOrder() + "VALUES";
            sql += "(" + order.getUid() + "," + order.getShipping() + ",";
            for (int i = 1; i < 11; i++) {
                if (i < 10) {
                    if (order.getOrders().contains("p_" + i))
                        sql += "1, ";
                    else
                        sql += "0, ";
                } else {
                    if (order.getOrders().contains("p_" + i))
                        sql += "1)";
                    else
                        sql += "0)";
                }
            }

            ResultSet rs = stmt.executeQuery(sql);

            System.out.println("Id: " + order.getId());
            System.out.println("Shipping: " + order.getShipping());
            System.out.println("Uid: " + order.getUid());
            System.out.println("Orders: ");
            for (int i = 0; i < order.getOrders().size(); i++) {
                System.out.println(i);
            }

            return Response.ok().entity("Order Added Successfully").build();

        } catch (Exception e) {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
        }  
    }

}
