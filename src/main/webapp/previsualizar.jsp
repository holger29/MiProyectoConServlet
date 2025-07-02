<%-- 
    Document   : previsualizar.jsp
    Created on : 30/06/2025, 5:48:51 p. m.
    Author     : Holger Edud
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombres = request.getParameter("nombres");
    String apellidos = request.getParameter("apellidos");
    String edad = request.getParameter("edad");
    String email = request.getParameter("email");
    String telefono = request.getParameter("telefono");
    String direccion = request.getParameter("direccion");
    String ciudad = request.getParameter("ciudad");
    String contrasena = request.getParameter("contrasena");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <title>Previsualización</title>
</head>
<body>
    <h2>Confirme sus datos antes de registrar:</h2>
    <ul>
        <li><strong>Nombres:</strong> <%= nombres %></li>
        <li><strong>Apellidos:</strong> <%= apellidos %></li>
        <li><strong>Edad:</strong> <%= edad %></li>
        <li><strong>Email:</strong> <%= email %></li>
        <li><strong>Teléfono:</strong> <%= telefono %></li>
        <li><strong>Dirección:</strong> <%= direccion %></li>
        <li><strong>Ciudad:</strong> <%= ciudad %></li>
    </ul>

    <form action="procesarRegistro.jsp" method="post">
        <input type="hidden" name="nombres" value="<%= nombres %>">
        <input type="hidden" name="apellidos" value="<%= apellidos %>">
        <input type="hidden" name="edad" value="<%= edad %>">
        <input type="hidden" name="email" value="<%= email %>">
        <input type="hidden" name="telefono" value="<%= telefono %>">
        <input type="hidden" name="direccion" value="<%= direccion %>">
        <input type="hidden" name="ciudad" value="<%= ciudad %>">
        <input type="hidden" name="contrasena" value="<%= contrasena %>">
        <input type="submit" value="Confirmar y Registrar">
        <p><a href="registro.jsp">Volver al formulario</a></p>
    </form>
</body>
</html>
