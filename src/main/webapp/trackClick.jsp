<%@ page import="java.sql.*, java.net.URLEncoder" %>
<%@ include file="db.jsp" %>
<%
    String productName = request.getParameter("name");
    String productLink = request.getParameter("link");

    if (productName != null && productLink != null) {
        String ip = request.getRemoteAddr();
        PreparedStatement pst = conn.prepareStatement(
            "INSERT INTO product_clicks (product_name, user_ip, click_time) VALUES (?, ?, NOW())");
        pst.setString(1, productName);
        pst.setString(2, ip);
        pst.executeUpdate();
        pst.close();

        response.sendRedirect(productLink); // safely redirect to product
    } else {
        out.println("Invalid tracking request.");
    }
%>
