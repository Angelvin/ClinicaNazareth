<%--
    Document   : CrearExpediente
    Created on : 11-jul-2014, 11:59:50
    Author     : daMgeL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Expediente</title>
        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <style>
            body{background-color: #eee6ff;padding: 10px;}
            .container{background-color: #ffffff;border: solid 2px darkgrey;display: block;margin:auto;padding: 20px;width: 90%;}
        </style>
    </head>
    <body>
        <div class="container">
            <div class="panel panel-primary">
                <div class="col-md-8">
                    <%
                        int idcita = (Integer) session.getAttribute("sCitaID");
                        int idPaciente = (Integer) session.getAttribute("sPacienteID");
                        out.println("UID CITA: " + idcita + " UID PAC:" + idPaciente);
                    %>
                    <form action="#">
                        <input type="text" class="form-control">
                        <input type="text" class="form-control">
                        <input type="text" class="form-control">
                        <input type="text" class="form-control">
                        <br>
                        <input type="submit" class="btn btn-primary" value="Crear Expediente">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
