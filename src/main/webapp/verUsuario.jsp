<%-- 
    Document   : verUsuario
    Created on : 1/07/2025, 10:33:52 p. m.
    Author     : Holger Edud
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalles del Usuario</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f8f8f8;
        }
        h2 {
            text-align: center;
        }
        .datos {
            max-width: 500px;
            margin: auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }
        .datos p {
            font-size: 16px;
            margin-bottom: 10px;
        }
        .volver {
            text-align: center;
            margin-top: 20px;
        }
        .volver a {
            text-decoration: none;
            color: #007BFF;
        }
    </style>
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalles del Usuario</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f8f8f8;
        }
        h2 {
            text-align: center;
        }
        .datos {
            max-width: 500px;
            margin: auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }
        .datos p {
            font-size: 16px;
            margin-bottom: 10px;
        }
        .volver {
            text-align: center;
            margin-top: 20px;
        }
        .volver a {
            text-decoration: none;
            color: #007BFF;
        }
    </style>
</head>
<body>

<%
    String buscar = request.getParameter("buscar");
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

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
%>
    <h2>Datos del Usuario</h2>
    <div class="datos">
        <p><strong>ID:</strong> <%= rs.getInt("ID") %></p>
        <p><strong>Nombres:</strong> <%= rs.getString("Nombres") %></p>
        <p><strong>Apellidos:</strong> <%= rs.getString("Apellidos") %></p>
        <p><strong>Edad:</strong> <%= rs.getInt("Edad") %></p>
        <p><strong>Email:</strong> <%= rs.getString("Email") %></p>
        <p><strong>Teléfono:</strong> <%= rs.getString("Telefono") %></p>
        <p><strong>Dirección:</strong> <%= rs.getString("Direccion") %></p>
        <p><strong>Ciudad:</strong> <%= rs.getString("Ciudad") %></p>
    </div>
    <div class="volver">
        <a href="adminUsuarios.jsp">← Volver a la administración</a>
    </div>
<%
        } else {
            out.println("<h3 style='text-align:center;'>Usuario no encontrado.</h3>");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>

</body>
</html>
