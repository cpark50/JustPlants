package com.justplants;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//when to close the db? 
//add information to and query table
@WebServlet(name = "addToCart") //@WebServlet(name="JDBC Demo", urlPatterns="/link")
public class addToCart extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession session = req.getSession(true);
        PrintWriter writer = resp.getWriter();
        int plant_id = Integer.parseInt(req.getParameter("plant_name"));
        int plant_qt = Integer.parseInt(req.getParameter("quantity"));
        int[] currentCart = (int[]) session.getAttribute("cart");
        
        if (currentCart == null){
            currentCart = new int[11];
            currentCart[plant_id] += plant_qt;
        }
        else {
            currentCart[plant_id] += plant_qt;
        }
        session.setAttribute("cart", currentCart);
        // RequestDispatcher dispatcher = req.getRequestDispatcher("product");
        // dispatcher.include(req, resp);
        int totalPlants = (int) session.getAttribute("totalPlants");
        session.setAttribute("totalPlants", totalPlants + plant_qt);
        resp.sendRedirect("http://localhost:8080/ecommerce/product/"+plant_id);

    }
}
