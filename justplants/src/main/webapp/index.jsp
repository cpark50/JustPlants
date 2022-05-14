<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.justplants.DatabaseHelper" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.concurrent.ThreadLocalRandom" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" href="styles/mainpage.css">
        <title>Just Plants</title>
    </head>

    <body>
        <!-- add session -->
        <%
            if (session.isNew()){
                int userId = ThreadLocalRandom.current().nextInt();
                session.setAttribute("visitorId", userId);
            }
        %>
        <div class="title">
            <h1>
                <a href="">JustPlants</a>
            </h1>
        </div>
        
        <% 
            DatabaseHelper databaseHelper = new DatabaseHelper();
            Connection con = databaseHelper.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM "+ databaseHelper.getProduct();
            ResultSet rs = stmt.executeQuery(sql);
        %>
        <%! int totalPlants = 0; %>
        <%
            if(null == session.getAttribute("totalPlants")) {
                session.setAttribute("totalPlants", totalPlants);
            }
            else {
                totalPlants = (int) session.getAttribute("totalPlants");
            }
        %>
        
        <div class="nav_bar">
            <ul>
                <li>
                    <a class="active" href="">Shop</a>
                </li>
                <li>
                    <a href="aboutcompany.html">About Company</a>
                </li>
                <li>
                    <a href="viewCart">View Shopping Cart(<%= totalPlants %>)</a>
                </li>
            </ul>
        </div>

        <%
            while (rs.next()){
        %>
        <div class="col-1" id= <%= rs.getInt("id") %> >
            <a href="./product.jsp?plant_id=<%= rs.getInt("id") %>">
                <img src="images/<%= rs.getString("imagename") %>" alt=<%= rs.getString("p_name") %>>
                <p class="pname"><%= rs.getString("p_name") %></p>
                <p class="price">$<%= rs.getInt("p_price") %>.00</p>
            </a>
        </div>
        <% } %>
        <!-- include recent orders -->
        <jsp:include page="/recentorder" flush="true" />

        <!-- close connections -->
        <%
            rs.close();
            stmt.close();
            con.close();
        %>
    </body>
</html>
