package com.justplants;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/product")
public class Api {

    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getProduct(@PathParam("id") String id) {
        // get the user info from DB using his "id"
        boolean idFound = true;
        if(idFound) {
            ProductClient product = new ProductClient();
            product.setId(id);
            product.setName("myProduct");
            product.setRating("3");
            return Response.ok(product, MediaType.APPLICATION_JSON).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addProduct(ProductClient product)  {
        boolean isSuccess = true;

        System.out.println("Id: " + product.getId());
        System.out.println("name: " + product.getName());
        System.out.println("rating: " + product.getRating());

        // add product to DB
        if(isSuccess) {
            return Response.ok().entity("Product Added Successfully").build();
        }
        return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
    }
}
