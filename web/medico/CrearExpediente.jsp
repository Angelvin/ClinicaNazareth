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
            .btn{font-size:30px;height:60px;width:50%}.form-control{font-size:1.6em; height: 50px;}
        </style>
    </head>
    <body>
        <div class="container">
            <div class="panel panel-primary">
                <div class="panel panel-body">

                    <div class="col-md-8 col-lg-offset-2">
                        <h1>Confirmacion para la creacion de expedinte</h1>
                        <%
                            int idcita = (Integer) session.getAttribute("sCitaID");
                            int idPaciente = (Integer) session.getAttribute("sPacienteID");
                            int empleado = (Integer) session.getAttribute("uidLogin");
                            int EmpleadoID = BAL.CitaMedicoCheck.getEmpleadoID(empleado);
                            //out.println("<br>UID CITA: " + idcita + "<br> UID PAC:" + idPaciente + "<br>IDEMPLEADO: " + EmpleadoID);

                        %>

                        <form action="../CrearExpediente">
                            Codigo del Paciente:<input type="text" class="form-control" name="txtPacienteID" value="<%= idPaciente%>" disabled>
                            Codigo del Empleado:<input type="text" class="form-control" name="txtEmpleadoID" value="<%= EmpleadoID%>" disabled>
                            <br>
                            <input type="submit" class="btn btn-primary btn-block" value="Crear Expediente">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
