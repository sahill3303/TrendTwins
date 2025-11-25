<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
    // Support both "admin" and "adminUsername" just in case
    String adminUser = (String) session.getAttribute("admin");
    if (adminUser == null) {
        adminUser = (String) session.getAttribute("adminUsername");
    }
    if (adminUser == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }

    if (conn == null) {
        out.println("<p style='color:red'>Database connection failed. Check db.jsp and MySQL settings.</p>");
        return;
    }

    Statement st = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - TrendTwins</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: "Poppins", sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        /* Navbar Styling */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ff9900;
            padding: 15px 10%;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .navbar .logo {
            font-size: 24px;
            font-weight: bold;
            color: white;
        }

        .nav-links {
            list-style: none;
            display: flex;
            gap: 15px;
        }

        .nav-links li {
            display: inline-block;
        }

        .nav-links a {
            text-decoration: none;
            color: white;
            font-size: 16px;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #000;
        }

        .admin-container {
            padding: 60px 10%;
            animation: fadeIn 0.8s ease-in-out;
        }

        .admin-section {
            background: #fff;
            padding: 25px;
            margin: 20px 0;
            border-radius: 12px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .admin-section h3 {
            font-size: 22px;
            color: #ff9900;
            margin-bottom: 15px;
        }

        .admin-section ul {
            list-style: none;
            padding-left: 0;
        }

        .admin-section li {
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }

        .admin-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .admin-table th, .admin-table td {
            border: 1px solid #ddd;
            padding: 14px;
            text-align: center;
        }

        .admin-table th {
            background-color: #ff9900;
            color: white;
        }

        .admin-table tr:nth-child(even) {
            background-color: #fafafa;
        }

        .export-btn {
            background-color: #ff9900;
            color: white;
            border: none;
            padding: 10px 22px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s;
            box-shadow: 0 4px 8px rgba(255, 153, 0, 0.4);
            font-family: "Poppins", sans-serif;
        }

        .export-btn:hover {
            background-color: #e68a00;
            transform: scale(1.03);
            box-shadow: 0 6px 12px rgba(230, 138, 0, 0.6);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar">
    <div class="logo">TrendTwins Dashboard</div>
    <ul class="nav-links">
        <li><a href="/TrendTwins/index.jsp">Home</a></li>
        <li><a href="/TrendTwins/admin_stats.jsp">Reports</a></li>
        <li>
            <form id="logoutForm" action="admin_logout.jsp" method="post" style="display:inline;">
                <button type="submit" class="export-btn">Logout</button>
            </form>
        </li>
    </ul>
</nav>

<div class="admin-container">
<%
    try {
        // ---- Total visitors ----
        st = conn.createStatement();
        rs = st.executeQuery("SELECT total_visitors FROM site_stats WHERE id = 1");
%>
    <div class="admin-section">
        <h3>Total Visitors</h3>
        <%
            if (rs.next()) {
        %>
            <p style="font-size: 20px;">
                <strong><%= rs.getInt("total_visitors") %></strong> site visits
            </p>
        <%
            } else {
        %>
            <p>No stats found. Make sure site_stats has a row with id = 1.</p>
        <%
            }
            rs.close();
        %>
    </div>

    <form method="get" action="exportStats.jsp" style="margin-bottom: 20px;">
        <button type="submit" class="export-btn">Export Stats to CSV</button>
    </form>

    <!-- Top Clicked Products -->
    <div class="admin-section">
        <h3>Top Clicked Products</h3>
        <ul>
        <%
            rs = st.executeQuery(
                "SELECT product_name, COUNT(*) AS click_count " +
                "FROM product_clicks " +
                "GROUP BY product_name " +
                "ORDER BY click_count DESC"
            );
            boolean hasClicks = false;
            while (rs.next()) {
                hasClicks = true;
        %>
            <li>
                <strong><%= rs.getString("product_name") %></strong> :
                <%= rs.getInt("click_count") %> clicks
            </li>
        <%
            }
            rs.close();
            if (!hasClicks) {
        %>
            <li>No product clicks recorded yet.</li>
        <%
            }
        %>
        </ul>
    </div>

    <!-- Recent Clicks -->
    <div class="admin-section">
        <h3>Recent Clicks</h3>
        <table class="admin-table">
            <tr>
                <th>Product</th>
                <th>User IP</th>
                <th>Click Time</th>
            </tr>
        <%
            rs = st.executeQuery(
                "SELECT product_name, user_ip, click_time " +
                "FROM product_clicks " +
                "ORDER BY click_time DESC " +
                "LIMIT 10"
            );
            while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getString("product_name") %></td>
                <td><%= rs.getString("user_ip") %></td>
                <td><%= rs.getTimestamp("click_time") %></td>
            </tr>
        <%
            }
            rs.close();
        %>
        </table>
    </div>

<%
    } catch (Exception e) {
        out.println("<p style='color:red'>Error loading admin stats: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception ignore) {}
        try { if (st != null) st.close(); } catch (Exception ignore) {}
        try { if (conn != null) conn.close(); } catch (Exception ignore) {}
    }
%>
</div>

<script>
    document.getElementById("logoutForm").addEventListener("submit", function(e) {
        const confirmLogout = confirm("Are you sure you want to log out?");
        if (!confirmLogout) e.preventDefault();
    });
</script>

</body>
</html>
