<%-- 
    Document   : registro
    Created on : 30/06/2025, 5:08:44 p. m.
    Author     : Holger Edud
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h2>Formulario de Registro</h2>
    <form action="previsualizar.jsp" method="post">
        <label>Nombres:</label><br>
        <input type="text" name="nombres" required><br><br>

        <label>Apellidos:</label><br>
        <input type="text" name="apellidos" required><br><br>

        <label>Edad:</label><br>
        <input type="number" name="edad" required><br><br>

        <label>Email:</label><br>
        <input type="email" name="email" required><br><br>

        <label>Teléfono:</label><br>
        <input type="text" name="telefono" required><br><br>

        <label>Dirección:</label><br>
        <input type="text" name="direccion" required><br><br>

        <label>Ciudad:</label><br>
        <input type="text" name="ciudad" required><br><br>

        <label>Contraseña:</label><br>
        <input type="password" name="contrasena" required><br><br>

        <input type="submit" value="Previsualizar Datos">

        <p>¿Ya estás registrado? <a href="login.jsp">Inicia sesión aquí</a></p>
    </form>

    
    </body>
</html>
