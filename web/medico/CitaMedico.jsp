<%--
    Document   : CitaMedico
    Created on : 02-jul-2014, 10:54:57
    Author     : daMgeL
--%>

<%@page import="org.eclipse.persistence.internal.oxm.schema.model.Include"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body id="pageBody">

        <div id="divBoxed" class="container">

            <div class="transparent-bg" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: -1;zoom: 1;"></div>

            <div class="divPanel notop nobottom">
                <div class="row-fluid">
                    <div class="span12">


                        <!--Edit Site Name and Slogan here-->
                        <div id="divLogo">
                            <a href="index.html" id="divSiteTitle">Clinica Nazareth</a><br />
                            <a href="index.html" id="divTagLine">Â¡<span class="camera_full_width">Consulta</span>!</a>
                        </div>

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
                            <display:table name="list" export="true" id="fila" class="table table-condensed" pagesize="10">
                                <display:setProperty name="export.rtf.filename" value="example.rtf" />
                                <display:column property="idcita" title="Codigo" />
                                <display:column property="codipaciente" title="Codigopaciente" />
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
                            <%
                                out.println("EL UID MALEFICO: " + request.getParameter("codigo"));

                            %>
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