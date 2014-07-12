<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <title>Clinica Nazareth</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Zaid Archila">
        <link href="../styles/custom.css" rel="stylesheet" type="text/css" />
        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body >
        <br>
        <div class="container">
            <div class="divPanel notop nobottom">
                <div class="row-fluid">
                    <div class="span12">
                        <!--Edit Site Name and Slogan here-->
                        <div id="divLogo">
                            <a href="indexmedico.jsp" id="divSiteTitle">Clinica Nazareth</a><br />
                            <a href="indexmedico.jsp" id="divTagLine">¡<span class="glyphicon glyphicon-home">Ir a inicio</span>!</a>
                        </div>
                        <hr>
                    </div>
                </div>
            </div>
            <div class="panel" style="width: 90%; margin:auto;">
                <div clas="row">
                    <%
                        int idcita = Integer.parseInt(request.getParameter("codigoCita"));
                        int idPaciente = Integer.parseInt(request.getParameter("codigoPac"));

                        HttpSession sCitaID = request.getSession();
                        sCitaID.setAttribute("sCitaID", idcita);

                        HttpSession sPacienteID = request.getSession();
                        sPacienteID.setAttribute("sPacienteID", idPaciente);

                        int idExpediente = BAL.CitaMedicoCheck.getExpediente(idPaciente);
                        if (idExpediente != 0)
                        {
                            out.println("<h3>Expediente No.: <b>" + idExpediente + "</b></h3>");
                        } else
                        {
                            //out.println("<h4 class=' well well-sm'> Codigo Cita: " + idcita + " Codigo Paciente:" + idPaciente + "</h4>");
                            out.println("<h4><div class='alert alert-danger'>Este paciente no posee expediente <a class='btn btn-link btn-lg' href='CrearExpediente.jsp'>Crear Expediente</a></div></h4>");
                        }

                    %>
                </div>
            </div>
            <br>
            <div class="col-md-8 col-lg-offset-2">
                <div class="panel panel-primary">
                    <div class="panel-heading">


                    </div>
                    <div class="panel-body">
                        <form method="GET" action="../srvConsulta">
                            <div class="panel panel-default">
                                <div class="panel-body">

                                    <div class="row">
                                        <div class="col-md-6"><label>Peso</label><input name="txtpeso" id="txtpeso" class="form-control"  placeholder="en numero"  required></div>
                                        <div class="col-md-6"><label>Temperatura</label><input name="txttemperatura" id="txttemperatura" class="form-control"  placeholder="en numero" pattern="[a-z]" required></div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6"><label>Tension Arterial</label><input name="txttensionarterial" id="txttensionarterial" class="form-control"  placeholder="en numero " pattern="[a-z]" required></div>
                                        <div class="col-md-6"><label>Causa de Cosulta</label><textarea name="txtconsultapor" id="txtconsultapor" placeholder="texto" placeholder="motivos  "  class="form-control" rows="3"></textarea></div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6"><label>Pulso</label><input name="txtpulso" id="txtpulso" class="form-control"  placeholder="en numero" pattern="[a-z]" required></div>
                                        <div class="col-md-6"><label>Tipo Consulta</label><input name="txttipoconsulta" id="txttipoconsulta" class="form-control"  placeholder="texto" pattern="[a-z]" required></div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6"><label>Examenes</label><input name="txtexamen" id="txtexamen" class="form-control"  placeholder="examenes recomendados" pattern="[a-z]" required></div>
                                        <div class="col-md-6"><label>Sintomas </label><textarea name="txtsintomas" id="txtsintomas" placeholder="texto" class="form-control" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-8 col-lg-offset-2">
                                    <%                                        //
                                        if (idExpediente != 0)
                                        {
                                            out.println("<input type='submit' id='cmdguardar' name='cmdguardar' value='Guardar Consulta' class='btn btn-lg btn-primary'>");

                                        } else
                                        {
                                            out.println("<h3 class='alert alert-danger'>No puedes crear una consulta si no existe expediente</h3>");
                                        }

                                    %>

                                </div>
                            </div>
                        </form>
                    </div>


                </div>
            </div>
        </div>
        <hr>
        <div id="divFooter" class="footerArea shadow">
            <div class="divPanel"><br /><br />
                <div class="row-fluid">
                    <div class="span12">
                        <p class="copyright">
                            Copyright © 2014 Clinica Nazareth. All Rights Reserved.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <br />
    </body>
</html>