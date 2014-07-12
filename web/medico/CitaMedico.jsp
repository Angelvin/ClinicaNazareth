<%--
    Document   : CitaMedico
    Created on : 02-jul-2014, 10:54:57
    Author     : daMgeL
--%>

<%@page import="BAL.CitaMedicoCheck"%>
<%@page import="SERVLET.Smedico"%>
<%@page import="org.eclipse.persistence.internal.oxm.schema.model.Include"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../frementop.jspf" %>
<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <title>Clinica Nazareth</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Angel">
        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../styles/custom.css" rel="stylesheet" type="text/css" />
        <style>
            .btn-link{font-size: 18px;font-weight: bold;}
        </style>
    </head>
    <body>
        <br>
        <div  class="container">
            <div class="divPanel notop nobottom">
                <div class="row-fluid">
                    <div class="span12">
                        <!--Edit Site Name and Slogan here-->
                        <div id="divLogo">
                            <a href="indexmedico.jsp" id="divSiteTitle">Clinica Nazareth</a><br />
                        </div>
                        <a href="indexmedico.jsp" id="divTagLine"><span class=" glyphicon glyphicon-home"> Ir a inicio</span>!</a>

                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-12">

                <div class="panel panel-primary">
                    <div class="panel-heading">
                    </div>
                    <div class="panel-body">
                        <table>



                            <jsp:useBean id="estado2" scope="request" class="BAL.Bcitamedico" />
                            <c:set var="list" scope="request" value="${estado2.getlistado(uidPaciente)}" />
                            <display:table name="list" export="true" id="fila" class="table table-condensed">
                                <display:setProperty name="export.rtf.filename" value="example.rtf" />
                                <display:column property="idcita" title="Codigo Cita" />
                                <display:column property="codipaciente" title="Codigo Paciente" />
                                <display:column property="motivo" title="Motivo" />
                                <display:column property="horario" title="Horario" />
                                <display:column property="paciente" title="Paciente" />
                                <display:column property="medico" title="Medico" />
                                <display:setProperty name="export.pdf" value="true" />
                                <display:column title="Acción">

                                    <c:if test="${BAL.CitaMedicoCheck.getExpediente(fila.codipaciente) == 0}">
                                        <html:link action="/exceptionScoreCardGrandReport.do?zone=${fila.idcita}">
                                            <b>TIENE ${fila.codipaciente}</b>
                                        </html:link>
                                    </c:if>
                                    <form id="updateCita" method="GET" action="../medico/datosPre.jsp ">
                                        <input type="hidden" name="codigoCita" value="${fila.idcita}">
                                        <input type="hidden" name="codigoPac" value="${fila.codipaciente}">
                                        <input type="submit" name="action" class="btn btn-link" value="Ir a Consulta" POST="SUMIT" />
                                    </form>
                                </display:column>
                            </display:table>
                        </table>
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
                            Copyright Â© 2014 Clinica Nazareth. All Rights Reserved.
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