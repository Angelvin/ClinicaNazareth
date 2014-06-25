<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
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
    </style>
</head>
<body>
    <div id="divBoxed" class="container">

        <div class="divPanel notop nobottom">
            <div class="row-fluid">
                <div class="span12">  
                    <!--Edit Site Name and Slogan here-->
                    <div>
                        <a href="index.html" id="divSiteTitle">Clínica Nazareth</a><br />
                        <a href="index.html" id="divTagLine">¡<span class="camera_full_width">Gestión de Administración</span>!</a>

                    </div>

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
                    <div class="row">
                        <div class="col-xs-12 col-md-8"><h2 class="panel-title">Bienvenida Secretaria: Lucía</h2></div>
                        <div class="col-xs-6 col-md-4">
                            <ul class="pager">

                                <li class="next"><a href="../sistema/login.jsp">Salir <span class="glyphicon glyphicon-off"></span></a></li>

                                <li class="next"><a href="../FrmSecretaria/Entrada.jsp">Menu <span class="glyphicon glyphicon-tasks"></span></a></li>
                                <li class="next"></li>

                            </ul>


                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-folder-close">
                                                    </span>Citas Programadas</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <div class="panel-body">

                                                <table>

                                                    <!--          LISTADO     -->
                                                    <jsp:useBean id="estado2" scope="request" class="BAL.confimado" />

                                                    <c:set var="list" scope="request" value="${estado2.listado}"/>

                                                    <display:table name="list" export="true" id="fila"  class="table table-condensed"  >
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

                                            <div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-th">
                                                    </span>Cita en Retraso</a>
                                            </h4>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse">
                                            <div class="panel-body">


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
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="glyphicon glyphicon-user">
                                                    </span>Estado de Cita</a>
                                            </h4>
                                        </div>
                                        <div id="collapseThree" class="panel-collapse collapse">
                                            <div class="panel-body">

                                                <table class="table table-bordered">
                                                    <!--          LISTADO     -->
                                                    <jsp:useBean id="estado" scope="request" class="BAL.Espera" />
                                                    <c:set var="lista" scope="request" value="${estado.listado}"/>
                                                    <ajax:displayTag id="displayTagFrame" ajaxFlag="displayAjax">
                                                        <display:table name="lista" export="true" id="fila" >
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
                                                    </ajax:displayTag>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"><span class="glyphicon glyphicon-file">
                                                    </span>Reports</a>
                                            </h4>
                                        </div>
                                        <div id="collapseFour" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <table class="table">
                                                    <tr>
                                                        <td>
                                                            <span class="glyphicon glyphicon-usd"></span><a href="http://www.jquery2dotnet.com">Sales</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <span class="glyphicon glyphicon-user"></span><a href="http://www.jquery2dotnet.com">Customers</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <span class="glyphicon glyphicon-tasks"></span><a href="http://www.jquery2dotnet.com">Products</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <span class="glyphicon glyphicon-shopping-cart"></span><a href="http://www.jquery2dotnet.com">Shopping Cart</a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>


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
                        Copyright © 2014 Clínica Nazareth. All Rights Reserved.
                    </p>

                    <div class="social_bookmarks"></div>
                </div>
            </div>

        </div>
    </div>

    <br /><br /><br />
    <script src="../scripts/jquery.min.js" type="text/javascript"></script> 
    <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../scripts/default.js" type="text/javascript"></script>
    <script src="../scripts/modernizr.js" type="text/javascript"></script>

</body>
</html>