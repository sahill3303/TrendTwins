<%@ page import="java.sql.*" %>
<%
    // ✅ CHANGE THESE 3 VALUES AS PER YOUR SYSTEM
    String jdbcUrl  = "jdbc:mysql://localhost:3306/trendtwins?useSSL=false&serverTimezone=UTC";
    String dbUser   = "root";          // your MySQL username
    String dbPass   = "root"; // your MySQL password

    Connection conn = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
    } catch (Exception e) {
        // 🔴 Show the REAL REASON instead of hiding it
        out.println("<p style='color:red'>DB connection error: " + e.getMessage() + "</p>");
        e.printStackTrace();
    }
%>
