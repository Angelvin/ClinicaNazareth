<%--
    Document   : Paciente
    Created on : 02-jul-2014, 10:54:57
    Author     : daMgeL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../frementop.jspf" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../scripts/bootstrap/css/bootstrap.css" rel="stylesheet">
        <link href="../scripts/bootstrap/css/contenido.css" rel="stylesheet">
        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <title>Bienvenido Paciente</title>
        <style>
            body{background-color: #eee6ff;}
            .container{background-color: #ffffff;border: solid 2px darkgrey;border-radius: 4px;display: block;margin:auto;padding: 20px;width: 90%;}
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-md-2">
                        <div class="lista-enlaces">
                            <ul id="myTab">
                                <li class="active"><a href="#NuevaCita">Nueva Cita</a></li>
                                <li class=""><a href="#Ofertas">Ver Historial Medico</a></li>
                                <li class=""><a href="#OfertasPublicadas">Inform Personal</a></li>
                                <li class=""><a href="#Aplicacion">Gestionar Parientes</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="tab-content">
                            <div class="tab-pane active" id="NuevaCita">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">NuevaCita</div>
                                    <div class="panel-body">
                                        <table>
                                        <jsp:useBean id="pacientes" scope="request" class="BAL.PacienteController" />
                                        <c:set var="lista" scope="request" value="${pacientes.listado}"/>
                                        <display:table name="lista" export="true" id="fila"  class="table table-condensed"  >
                                            <display:setProperty name="export.rtf.filename" value="example.rtf" />

                                            <display:column property="idCita" title="UID" />
                                            <display:column property="motivo" title="Motivo" />
                                            <display:column property="estadoCita" title="Estado cita" />

                                            <display:setProperty name="export.pdf" value="true" />
                                            <display:column title="Editar">
                                                <form  id="updateCita" method="post" action="../FrmSecretaria/editPaciente.jsp ">
                                                    <input type="text" name="codigo" class="form-cotrol" value="${fila.idCita}" >
                                                    <input type="submit" name="cmdguardar" class="btn btn-link" value="Modificar" POST="SUMIT"/>
                                                </form>
                                            </display:column>
                                        </display:table>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="Ofertas">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Publicar Ofertas</div>
                                <div class="panel-body">

                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="Aplicacion">
                            <div class="panel panel-primary">
                                <div class="panel-heading">APLICACIONES</div>
                                <div class="panel-body">
                                    <div class="col-md-12">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane active" id="OfertasPublicadas">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
