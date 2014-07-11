<!DOCTYPE HTML>


<html>
    <head>
        <meta charset="utf-8">
        <title>Clinica Nazareth</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Zaid Archila">
        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <link href="../styles/custom.css" rel="stylesheet" type="text/css" />


    </head>
    <body id="pageBody">

        <div id="divBoxed" class="container">

            <div class="divPanel notop nobottom">
                <div class="row-fluid">
                    <div class="span12">


                        <!--Edit Site Name and Slogan here-->
                        <div id="divLogo">
                            <a href="index.html" id="divSiteTitle">Clinica Nazareth</a><br />
                            <a href="index.html" id="divTagLine">¡<span class="camera_full_width">Consulta</span>!</a>
                        </div>

                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                    </div>
                </div>
            </div>
            <!--DENTRO DE ESTE DIV CREAR EL FROMULARIO FAVOR NO UTILZAR
                TABLAS YA QUE EL FROMULARIO SE AJUSTA AL ESPACIO PARA QUE
                PUEDA VERSE EN CUALQUEIR TAMAÃ‘O
            -->



            <div class="col-xs-12 col-sm-6 col-md-12">

                <div class="panel panel-primary">
                    <%
                        int idcita = Integer.parseInt(request.getParameter("codigoCita"));
                        int idPaciente = Integer.parseInt(request.getParameter("codigoPac"));

                        int idExpediente = BAL.CitaMedicoCheck.getExpediente(idPaciente);
                        if (idExpediente > 0)
                        {
                            out.println("EL EXPEDIENTE:" + idExpediente);
                        } else
                        {
                            out.println("Este paciente no posee expediente <a class='btn btn-primary' href='CrearExpedienre.jsp'>Clic para crear EXPEDIENTE</a><br>");
                        }
                        out.println("UID CITA: " + idcita + " UID PAC:" + idPaciente);

                    %>

                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">


                    </div>
                    <div class="panel-body">

                        <div class="panel panel-default">
                            <div class="panel-body">
                                <form method="post" action="../s???">
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
                            <div class="col-md-4"></div>
                            <div class="col-md-4"><input name="cmdguardar"  class="btn btn-lg btn-primary" disabled="disabled" type="submit" id="cmdguardar" value="Guardar"></div>
                            <div class="col-md-4"></div>
                        </div>



                        </form>
                    </div>


                </div>
            </div>
        </div>

        <div id="footerOuterSeparator"></div>

        <div id="divFooter" class="footerArea shadow">

            <div class="divPanel"><br /><br />
                <div class="row-fluid">
                    <div class="span12">
                        <p class="copyright">
                            Copyright © 2014 Clinica Nazareth. All Rights Reserved.
                        </p>

                        <div class="social_bookmarks"></div>
                    </div>
                </div>

            </div>
        </div>

        <br /><br /><br />

        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>