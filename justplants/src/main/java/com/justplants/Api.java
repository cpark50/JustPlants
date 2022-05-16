package com.justplants;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@Path("/product")
public class Api {

    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getProduct(@PathParam("id") String id) {
        // get the user info from DB using his "id"
        boolean idFound = false;
        int intId = Integer.parseInt(id);
        if (intId > 0 || intId <= 10){
            idFound = true;
        }

        if(idFound) {
            ProductClient product = new ProductClient();
            product.setId(id);
            try{ //slow. connection. 
                DatabaseHelper databaseHelper = new DatabaseHelper();
                Connection con = databaseHelper.getConnection();            
                Statement stmt = con.createStatement();
                String sql = "SELECT * FROM "+ databaseHelper.getProduct() +" WHERE id=" + product.id;
                ResultSet rs = stmt.executeQuery(sql);
                while(rs.next()){
                    product.setName(rs.getString("p_name"));
                    product.setImage(rs.getString("imagename"));
                    product.setPrice(rs.getInt("p_price"));
                    product.setOtherName(rs.getString("p_othername"));
                    product.setDescription(rs.getString("p_desc")+rs.getString("p_desc2"));
                    product.setSize(rs.getString("p_size"));
                    product.setWater(rs.getString("p_water"));
                    product.setLight(rs.getString("p_light"));
                    if (rs.getBoolean("p_pet")){
                        product.setFriend("pet and children friendly");
                    }
                }
                return Response.ok(product, MediaType.APPLICATION_JSON).build();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } else {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.status(Response.Status.NOT_FOUND).build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addProduct(ProductClient product)  {
        boolean isSuccess = true;

        // System.out.println("Id: " + product.getId());
        // System.out.println("name: " + product.getName());
        // System.out.println("rating: " + product.getRating());

        // add product to DB
        if(isSuccess) {
            return Response.ok().entity("Product Added Successfully").build();
        }
        return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
    }
}
