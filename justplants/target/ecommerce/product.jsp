<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.justplants.DatabaseHelper" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" href="styles/productpage.css">
        <title>Just Plants</title>
    </head>

    <body>
        <!-- use javabean to add session -->
        <div class="title">
            <h1>
                <a href="./index.jsp">JustPlants</a>
            </h1>
        </div>
        
        <% 
            String plantId = request.getParameter("plant_id");
            DatabaseHelper databaseHelper = new DatabaseHelper();
            Connection con = databaseHelper.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM "+ databaseHelper.getProduct() + " WHERE id="+ plantId;
            ResultSet rs = stmt.executeQuery(sql);
            String friend = "best kept away from pets and children";
        %>
        <%! int total_plants = 0; %>
        
        <div class="nav_bar">
            <ul>
                <li>
                    <a class="active" href="">Shop <%=plantId%></a>
                </li>
                <li>
                    <a href="aboutcompany.html">About Company</a>
                </li>
                <li>
                    <a href="viewCart">View Shopping Cart(<%= total_plants %>)</a>
                </li>
            </ul>
        </div>

        <%
            while (rs.next()){
                
                if (rs.getBoolean("p_pet")){
                    friend = "pet and children friendly";
                }
                
                
        %>
        <div class="item-title">
            <span>Plants</span>
            <h1><%= rs.getString("p_name") %></h1>
        </div>
        <main class="container">
        <div class="left-column">
            <img data-image="red" class="active" src="images/<%= rs.getString("imagename")%>" alt="">
        </div>
        <div class="right-column">
            <div class="product-description">
                <p><i>othername: <%= rs.getString("p_othername")%></i><br>
                <%= rs.getString("p_desc")%><%= rs.getString("p_desc2")%><br><br>
                <i>size (height × width × diameter): <br><%= rs.getString("p_price")%></i>
                <br><br>
                <i>How to take care:</i><br>
                light: <%= rs.getString("p_light")%><br>
                water: <%= rs.getString("p_water")%><br>
                friendliness: <%=friend%><br></p></div>
                
                <div class="product-price"><span>$<%= rs.getInt("p_price") %>.00 </span></div>
                <div class="order-button">
                    <form action="../addToCart" method="get">
                    <input type="number" name="quantity" step="1" min="1" max="30" value="1" title="Qty" class="input-text qty text" size="2" pattern="" inputmode="">
                    <input type="hidden" name="plant_name" value="<%=plantId%>">
                    <button type="submit">Add to cart</button></form>
        </div></div></main>
        <% } %>
        <!-- include recent orders -->
    </body>
</html>
