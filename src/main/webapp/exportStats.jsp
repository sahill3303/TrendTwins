<%@ page import="java.sql.*, java.io.*" %>
<%@ include file="db.jsp" %>

<%
    response.setContentType("text/csv");
    response.setHeader("Content-Disposition", "attachment; filename=\"product_clicks.csv\"");

    // Query all product clicks from your DB (no filtering applied here)
    String sql = "SELECT product_name, user_ip, click_time FROM product_clicks ORDER BY click_time DESC";

    PreparedStatement ps = conn.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();

    PrintWriter writer = response.getWriter();

    // CSV header
    writer.println("Product Name,User IP,Click Time");

    // Write rows
    while (rs.next()) {
        String product = rs.getString("product_name").replaceAll("\"", "\"\"");
        String ip = rs.getString("user_ip");
        String clickTime = rs.getTimestamp("click_time").toString();

        // Escape commas/quotes in product name by surrounding with quotes
        writer.printf("\"%s\",%s,%s\n", product, ip, clickTime);
    }

    writer.flush();
    writer.close();
%>
