<%--
    Document   : index
    Created on : 29-jul-2013, 21:58:59
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="frementop.jspf" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="scripts/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">

        <!-- Icons -->
        <!--[if lt IE 8]>
            <link href="scripts/icons/general/stylesheets/general_foundicons_ie7.css" media="screen" rel="stylesheet" type="text/css" />
            <link href="scripts/icons/social/stylesheets/social_foundicons_ie7.css" media="screen" rel="stylesheet" type="text/css" />
        <![endif]-->
        <!--[if IE 7]>
            <link rel="stylesheet" href="scripts/fontawesome/css/font-awesome-ie7.min.css">
    
        <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
    
        <link href="styles/custom.css" rel="stylesheet" type="text/css" />	-->
    </head>
    <body>
        <div class="container">
            <div>
                <h1>Confirmado</h1>
                <table>

                    <!--          LISTADO     -->
                    <jsp:useBean id="estado2" scope="request" class="BAL.confimado" />

                    <c:set var="list" scope="request" value="${estado2.listado}"/>

                    <display:table name="list" export="true" id="fila"  class="table table-condensed"  >
                        <display:setProperty name="export.rtf.filename" value="example.rtf" />
                        <display:column title="saber">
                            <input type="radio">
                        </display:column>
                        <display:column property="codigo" title="Codigo" />
                        <display:column property="nombre" title="Nombre" />
                        <display:column property="motivo" title="Motivo" />
                        <display:column property="especialidad" title="Especialidad" />
                        <display:column property="medico" title="Mèdico" />
                        <display:column property="hora" title="Hora" />


                        <display:setProperty name="export.pdf" value="true" />

                        <display:column title="Editar">
                            <a href="javascript:enviar()">
                                enviar
                            </a>
                            <input type="BUTTON" value="ENVIAR" POST="SUMIT"/>
                        </display:column>
                    </display:table>





                </table>

            </div>

            <div>
                <h1>Tarde</h1>
                <table>

                    <!--          LISTADO     -->
                    <jsp:useBean id="estado3" scope="request" class="BAL.tarde" />

                    <c:set var="lista" scope="request" value="${estado3.listado}"/>
                    <ajax:displayTag id="displayTagFrame" ajaxFlag="displayAjax">

                        <display:table name="lista" export="true" id="fila" class="table table-condensed">
                            <display:setProperty name="export.rtf.filename" value="example.rtf"/>
                            <display:column title="saber">
                                <input type="radio">
                            </display:column>
                            <display:column property="codigo" title="Codigo" />

                            <display:column property="nombre" title="Nombre" />


                            <display:column property="medico" title="Mèdico" />
                            <display:column title="Editar">
                                <a href="javascript:enviar()">
                                    enviar
                                </a>
                                <input type="BUTTON" value="ENVIAR" POST="SUMIT"/>
                            </display:column>
                        </display:table>
                    </ajax:displayTag>


                </table>

            </div>
            <div class="panel panel-body jumbotron">
                <h1>Espera</h1>
                <table class="table table-bordered">
                    <!--          LISTADO     -->
                    <jsp:useBean id="estado" scope="request" class="BAL.Espera" />
                    <c:set var="lista" scope="request" value="${estado.listado}"/>
                    <ajax:displayTag id="displayTagFrame" ajaxFlag="displayAjax">
                        <display:table name="lista" export="true" id="fila" >
                            <display:setProperty name="export.rtf.filename" value="example.rtf"/>
                            <display:column title="saber" >
                                <input type="radio">
                            </display:column>
                            <display:column property="codigo" title="Codigo" />
                            <display:column property="correocita" title="Correo" />
                            <display:column property="nombre" title="Nombre" />

                            <display:column property="fechasoli" title="Fecha Solicitud" />
                            <display:column property="fecha" title="Fecha" />
                            <display:column property="hora" title="Hora" />
                            <display:column property="estado" title="Estado Cita" />
                            <display:column title="Editar">
                                <form  id="updateCita" method="post" action="actualizarCita.jsp">
                                    <input type="hidden" name="codigoCita" value="${fila.codigo}" >
                                    <input type="submit" class="btn btn-link" value="ENVIAR" POST="SUMIT"/>      
                                </form>
                            </display:column>
                        </display:table>
                    </ajax:displayTag>
                </table>

            </div>

        </div>

    </body>
</html>
