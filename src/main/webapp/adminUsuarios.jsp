<%-- 
    Document   : adminUsuarios
    Created on : 1/07/2025, 10:13:58 p. m.
    Author     : Holger Edud
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String buscar = request.getParameter("buscar");
    String accion = request.getParameter("accion");

    if (request.getParameter("ejecutar") != null && buscar != null && !buscar.trim().isEmpty()) {
        if ("ver".equals(accion)) {
            response.sendRedirect("verUsuario.jsp?buscar=" + buscar);
            return;
        } else if ("actualizar".equals(accion)) {
            response.sendRedirect("editarUsuario.jsp?buscar=" + buscar);
            return;
        } else if ("eliminar".equals(accion)) {
            response.sendRedirect("eliminarUsuario.jsp?buscar=" + buscar);
            return;
        } else if ("crear".equals(accion)) {
            response.sendRedirect("registro.jsp");
            return;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Administrar Usuarios</title>
    <style>
        table, th, td {
            border: 1px solid gray;
            border-collapse: collapse;
            padding: 8px;
        }
        table {
            width: 100%;
        }
    </style>
</head>
<body>
    <h2>Panel de Administración de Usuarios</h2>
    
    <form method="get" action="adminUsuarios.jsp">
        <label for="buscar">Buscar por ID, Teléfono o Email:</label>
        <input type="text" name="buscar" id="buscar" required>

        <select name="accion" required>
            <option value="">-- Selecciona una acción --</option>
            <option value="ver">Ver datos</option>
            <option value="actualizar">Actualizar</option>
            <option value="eliminar">Eliminar</option>
            <option value="crear">Crear nuevo</option>
        </select>

        <input type="submit" name="ejecutar" value="Ejecutar">
    </form>

    <h3>Listado completo de usuarios</h3>
    <table>
        <tr>
            <th>ID</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>Email</th>
            <th>Teléfono</th>
        </tr>
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/academy", "root", "");
        ps = conn.prepareStatement("SELECT * FROM usuarios");
        rs = ps.executeQuery();
        while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("ID") %></td>
            <td><%= rs.getString("Nombres") %></td>
            <td><%= rs.getString("Apellidos") %></td>
            <td><%= rs.getString("Email") %></td>
            <td><%= rs.getString("Telefono") %></td>
        </tr>
<% 
        }
    } catch (Exception e) {
        out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
    </table>
</body>
</html>