<%@include file="../frementop.jspf" %>


<%-- 
    Document   : BusquedaPacienteMedico
    Created on : Jul 9, 2014, 9:00:22 AM
    Author     : Cesar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Clínica Nazareth</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Cesar Cordova">
        <link href="../scripts/bootstrap/css/bootstrap.css" rel="stylesheet">
        <link href="../styles/custom.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="container panel panel-default">
            <div class="divPanel notop nobottom">
                <div class="row-fluid">
                    <div class="span12">
                        <!--Edit Site Name and Slogan here-->
                        <div> <a href="index.jsp" id="divSiteTitle">Clínica Nazareth</a>
                            <br /> <a href="index.jsp" id="divTagLine">¡<span class="camera_full_width">Búsqueda de Paciente</span>!</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <jsp:include page="Bienvenida.jsp"></jsp:include>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Pacientes Existentes
                        </div>
                        <div class="panel-body">
                            <div>

                                <div>
                                    <table>
                                    <jsp:useBean id="estado2" scope="request" class="BAL.Bcitamedico" />
                                    <c:set var="list" scope="request" value="${estado2.getlistado(2)}" />
                                    <display:table name="list" export="true" id="fila" class="table table-condensed" pagesize="10">
                                        <display:setProperty name="export.rtf.filename" value="example.rtf" />
                                        <display:column property="idcita" title="Codigo" />
                                        <display:column property="motivo" title="Motivo" />
                                        <display:column property="horario" title="Horario" />
                                        <display:column property="paciente" title="Paciente" />
                                        <display:column property="medico" title="Medico" />
                                        <display:setProperty name="export.pdf" value="true" />
                                        <display:column title="Acción">
                                            <form id="updateCita" method="GET" action="../medico/datosPre.jsp ">
                                                <input type="hidden" name="codigo" value="${fila.idcita}">
                                                <input type="submit" name="action" class="btn btn-link" value="A consulta" POST="SUMIT" />
                                            </form>
                                        </display:column>
                                    </display:table>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="footerOuterSeparator"></div>
        <div id="divFooter" class="footerArea shadow">
            <div class="divPanel">
                <br />
                <br />
                <div class="row-fluid">
                    <div class="span12">
                        <p class="copyright">Copyright © 2014 Clinica Nazareth. All Rights Reserved.</p>
                        <div class="social_bookmarks"></div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <link href="../scripts/bootstrap/css/contenido.css" rel="stylesheet">
        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
