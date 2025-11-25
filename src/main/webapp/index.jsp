<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="db.jsp" %>
   <%
    try {
        Statement st = conn.createStatement();
        st.executeUpdate("UPDATE site_stats SET total_visitors = total_visitors + 1 WHERE id = 1");
    } catch (Exception e) {
        out.println("<!-- Visitor tracking error: " + e.getMessage() + " -->");
    }
%>
   
<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrendTwins - Premium First-Copy</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="logo">TrendTwins</div>
        <ul class="nav-links">
          <li><a href="/TrendTwins/index.jsp">Home</a></li>
          <li><a href="/TrendTwins/admin_stats.jsp">Reports</a></li>
        </ul>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <button class="tag" >Find First-Copy Products from Trusted Vendors</button>
        <h1>Premium Alternatives <br> <span>Without Premium Prices</span></h1>
        <p>Discover high-quality first-copy products from verified vendors across India.</p>
        <p>Authentic style without the luxury price tag.</p>
     <!-- Search Bar -->
<div class="search-bar">
    <form action="search.jsp" method="get" style="display: flex; align-items: center;">
    <input type="text" name="query" placeholder="Search for products..." required>
    <button type="submit">🔍</button>
</form>

</div>

        <!-- Features -->
        <div class="features">
            <p>100+ Trusted Vendors</p>
            <p>1000+ Products</p>
            <p>Quality Verified</p>
            <p>Direct Communication</p>
        </div>
    </section>
     

<!-- Hero Section -->
<section class="hero">
    <h1 class="page-content" style="padding: 10px 10%; ">Featured Products</h1>
    <p style="padding: 10px 10%; ">Handpicked high-quality first-copy products from our trusted vendors</p>
</section>

<!-- Product Grid -->
<div class="product-grid" style="padding: 10px 10%; ">
    <div class="product-card">
        <span class="tag">50% OFF</span>
        <img src="nikeeee.png" alt="Premium Sports Shoes">
        <h3>Travis Scott Fragment</h3>
        <p class="vendor">By SkylerFashion</p>
        <div class="price">₹3,600.00 <span style="text-decoration: line-through; color: #999;">₹7,199</span></div>
        <div class="rating">⭐ 4.7</div>
        <a href="https://firstcopyfashion.com/product/travis-scott-fragement-2/" class="buy-button">Buy Now</a>
    </div>

    <div class="product-card" style="padding: 10px 10%; ">
        <span class="tag">75% OFF</span>
        <img src="bagggg.png" alt="Designer Handbag">
        <h3>Guess Ginevra Handbag</h3>
        <p class="vendor">By LuxuryFinds</p>
        <div class="price">₹4,500.00 <span style="text-decoration: line-through; color: #999;">₹18,000</span></div>
        <div class="rating">⭐ 4.9</div>
        <a href="https://skylerfashion.com/product/guess-ginevra-logo-camera-crossbody-bag-for-women/" class="buy-button">Buy Now</a>
    </div>
</div>
  
    
 
<!-- Why Choose TrendTwins Section -->
<section style="background-color: #0a1a2f; color: white; padding: 60px 10%; display: flex; justify-content: space-between; align-items: center; gap: 40px; flex-wrap: wrap;">
    <!-- Text Column -->
    <div style="flex: 1; min-width: 280px;">
        <h2 style="font-size: 32px;">Why Choose <span style="color: #ff9900;">TrendTwins</span>?</h2>
        <p style="margin-top: 15px;">We curate high-quality first-copy products and connect you directly with trusted vendors across India.</p>
        <ul style="margin-top: 25px; list-style: none; padding: 0;">
            <li style="margin: 10px 0;">✔ Verified vendors with quality products</li>
            <li style="margin: 10px 0;">✔ Direct communication with vendors</li>
            <li style="margin: 10px 0;">✔ No commission, best possible prices</li>
            <li style="margin: 10px 0;">✔ Regular quality checks on vendors</li>
        </ul>
    </div>
    
    <!-- Image + Testimonial -->
    <div style="flex: 1; position: relative; min-width: 280px;">
        <img src="Screenshot 2025-05-21 150535.png" alt="Shopping Bags" style="width: 100%; border-radius: 12px;">
        <div style="position: absolute; bottom: 15px; right: 15px; background: white; color: black; padding: 15px; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); max-width: 250px;">
            <p style="margin: 0; font-size: 14px;">⭐️⭐️⭐️⭐️⭐️</p>
            <p style="margin: 5px 0; font-size: 14px;">"Amazing quality products!"</p>
            <small>— Priya S.</small>
        </div>
    </div>
</section>    





<!-- Newsletter Section -->
<section style="background: #fdf6f2; padding: 60px 10%; text-align: center;">
    <h2>Join Our Community</h2>
    <p>Subscribe to our newsletter for the latest product updates and vendor announcements</p>
    <form style="margin-top: 25px;">
        <input type="email" placeholder="Enter your email" required
            style="padding: 12px 20px; border: 1px solid #ddd; border-radius: 5px 0 0 5px; width: 300px; max-width: 80%; outline: none;">
        <button type="submit"
            style="padding: 12px 20px; background-color: #ff9900; border: none; color: white; border-radius: 0 5px 5px 0; font-weight: bold; cursor: pointer;">
            Subscribe
        </button>
    </form>
    <p style="margin-top: 10px; font-size: 12px; color: #777;">By subscribing, you agree to our Terms of Service and Privacy Policy</p>
</section>

<!-- Footer -->
<footer style="background: #0a1a2f; color: white; padding: 10px 10%; display: flex; flex-wrap: wrap;">
    <!-- Brand -->
    <div style="flex: 1; min-width: 220px; margin-bottom: 30px;">
        <h3 style="color: #ff9900;">TrendTwins</h3>
        <p>Discover high-quality first-copy products from verified vendors across India.</p>
           </div>

    <!-- Quick Links -->
    <div style="flex: 1; min-width: 150px; margin-bottom: 20px;">
        <h4>Quick Links</h4>
        <ul style="list-style: none; padding: 0;">
            <li><a href="index.jsp" style="color: white; text-decoration: none;">Home</a></li>
            <li><a href="#" style="color: white; text-decoration: none;">About</a></li>
            <li><a href="#" style="color: white; text-decoration: none;">Contact</a></li>
        </ul>
    </div>

    <!-- Contact -->
    <div style="flex: 1; min-width: 220px; margin-bottom: 30px;">
        <h4>Contact</h4>
        <p>Email: info@trendtwins.com</p>
        <p>Phone: +91 98765 43210</p>
     </div>
</footer>

<!-- Footer bottom -->
<div style="background: #0a1a2f; color: white; text-align: center; padding:5px 0; font-size: 14px;">
    <p>&copy; 2025 TrendTwins. All rights reserved.</p>
    <p>
    <a href="privacy.jsp" style="color: #ccc; margin: 0 10px;">Privacy Policy</a> |
    <a href="terms.jsp" style="color: #ccc; margin: 0 10px;">Terms of Service</a> |
    <a href="disclaimer.jsp" style="color: #ccc; margin: 0 10px;">Disclaimer</a>
</p>

</div>


    <script src="script.js"></script>
</body>
</html>

