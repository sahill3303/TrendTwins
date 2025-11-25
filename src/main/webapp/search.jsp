<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results - TrendTwins</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins&display=swap">
    <style>
        body {
            font-family: "Poppins", sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
            background: #fdfdfd;
            transition: background 0.5s ease-in-out;
        }

        .hero {
            padding: 120px 20px;
            margin-top: 20px;
        }

        /* Product Grid */
        .product-grid {
            margin-top: 0;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 10px;
            margin-top: 5px;
            animation: fadeIn 1s ease-in-out;
        }

        .product-card {
            background: white;
            padding: 10px 10%;
            border-radius: 16px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.07);
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-card img {
            width: 100%;
            max-height: 200px;
            object-fit: contain;
            margin-bottom: 15px;
        }

        .product-card h3 {
            font-size: 18px;
            margin: 10px 0 5px;
        }

        .product-card .price {
            color: #ff9900;
            font-weight: bold;
            margin: 5px 0;
        }

        .buy-button {
            display: inline-block;
            background-color: #ff9900;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            transition: background 0.3s ease;
        }

        .buy-button:hover {
            background-color: #e67e00;
        }
        
        
        
/* Navbar */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    background-color: white;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000;
}


.navbar.sticky .nav-links a {
    color: blue;
}



/* Navigation Links */
.nav-links {
    list-style: none;
    display: flex;
}

.nav-links li {
    margin: 0 15px;
}

.nav-links a {
    text-decoration: none;
    color: black;
    font-size: 16px;
    transition: color 0.3s ease-in-out;
}

.nav-links a:hover {
    color: #ff9900;
}
        

/* Navbar Links */
.nav-links a {
    text-decoration: none;
    color: black;
    transition: color 0.3s ease-in-out;
}

.nav-links a:hover {
    color: #ff9900;
}

/* Logo */
.logo {
    text-decoration: none;
    font-size: 24px;
    font-weight: bold;
    color: #ff9900;
    transition: color 0.3s ease-in-out;
}




        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
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
<section class="hero">
    <h1>Search Results</h1>
    <div id="result-info"></div>
    <div class="product-grid" id="product-grid"></div>
</section>

<script>
	const urlParams = new URLSearchParams(window.location.search);
	let query = urlParams.get('query');
	

  
    if (!query) {
        document.getElementById("result-info").innerHTML = "<p>Please enter a search term.</p>";
    } else {
        document.getElementById("result-info").innerHTML = `<p>Results for "<strong>${query}</strong>":</p>`;

        fetch('http://localhost:5678/webhook/product?q=' + encodeURIComponent(query))
            .then(response => response.json())
            .then(data => {
                const results = data.shopping_results || [];
                const grid = document.getElementById("product-grid");

                if (results.length === 0) {
                    grid.innerHTML = "<p>No products found.</p>";
                    return;
                }

                results.slice(0, 10).forEach(product => {
                    const card = document.createElement("div");
                    card.className = "product-card";

                    const img = document.createElement("img");
                    img.src = product.thumbnail || "https://via.placeholder.com/200";
                    img.alt = "Product Image";

                    const title = document.createElement("h3");
                    title.textContent = product.title || "No Title";

                    const price = document.createElement("div");
                    price.className = "price";
                    price.textContent = product.price || "N/A";


                    const link = document.createElement("a");
                    link.href = "trackClick.jsp?name=" + encodeURIComponent(product.title) + "&link=" + encodeURIComponent(product.product_link);

                    link.className = "buy-button";
                    link.textContent = "Buy Now";
                    link.target = "_blank";

                    card.appendChild(img);
                    card.appendChild(title);
                    card.appendChild(price);
                    card.appendChild(link);

                    grid.appendChild(card);
                });
            })
            .catch(error => {
                document.getElementById("result-info").innerHTML = `<p>Error fetching products: ${error.message}</p>`;
            });
    }
</script>

</body>
</html>
