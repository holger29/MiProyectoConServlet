<%-- 
    Document   : procesarLogin.jsp
    Created on : 30/06/2025, 6:49:45?p. m.
    Author     : Holger Edud
--%>

<%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String contrasena = request.getParameter("contrasena");

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/academy", "root", "");

        String sql = "SELECT * FROM usuarios WHERE Email=? AND Contraseña=?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, contrasena);
        rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("usuario", rs.getString("Nombres") + " " + rs.getString("Apellidos"));
            response.sendRedirect("bienvenido.jsp");
        } else {
            out.println("<h2>Error: Usuario o contraseña incorrecta</h2><a href='login.jsp'>Intentar nuevamente</a>");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
