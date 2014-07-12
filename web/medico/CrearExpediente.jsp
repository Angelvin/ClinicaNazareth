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
        <div class="row">
            <div class="col-md-8 col-lg-offset-2 panel panel-default">
                <div class='panel'>
                    <h1>Confirmar creacion de expediente</h1>
                    <%
                        HttpSession sEmpleado = request.getSession();
                        int idcita = (Integer) session.getAttribute("sCitaID");
                        int idPaciente = (Integer) session.getAttribute("sPacienteID");
                        int empleado = (Integer) session.getAttribute("uidLogin");
                        int EmpleadoID = BAL.CitaMedicoCheck.getEmpleadoID(empleado);
                        sEmpleado.setAttribute("sEmpleado", EmpleadoID);
                        //out.println("<br>UID CITA: " + idcita + "<br> UID PAC:" + idPaciente + "<br>IDEMPLEADO: " + EmpleadoID);

                    %>

                    <form method="POST" action="../CrearExpediente">
                        Codigo del Paciente:<input type="text" name="txtPacienteID" class="form-control"  value="<%= idPaciente%>" disabled>
                        Codigo del Empleado:<input type="text" name="txtEmpleadoID" class="form-control"  value="<%= EmpleadoID%>" disabled>
                        <br>
                        <input type="submit" class="btn btn-primary btn-block" value="Crear Expediente">
                        <br>
                        <br>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
