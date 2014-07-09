<%@include file="../frementop.jspf" %>
<%@include file="/WEB-INF/jspf/validar.jspf" %>
<%@page language="java" session="true" errorPage="../WEB-INF/jspf/ErrorPage.jsp" %>
<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <title>Cl�nica Nazareth</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Zaid Archila">
        <link href="../scripts/bootstrap/css/bootstrap.css" rel="stylesheet">
        <link href="../styles/custom.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <div class="container panel panel-default">
            <div class="divPanel notop nobottom">
                <div class="row-fluid">
                    <div class="span12">
                        <!--Edit Site Name and Slogan here-->
                        <div> <a href="index.jsp" id="divSiteTitle">Cl�nica Nazareth</a>
                            <br /> <a href="index.jsp" id="divTagLine">�<span class="camera_full_width">B�squeda de Paciente</span>!</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <jsp:include page="menu.jsp"></jsp:include>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Pacientes Existentes
                        </div>
                        <div class="panel-body">
                            <div>
                                <form name="form1" method="post" action="../SBusqueda">
                                    <div>
                                        <table>
                                        <jsp:useBean id="estado2" scope="request" class="BAL.cbusqueda" />
                                        <c:set var="list" scope="request" value="${estado2.listado}" />
                                        <display:table name="list" export="true" id="fila" class="table table-condensed" pagesize="10">
                                            <display:setProperty name="export.rtf.filename" value="example.rtf" />
                                            <display:column property="codigo" title="Codigo" />
                                            <display:column property="nombre" title="Nombre" />
                                            <display:column property="apellido" title="Apellido" />
                                            <display:setProperty name="export.pdf" value="true" />
                                            <display:column title="Editar">
                                                <form id="editPaciente" method="GET" action="../FrmSecretaria/editPaciente.jsp ">
                                                    <input type="hidden" name="codigo" value="${fila.codigo}">
                                                    <input type="hidden" name="cmdEdit" class="btn btn-link" value="Modificar" POST="SUMIT" />
                                                </form>
                                                <form id="updateCita" method="GET" action="../FrmSecretaria/editPaciente.jsp?">
                                                    <input type="hidden" name="codigo" value="${fila.codigo}">
                                                    <input type="submit" name="action" class="btn btn-link" value="EditarPaciente" POST="SUMIT" />
                                                </form>
                                                <form id="updateCita" method="GET" action="../FrmSecretaria/Agpaciente.jsp ">
                                                    <input type="hidden" name="codigo" value="${fila.codigo}">
                                                    <input type="submit" name="action" class="btn btn-link" value="Crear Cita" POST="SUMIT" />
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
                        <p class="copyright">Copyright � 2014 Clinica Nazareth. All Rights Reserved.</p>
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