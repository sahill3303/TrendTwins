<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
    String inputUsername = request.getParameter("username");
    String inputPassword = request.getParameter("password");

    PreparedStatement ps = conn.prepareStatement("SELECT * FROM admins WHERE username = ? AND password = ?");
    ps.setString(1, inputUsername);
    ps.setString(2, inputPassword);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        session.setAttribute("admin", inputUsername);
        response.sendRedirect("admin_stats.jsp");
    } else {
        response.sendRedirect("admin_login.jsp?error=true");
    }
%>
