<%-- 
    Document   : bienvenido.jsp
    Created on : 30/06/2025, 6:51:20 p. m.
    Author     : Holger Edud
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bienvenido</title>
    <style>
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f0f0f0;
            padding: 10px;
        }
        .perfil {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .perfil img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
        }
        .cerrar {
            margin-left: 20px;
        }
    </style>
</head>
<body>
    <div class="top-bar">
        <div class="cerrar">
            <a href="logout.jsp">Cerrar sesión</a>
        </div>
        <div class="perfil">
            <span><%= usuario %></span>
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="perfil">
        </div>
    </div>

    <h2>Señor(a) <%= usuario %>, usted se ha logueado satisfactoriamente.</h2>
</body>
</html>
