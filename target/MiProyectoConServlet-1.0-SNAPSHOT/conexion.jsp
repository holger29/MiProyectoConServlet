<%-- 
    Document   : conexion
    Created on : 30/06/2025, 7:34:56?p. m.
    Author     : Holger Edud
--%>

<%@ page import="java.sql.*" %>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/academy", "root", "");
        out.println("Conexión exitosa");
        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
