<%-- 
    Document   : logout
    Created on : 30/06/2025, 6:52:58?p. m.
    Author     : Holger Edud
--%>

<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
