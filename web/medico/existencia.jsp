<!DOCTYPE HTML>
<%@include file="../frementop.jspf" %>

<html>
    <head>
        <meta charset="utf-8">
        <title>Clinica Nazareth</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Angel">
        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../scripts/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">

        <!-- Icons -->
        <link href="../scripts/icons/general/stylesheets/general_foundicons.css" media="screen" rel="stylesheet" type="text/css" />  
        <link href="../scripts/icons/social/stylesheets/social_foundicons.css" media="screen" rel="stylesheet" type="text/css" />
        <!--[if lt IE 8]>
            <link href="scripts/icons/general/stylesheets/general_foundicons_ie7.css" media="screen" rel="stylesheet" type="text/css" />
            <link href="scripts/icons/social/stylesheets/social_foundicons_ie7.css" media="screen" rel="stylesheet" type="text/css" />
        <![endif]-->
        <link rel="stylesheet" href="../scripts/fontawesome/css/font-awesome.min.css">
        <!--[if IE 7]>
            <link rel="stylesheet" href="scripts/fontawesome/css/font-awesome-ie7.min.css">
        <![endif]-->

        <link href="../scripts/carousel/style.css" rel="stylesheet" type="text/css" /><link href="../scripts/camera/css/camera.css" rel="stylesheet" type="text/css" />
        <link href="../scripts/wookmark/css/style.css" rel="stylesheet" type="text/css" />  <link href="../scripts/yoxview/yoxview.css" rel="stylesheet" type="text/css" />



        <link href="../styles/custom.css" rel="stylesheet" type="text/css" /> 
        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                /* #txt is display table id & employee_search_ class is field id which you want to filter */
                var oTable = $('#fila').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": true,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": false,
                    "bStateSave": false
                });
                $("thead input").keyup(function() {
                    oTable.fnFilter(this.value, $("thead input").index(this));
                });

                $("thead input").focus(function() {
                    if (this.className == "BusquedaMed") {
                        this.className = "";
                        this.value = "";
                    }
                });

                $("thead input").blur(function(i) {
                    if (this.value == "") {
                        this.className = "BusquedaMed";
                        this.value = asInitVals[$("thead input").index(this)];
                    }
                });
            });
        </script>
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
                <jsp:include page="menu.jsp"></jsp:include>
                    <div class="panel panel-primary">
                        <div class="panel-heading">


                        </div>
                        <div class="panel-body">

                            <div class="panel panel-default">
                                <div class="panel-body">

                                <jsp:useBean id="listaM" scope="request" class="BAL.listaMedicamento" />

                                <c:set var="list" scope="request" value="${listaM.listado}"/>

                                <display:table name="list" export="true" id="fila"  class="table table-condensed"  >
                                    <display:setProperty name="export.rtf.filename" value="example.rtf" />
                                    <display:header>
                                        <input type="hidden" name="idMedica" class="BusquedaMed" class="form-control">
                                    </display:header>    

                                    <display:column property="idMedica" title="ID" />
                                    <display:column property="nombreMe" title="Nombre" />
                                    <display:column property="viAdmon" title="via administracion" />
                                    <display:column property="presen" title="Presentacion" />
                                    <display:column property="existencia" title="Existenci" />
                                    <display:column property="estado" title="Estadomedicamento" />
                                    <display:column property="subgrupo" title="subgrupo" />
                                    <display:setProperty name="export.pdf" value="true" />


                                </display:table>




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


                </body>
                </html>