<%-- 
    Document   : indexmedico
    Created on : Jul 5, 2014, 10:35:53 PM
    Author     : Cesar
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@include file="../frementop.jspf" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>Clínica Nazareth</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Cesar Cordova">
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
                        Bienvenido Dr.:<b> <c:out  value="${userName}"></c:out>
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
                <div class="tab-pane" id="Menu">
                                            <h3>Selecciones una opciòn</h3>
                                            <ul class="list-group">

                                                <li class="list-group-item"><span class="glyphicon glyphicon-list-alt"></span><a href="../medico/AgendaMedico.jsp">Agenda</a></li>
                                                <li class="list-group-item"><span class="glyphicon glyphicon-search"></span><a href="../medico/BusquedaPacienteMedico.jsp">Busqueda de Paciente</a></li>
                                                <li class="list-group-item"><span class="glyphicon glyphicon-folder-open"></span><a href="../medico/crearcitamedico.jsp">Crear Citas</a></li>
                                                <li class="list-group-item"><span class="glyphicon glyphicon-shopping-cart"></span><a href="../medico/FarmaciaMedico.jsp">Farmacia</a></li>

                                            </ul>
                                        </div>
                        
                        
            <script src="../scripts/jquery.min.js" type="text/javascript"></script>
            <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
            <script src="../scripts/default.js" type="text/javascript"></script>
            <script src="../scripts/modernizr.js" type="text/javascript"></script>

    </body>
</html>