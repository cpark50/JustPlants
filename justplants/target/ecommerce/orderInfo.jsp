<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.justplants.plants" %>
<%@ page import="com.justplants.DatabaseHelper" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
    <head>
        <script type="text/javaScript" src="js/checkValidation.js"></script>
        <script type = "text/JavaScript" src = "js/cityState.js"></script>
        <script type = "text/JavaScript" src = "js/taxRate.js"></script>
        <link rel="stylesheet" href="styles/orderInfo.css">
        <title>Just Plants</title>
    </head>

    <body>
        <div class="nav_bar">
            <ul>
                <li>
                    <a class="active" href="./">Shop</a>
                </li>
                <li>
                    <a href="aboutcompany.html">About Company</a>
                </li>
            </ul>
        </div>

        <%
        int [] currentCart=null;
        int userId=0;
        DatabaseHelper databaseHelper = new DatabaseHelper();
        Connection con = databaseHelper.getConnection();
        Statement stmt = con.createStatement();
        String sql = "SELECT DISTINCT state FROM " + DatabaseHelper.tax;
        ResultSet rs = stmt.executeQuery(sql);
        if (request.getSession().getAttribute("cart") != null){
            currentCart = (int[]) request.getSession().getAttribute("cart");
        }
        
        if(request.getSession().getAttribute("visitorId") != null){
            userId = (int)request.getSession().getAttribute("visitorId");
        }
        String greeting = "Hello User "+ userId;
        int total = 0;
        %>
        <fieldset>
            <legend>Cart</legend>
            <div class="CartText"><%= greeting %></div>
            <%
            if(currentCart!=null){
                for(int i=0; i<11; i++){
                    if(currentCart[i]>0){
                        total += plants.PLANT_PRICES[i]*currentCart[i];
            %>
            <div class="CartText"><%= plants.PLANT_NAMES[i] %>: <%=currentCart[i] %></div>
            <%
                    }
                }
            } 
            %>
            <div class="totalPrice">Total(dollar): </div>
            <div class="totalPrice" id="total"><%= total%>.00</div>
        </fieldset>

        <form action="checkOut" name="orderForm" method="post" enctype="text/plain" onsubmit="return (CheckValidation(this))">
        <center>
        <fieldset><legend>Shipping Information</legend>
        First Name:<br><input type="text" name="fname"><br>
        Last Name:<br><input type="text" name="lname"><br>
        Phone Number:<br><input type="text" name="phone" placeholder="(xxx)-xxx-xxxx"><br>
        State:<br><input list="states" name="states" id="state" onblur="getTax(this.value)"><br>
        <datalist id="states">
        <%
        while(rs.next()){
        %>
            <option value=<%= rs.getString("state")%> >
        <%    
        }
        %>
        </datalist>
        City:<br><input type="text" name="city" id="city"><br>
        Address:<br><input type="text" name="address1"><br><input type="text" name="address2"><br>
        Zip Code:<br><input type="text" name="zip" onblur="getPlace(this.value)"><br><br>
        Shipping Speed:
        <select name="shipping">
        <option value="Overnight" selected="selected">Overnight</option>
        <option value="Within 3 days">Within 3 days</option>
        <option value="Within 7 days">Within 7 days</option>
        </select></fieldset><br><br>
        <fieldset><legend>Payment Information</legend><br>
        Payment Method:
        <select name="payment">
        <option value="None" selected="selected">None</option>
        <option value="VISA">VISA</option>
        <option value="Mastercard">Mastercard</option>
        <option value="Discover">Discover</option>
        <option value="American Express">American Express</option>
        <option value="UnionPay">UnionPay</option>
        </select><br><br>
        Card Number:<br><input type="text" name="card"><br>
        Name on Card:<br><input type="text" name="fullname"><br>
        Expiration Date:<br><input type="text" name="expDate" placeholder="mm/yyyy">
        </fieldset>
        <input type="submit" value="Check Out">
        <input type="reset" value="Reset">
        </center></form>
    </body>
</html>
