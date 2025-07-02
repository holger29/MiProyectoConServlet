<%-- 
    Document   : login
    Created on : 30/06/2025, 5:15:08 p. m.
    Author     : Holger Edud
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de sesión</title>
    </head>
    <body>
        <h2>Iniciar Sesión</h2>
    <form action="procesarLogin.jsp" method="post">
        <label for="email">Correo Electrónico:</label><br>
        <input type="email" id="email" name="email" required><br><br>

        <label for="contrasena">Contraseña:</label><br>
        <input type="password" id="contrasena" name="contrasena" required><br><br>

        <input type="submit" value="Iniciar Sesión">
        <p>¿No está registrado? <a href="registro.jsp">Registrese aquí</a></p>
    </form>
    </body>
</html>
