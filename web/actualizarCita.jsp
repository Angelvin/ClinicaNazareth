<%-- 
    Document   : actualizarCita
    Created on : 24-jun-2014, 12:12:05
    Author     : daMgeL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1> Mi UID melefico es:
            <%= request.getParameter("codigoCita") %>
        </h1>
    </body>
</html>
