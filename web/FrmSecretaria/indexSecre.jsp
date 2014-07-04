<%@page import="org.eclipse.persistence.internal.oxm.schema.model.Include"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" session="true" errorPage="../WEB-INF/jspf/ErrorPage.jsp"   %>
<!DOCTYPE HTML>
<%@include file="/WEB-INF/jspf/validar.jspf" %>
<%@include file="../frementop.jspf" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>Clínica Nazareth</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Zaid Archila">
        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../scripts/panelTabs.css" rel="stylesheet" />
        <link href="../styles/custom.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" charset="utf-8" src="../scripts/bootstrap/css/customtabs.js"></script>

    </head>
    <body>
        <div class="container">
            <div class="divPanel notop nobottom">
                <div class="row-fluid">
                    <div class="span12">
                        <!--Edit Site Name and Slogan here-->
                        <div>
                            <a href="index.html" id="divSiteTitle">Clínica Nazareth</a><br />
                            <a href="index.html" id="divTagLine">¡<span class="camera_full_width">Gestión de Administración</span>!</a>
                        </div>
                    </div>
                    <div class="navbar-form navbar-right" role="search">
                        Bienvenida:<b> <c:out  value="${userName}"></c:out>
                                <a class="btn btn-link" href="../cerrarSesion.jsp">Cerra Sesion</a></b>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span12">
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">

                        </div>
                        <div class="panel-body">
                            <div class="container">
                                <div class="row">
                                    <div class="span12">
                                        <ul class="nav nav-tabs">
                                            <li class="active"><a href="#programadas" data-toggle="tab">Citas Programadas</a></li>
                                            <li><a href="#retraso" data-toggle="tab">Retraso</a></li>
                                            <li><a href="#estadosCitas" data-toggle="tab">Estado de Citas</a></li>
                                            <li><a href="#Menu" data-toggle="tab">Menu</a></li>
                                        </ul>

                                        <div class="tab-content">
                                            <div class="tab-pane active" id="programadas">
                                                <div class="panel-body">
                                                    <table>
                                                        <!--          LISTADO     -->
                                                    <jsp:useBean id="estado2" scope="request" class="BAL.confimado" />
                                                    <c:set var="list" scope="request" value="${estado2.listado}"/>
                                                    <display:table name="list" export="true" id="fila"  class="table table-condensed" pagesize="10" >
                                                        <display:setProperty name="export.rtf.filename" value="example.rtf" />
                                                        <display:column property="codigo" title="Codigo" />
                                                        <display:column property="nombre" title="Nombre" />
                                                        <display:column property="motivo" title="Motivo" />
                                                        <display:column property="especialidad" title="Especialidad" />
                                                        <display:column property="medico" title="Mèdico" />
                                                        <display:column property="hora" title="Hora" />
                                                        <display:setProperty name="export.pdf" value="true" />
                                                        <display:column title="Editar">
                                                            <form  id="updateCita" method="post" action="../cConsulta ">
                                                                <input type="hidden" name="codigoCita" value="${fila.codigo}" >
                                                                <input type="submit" name="cmdguardar" class="btn btn-link" value="Consulta" POST="SUMIT"/>
                                                            </form>
                                                        </display:column>
                                                    </display:table>
                                                </table>
                                            </div>

                                        </div><!-- @end #hello -->

                                        <div class="tab-pane" id="retraso">
                                            <div class="panel-body">
                                                <div class="panel-body">
                                                    <table>
                                                        <!--          LISTADO     -->
                                                        <jsp:useBean id="estado3" scope="request" class="BAL.tarde" />

                                                        <c:set var="lista" scope="request" value="${estado3.listado}"/>


                                                        <display:table name="lista" export="true" id="fila" class="table table-condensed" pagesize="10">
                                                            <display:setProperty name="export.rtf.filename" value="example.rtf"/>

                                                            <display:column property="codigo" title="Codigo" />
                                                            <display:column property="nombre" title="Nombre" />
                                                            <display:column property="medico" title="Mèdico" />
                                                            <display:column title="Editar">
                                                                <form  id="updateCita" method="GET" action="../FrmSecretaria/reprogramar.jsp ">
                                                                    <input type="hidden" name="codigoCita" value="${fila.codigo}" >
                                                                    <input type="submit" name="cmdguardar" class="btn btn-link" value="Reprogramar" POST="SUMIT"/>

                                                                </form>
                                                            </display:column>
                                                            <display:column title="Editar">
                                                                <form  id="updateCita" method="post" action="../cConsulta ">
                                                                    <input type="hidden" name="codigoCita" value="${fila.codigo}" >

                                                                    <input type="submit" name="cmdguardar" class="btn btn-link" value="cancelar" POST="SUMIT"/>
                                                                </form>
                                                            </display:column>
                                                        </display:table>

                                                    </table>
                                                </div>
                                            </div>
                                        </div><!-- @end #empty -->

                                        <div class="tab-pane" id="estadosCitas">
                                            <div class="panel-body"
                                                 <table class="table table-bordered">
                                                    <!--          LISTADO     -->
                                                    <jsp:useBean id="estado" scope="request" class="BAL.Espera" />
                                                    <c:set var="lista" scope="request" value="${estado.listado}"/>

                                                    <display:table name="lista" export="true" id="fila"pagesize="10" class="table table-condensed" >
                                                        <display:setProperty name="export.rtf.filename" value="example.rtf"/>
                                                        <display:column property="codigo" title="Codigo" />
                                                        <display:column property="correocita" title="Correo" />
                                                        <display:column property="nombre" title="Nombre" />
                                                        <display:column property="fechasoli" title="Fecha Solicitud" />
                                                        <display:column property="fecha" title="Fecha" />
                                                        <display:column property="hora" title="Hora" />
                                                        <display:column property="estado" title="Estado Cita" />
                                                        <display:column title="Editar">
                                                            <form  id="updateCita" method="post" action="../cConsulta ">
                                                                <input type="hidden" name="codigoCita" value="${fila.codigo}" >
                                                                <input type="submit" name="cmdguardar" class="btn btn-link" value="Confirmar" POST="SUMIT"/>
                                                                <input type="submit" name="cmdguardar" class="btn btn-link" value="cancelar" POST="SUMIT"/>
                                                            </form>
                                                        </display:column>
                                                    </display:table>

                                                </table>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="Menu">
                                            <h3>Selecciones una opciòn</h3>
                                            <ul class="list-group">


                                                <li class="list-group-item"><span class="glyphicon glyphicon-user"></span><a href="../FrmSecretaria/RegistroP.jsp">Creacion Paciente</a></li>
                                                <li class="list-group-item"><span class="glyphicon glyphicon-search"></span><a href="../FrmSecretaria/BusquedaPaciente.jsp">Busqueda de Paciente</a></li>
                                                <li class="list-group-item"><span class="glyphicon glyphicon-search"></span><a href="../FrmSecretaria/BusquedaMedico.jsp">Medico</a></li>
                                                <li class="list-group-item"><span class="glyphicon glyphicon-list-alt"></span><a href="../FrmSecretaria/agendaSecre.jsp">Agenda</a></li>
                                                <li class="list-group-item"><span class="glyphicon glyphicon-shopping-cart"></span><a href="../FrmSecretaria/Ingreso.jsp">Adquisicion</a></li>
                                                <li class="list-group-item"><span class="glyphicon glyphicon-usd"></span><a href="../FrmSecretaria/factura.jsp">Facturacion</a></li>

                                            </ul>
                                        </div><!-- @end .tab-content -->

                                    </div><!-- @end .span12 -->
                                </div><!-- @end .row -->
                            </div><!-- @end .container -->


                        </div>
                    </div>
                </div>


            </div>
            <div id="footerOuterSeparator"></div>



            <br /><br /><br />
            <script src="../scripts/jquery.min.js" type="text/javascript"></script>
            <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
            <script src="../scripts/default.js" type="text/javascript"></script>
            <script src="../scripts/modernizr.js" type="text/javascript"></script>

    </body>
</html>