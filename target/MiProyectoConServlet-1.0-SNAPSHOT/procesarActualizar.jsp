<%-- 
    Document   : procesarActualizar
    Created on : 1/07/2025, 11:18:15?p. m.
    Author     : Holger Edud
--%>

<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    String nombres = request.getParameter("nombres");
    String apellidos = request.getParameter("apellidos");
    int edad = Integer.parseInt(request.getParameter("edad"));
    String email = request.getParameter("email");
    String telefono = request.getParameter("telefono");
    String direccion = request.getParameter("direccion");
    String ciudad = request.getParameter("ciudad");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/academy", "root", "");

        String sql = "UPDATE usuarios SET Nombres=?, Apellidos=?, Edad=?, Email=?, Telefono=?, Direccion=?, Ciudad=? WHERE ID=?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, nombres);
        ps.setString(2, apellidos);
        ps.setInt(3, edad);
        ps.setString(4, email);
        ps.setString(5, telefono);
        ps.setString(6, direccion);
        ps.setString(7, ciudad);
        ps.setInt(8, id);

        int filas = ps.executeUpdate();

        if (filas > 0) {
            out.println("<h2>Usuario actualizado correctamente.</h2><a href='adminUsuarios.jsp'>Volver</a>");
        } else {
            out.println("<h2>No se pudo actualizar el usuario.</h2>");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>

