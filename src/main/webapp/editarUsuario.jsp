<%-- 
    Document   : editarUsuario
    Created on : 1/07/2025, 11:16:22 p. m.
    Author     : Holger Edud
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String buscar = request.getParameter("buscar");
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String mensajeError = "";

    String nombres = "", apellidos = "", email = "", telefono = "", direccion = "", ciudad = "";
    int edad = 0, id = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/academy", "root", "");

        String sql = "SELECT * FROM usuarios WHERE ID = ? OR Telefono = ? OR Email = ?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, buscar);
        ps.setString(2, buscar);
        ps.setString(3, buscar);
        rs = ps.executeQuery();

        if (rs.next()) {
            id = rs.getInt("ID");
            nombres = rs.getString("Nombres");
            apellidos = rs.getString("Apellidos");
            edad = rs.getInt("Edad");
            email = rs.getString("Email");
            telefono = rs.getString("Telefono");
            direccion = rs.getString("Direccion");
            ciudad = rs.getString("Ciudad");
        } else {
            mensajeError = "Usuario no encontrado.";
        }
    } catch (Exception e) {
        mensajeError = "Error: " + e.getMessage();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Actualizar Usuario</title>
</head>
<body>
    <h2>Actualizar Datos del Usuario</h2>

    <% if (!mensajeError.isEmpty()) { %>
        <p style="color: red;"><%= mensajeError %></p>
    <% } else { %>
        <form action="procesarActualizar.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            
            <label>Nombres:</label><br>
            <input type="text" name="nombres" value="<%= nombres %>" required><br><br>

            <label>Apellidos:</label><br>
            <input type="text" name="apellidos" value="<%= apellidos %>" required><br><br>

            <label>Edad:</label><br>
            <input type="number" name="edad" value="<%= edad %>" required><br><br>

            <label>Email:</label><br>
            <input type="email" name="email" value="<%= email %>" required><br><br>

            <label>Teléfono:</label><br>
            <input type="text" name="telefono" value="<%= telefono %>" required><br><br>

            <label>Dirección:</label><br>
            <input type="text" name="direccion" value="<%= direccion %>" required><br><br>

            <label>Ciudad:</label><br>
            <input type="text" name="ciudad" value="<%= ciudad %>" required><br><br>

            <input type="submit" value="Actualizar">
        </form>
    <% } %>
</body>
</html>
