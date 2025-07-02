<%-- 
    Document   : eliminarUsuario
    Created on : 1/07/2025, 11:56:29 p. m.
    Author     : Holger Edud
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String buscar = request.getParameter("buscar");
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    boolean encontrado = false;
    String nombres = "", apellidos = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/academy", "root", "");

        // Primero verificamos si el usuario existe
        String sqlVerificar = "SELECT Nombres, Apellidos FROM usuarios WHERE ID = ? OR Telefono = ? OR Email = ?";
        ps = conn.prepareStatement(sqlVerificar);
        ps.setString(1, buscar);
        ps.setString(2, buscar);
        ps.setString(3, buscar);
        rs = ps.executeQuery();

        if (rs.next()) {
            encontrado = true;
            nombres = rs.getString("Nombres");
            apellidos = rs.getString("Apellidos");
        }
        rs.close();
        ps.close();

        if (encontrado) {
            // Eliminar usuario
            String sqlEliminar = "DELETE FROM usuarios WHERE ID = ? OR Telefono = ? OR Email = ?";
            ps = conn.prepareStatement(sqlEliminar);
            ps.setString(1, buscar);
            ps.setString(2, buscar);
            ps.setString(3, buscar);

            int filas = ps.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Usuario Eliminado</title>
</head>
<body>
    <h2>El usuario <%= nombres %> <%= apellidos %> ha sido eliminado correctamente.</h2>
    <a href="adminUsuarios.jsp">Volver a administración</a>
</body>
</html>
<%
        } else {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Usuario no encontrado</title>
</head>
<body>
    <h2>No se encontró un usuario con el dato proporcionado.</h2>
    <a href="adminUsuarios.jsp">Volver</a>
</body>
</html>
<%
        }
    } catch (Exception e) {
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Error</title></head>
<body>
    <h2>Error: <%= e.getMessage() %></h2>
    <a href="adminUsuarios.jsp">Volver</a>
</body>
</html>
<%
    } finally {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>