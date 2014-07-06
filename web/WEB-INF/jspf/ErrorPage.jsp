<%--
    Document   : error
    Created on : 05-jul-2014, 18:38:15
    Author     : daMgeL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acceso Denegado</title>
        <link href="../scripts/bootstrap/css/bootstrap.css" rel="stylesheet">
        <style>
            body{background-color: #eee6ff;padding: 10px;}
            .container{background-color: #ffffff;border: solid 2px darkgrey;display: block;margin:auto;padding: 20px;width: 90%;}
            .alert-danger{padding: 25px;}
        </style>
    </head>
    <body>
        <div class="container">
            <div class="alert-danger">
                <h1>Ups parece que no tienes permisos para estar aqui!</h1>
                <h2><a href="../Acceso.jsp">Clic para ir a Acceso</a></h2>
            </div>
        </div>
    </body>
</html>
