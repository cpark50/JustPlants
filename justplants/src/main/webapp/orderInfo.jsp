<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.justplants.plants" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
    <head>
        <script type="text/javaScript" src="js/checkValidation.js"></script>
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
        if (request.getSession().getAttribute("cart") != null){
            currentCart = (int[]) request.getSession().getAttribute("cart");
        }
        
        if(request.getSession().getAttribute("visitorId") != null){
            userId = (int)request.getSession().getAttribute("visitorId");
        }
        String greeting = "Hello User "+userId;
        int total = 0;
        %>
        <fieldset>
            <legend>Cart</legend>
            <div class="CartText"><%= greeting %></div>
            <%
            if(currentCart){
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
            <div class="CartText">Total: $<%= total%>.00</div>
        </fieldset>

    </body>
</html>
