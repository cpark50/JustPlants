<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>

    <head>
        <title>JustPlants</title>
    </head>

    <body>
        <div class="title">
            <h1><a href="../">JustPlants</a>
          </div>
          <div class="nav_bar">
            <ul>
              <li><a class="active" href="../">Home</a></li>
              <li><a href="../aboutcompany.html">About Company</a></li>
              <li><a href="../">Make Order</a></li>
            </ul>
          </div>
          <div class="item-title">
            <span>Plants</span>
            <h1>Areca Palm</h1>
          </div>
          <main class="container">
          
            <link rel="stylesheet" href="styles/productpage.css">
          
            <div class="left-column">
              <img data-image="red" class="active" src="images/areca_palm_80.jpeg" alt="">
            </div>
          
            <!-- Right Column -->
            <div class="right-column">
          
              <!-- Product Description -->
              <div class="product-description">
          
                <p>A very popular indoor Palm, also known as Areca Palm. The Areca Palm is a wonderful choice of indoor palm tree
                  to bring a touch of the tropics into your home. The leaves are a lovely shade of green, growing on clusters of
                  slender yet upright stalks. <br>
                  <br>
                  <i>size (height × width × diameter):<br>
                    160cm × 80cm × 60cm <br><br></i>
          
          
          
                  <i>How to take care:</i> <br>
                  light: direct and indirect sun <br>
                  water: 2-3 times per week for first month, once a month for the remaining first year after planting. <br>
                  keep the soil moist but well-drained <br>
                  friendliness: pet and children friendly <br>
                </p>
          
              </div>
              <!-- Product Pricing -->
              <div class="product-price">
                <span>$80</span>
              </div>
              <div class="order-button">
                <form action="../orderInfo.html" method="get">
                  <input type="hidden" name="plant_number" value="1" />
                  <button type="submit">Order Now</button>
                </form>
              </div>
            </div>
          
          
            
          
          </main>
    </body>

    </html>