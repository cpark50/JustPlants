<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.example.demo_jsp.DatabaseHelper" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" href="styles/mainpage.css">
        <title>Just Plants</title>
    </head>

    <body>
        <!-- use javabean to add session -->
        <% 
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/" + credentials.schemaName, "root", credentials.passwd);
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM "+tables.product;
            ResultSet rs = stmt.executeQuery(sql);
            total_plants = 0;
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
                    <a href="viewCart">View Shopping Cart(<%=total_plants%>)</a>
                </li>
            </ul>
        </div>

        <%
            while (rs.next()){
                String name = rs.getString("p_name");
                String image = rs.getString("imagename");
                Integer price = rs.getInt("p_price");
                Integer p_id = rs.getInt("id");
        %>

        <div class="col-1" id= <%=p_id%> >
            // p_id should be java code
            <a href="./product/<%=p_id%>">
                <img src="images/<%=image%>" alt=<%name%>>
                <p class="pname"><%=name%></p>
                <p class="price">$<%=price%>.00</p>
            </a>
        </div>

        <!-- include recent orders -->
        
    </body>
</html>
