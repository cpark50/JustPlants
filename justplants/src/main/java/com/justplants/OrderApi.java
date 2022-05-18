package com.justplants;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

@Path("/order")
public class OrderApi {
    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getOrder(@PathParam("id") String id) throws SQLException {
        DatabaseHelper databaseHelper = new DatabaseHelper();
        Connection con = databaseHelper.getConnection();
        Statement stmt = con.createStatement();
        String sql = "SELECT * FROM " + databaseHelper.getOrder() + " WHERE id=" + id;
        ResultSet rs = stmt.executeQuery(sql);

        Order order = new Order();
        order.setId(id);

        if (rs.next()){
            order.setShipping(rs.getString("shipping"));
            order.setUid(rs.getInt("u_id"));
            for (int i = 1; i < 11; i++) {
                if (rs.getInt("p_" + i) > 0)
                {
                    order.addOrder("p_"+i, rs.getInt("p_"+i));
                }

            }
            return Response.ok(order, MediaType.APPLICATION_JSON).build();
        }
        return Response.status(Response.Status.NOT_FOUND).build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addOrder(Order order) throws SQLException {
        try {
            DatabaseHelper databaseHelper = new DatabaseHelper();
            Connection con = databaseHelper.getConnection();
            Statement stmt = con.createStatement();
            String stmtSql = "INSERT INTO " + databaseHelper.getOrder() + "(u_id, shipping";
            String valueSql = " VALUES(" + order.getUid() + ", \"" + order.getShipping() + "\"";
            // String checkSql = "SELECT * FROM " + databaseHelper.getOrder() + " WHERE id=" + order.getId();
            // ResultSet rs = stmt.executeQuery(checkSql);

            for (Map.Entry<String,Integer> o : order.getOrderInfo().entrySet()){
                if (o.getValue() > 0) {
                    stmtSql += ", " + o.getKey();
                    valueSql += ", " + o.getValue();
                }
            }
            stmtSql += ")";
            valueSql += ")";
            String sql = stmtSql + valueSql;
            System.out.println(sql);
            stmt.executeUpdate(sql);

            System.out.println("Id: " + order.getId());
            System.out.println("Shipping: " + order.getShipping());
            System.out.println("Uid: " + order.getUid());
            System.out.println("Orders: ");
            for (Map.Entry<String,Integer> o : order.getOrderInfo().entrySet()){
                System.out.println(o.getKey() + ": " + o.getValue());
            }

            return Response.ok().entity("Order Added Successfully").build();

        } catch (Exception e) {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
        }  
    }

}
