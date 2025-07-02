<%-- 
    Document   : procesarRegistro.jsp
    Created on : 30/06/2025, 6:35:15?p. m.
    Author     : Holger Edud
--%>

<%@ page import="java.sql.*" %>
<%
    String nombres = request.getParameter("nombres");
    String apellidos = request.getParameter("apellidos");
    int edad = Integer.parseInt(request.getParameter("edad"));
    String email = request.getParameter("email");
    String telefono = request.getParameter("telefono");
    String direccion = request.getParameter("direccion");
    String ciudad = request.getParameter("ciudad");
    String contrasena = request.getParameter("contrasena");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/academy", "root", "");

        String sql = "INSERT INTO usuarios (Nombres, Apellidos, Edad, Email, Telefono, Direccion, Ciudad, Contraseña) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, nombres);
        ps.setString(2, apellidos);
        ps.setInt(3, edad);
        ps.setString(4, email);
        ps.setString(5, telefono);
        ps.setString(6, direccion);
        ps.setString(7, ciudad);
        ps.setString(8, contrasena);

        ps.executeUpdate();
        out.println("<h2>Registro exitoso</h2><a href='login.jsp'>Iniciar sesión</a>");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
