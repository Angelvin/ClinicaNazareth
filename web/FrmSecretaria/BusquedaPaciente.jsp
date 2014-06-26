<%@page contentType="text/html" pageEncoding="UTF-8"%>﻿
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
        <link href="../scripts/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">

        <!-- Icons -->
        <link href="../scripts/icons/general/stylesheets/general_foundicons.css" media="screen" rel="stylesheet" type="text/css" />  
        <link href="../scripts/icons/social/stylesheets/social_foundicons.css" media="screen" rel="stylesheet" type="text/css" />

        <link rel="stylesheet" href="../scripts/fontawesome/css/font-awesome.min.css">
        <!--[if IE 7]>
            <link rel="stylesheet" href="scripts/fontawesome/css/font-awesome-ie7.min.css">
        <![endif]-->

        <link href="../scripts/carousel/style.css" rel="stylesheet" type="text/css" /><link href="../scripts/camera/css/camera.css" rel="stylesheet" type="text/css" />
        <link href="../scripts/wookmark/css/style.css" rel="stylesheet" type="text/css" />  <link href="../scripts/yoxview/yoxview.css" rel="stylesheet" type="text/css" />


        <link href="../styles/custom.css" rel="stylesheet" type="text/css" /> 


        <script type="text/javascript">
            <!--
        function validatePass(campo) {
                var RegExPattern = /([a-z])/;

                if ((campo.value.match(RegExPattern)) && (campo.value != '')) {

                } else {
                    alert('El campo debe ser llenado con texto');
                }
            }
            //-->
            function docu(campo) {
                var RegExPattern = /([0-9]|-)/;

                if ((campo.value.match(RegExPattern)) && (campo.value != '')) {

                } else {
                    alert('El campo debe ser llenado con numero');
                }
            }
            //-->
            function tele(campo) {
                var RegExPattern = /(^[0-9]{2,3}-? ?[0-8]{6,7}$)/;

                if ((campo.value.match(RegExPattern)) && (campo.value != '')) {

                } else {
                    alert('El campo debe ser llenado nª TELEFONO');
                }
            }

            function correo(campo) {
                var RegExPattern = /([\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4})/;

                if ((campo.value.match(RegExPattern)) && (campo.value != '')) {

                } else {
                    alert('El campo debe ser llenado con el Correo');
                }
            }
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
                            <a href="index.jsp" id="divSiteTitle">Clínica Nazareth</a><br />
                            <a href="index.jsp" id="divTagLine">¡<span class="camera_full_width">Búsqueda de Paciente</span>!</a>
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
                PUEDA VERSE EN CUALQUEIR TAMAÑO
            -->



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
                        <div>
                            <!-- Large modal -->


                            <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">

                                        <div class="container">
                                            <div class="row">
                                                <div class="col-sm-12 col-md-9">
                                                    <div class="panel-group" id="accordion">
                                                        <div class="panel panel-default">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-user">
                                                                        </span>Datos Personales</a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapseOne" class="panel-collapse collapse in">
                                                                <div class="panel-body">
                                                                    <div class="row">
                                                                        <div class="col-md-6" ><label>Primer Nombre</label><input class="form-control"  placeholder="nombre" onblur="validatePass(this);"></div>
                                                                        <div class="col-md-6"><label>Segundo Nombre</label><input class="form-control" placeholder="nombre" onblur="validatePass(this);"></div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-md-6"><label>Primer Apellido</label><input class="form-control"  placeholder="apellido" onblur="validatePass(this);"></div>
                                                                        <div class="col-md-6"><label>Segundo Apellido</label><input class="form-control" placeholder="apellido" onblur="validatePass(this);"></div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-xs-12 col-md-8" ><label>Fecha Nacimiento</label> <input type="date" class="form-control" name="fecha" value="" /></div>
                                                                        <div class="col-xs-12 col-md-8"><label >Edad</label>...</div>
                                                                    </div>
                                                                    <button class="btn btn-primary" >guardar</button>



                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="panel panel-default">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-th">
                                                                        </span>Datos generales</a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapseTwo" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div class="panel panel-default">
                                                                        <div class="panel-body">

                                                                            <div class="row">
                                                                                <div class="col-xs-6 col-md-2"><label >Documento</label>

                                                                                </div>
                                                                                <div class="col-xs-6 col-md-3">
                                                                                    <input class="form-control" placeholder="Documento" onblur="docu(this);">
                                                                                </div>
                                                                                <div class="col-xs-6 col-md-4"><label >Tipo </label><SELECT NAME="selCombo" SIZE=1> 
                                                                                        <OPTION VALUE="1">DUI</OPTION>
                                                                                        <OPTION VALUE="2">Carnet de Minoridad</OPTION>
                                                                                        <OPTION VALUE="3">Pasaporte</OPTION>

                                                                                    </SELECT>

                                                                                </div>
                                                                                <div class="col-xs-6 col-md-3">
                                                                                    <button type="submit" class="btn btn-default">Submit</button> 

                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                    <div class="panel panel-default">
                                                                        <div class="panel-body">
                                                                            <div class="row">
                                                                                <div class="col-xs-6 col-md-2"><label >Teléfono</label>

                                                                                </div>
                                                                                <div class="col-xs-6 col-md-3">
                                                                                    <input class="form-control" placeholder="NUMERO TELEFONO" onblur="tele(this);">
                                                                                </div>
                                                                                <div class="col-xs-6 col-md-4"><label >Tipo </label><SELECT NAME="selCombo" SIZE=1 id="cbselec"> 
                                                                                        <OPTION VALUE="1">FIJO</OPTION>
                                                                                        <OPTION VALUE="2">CELULAR</OPTION>
                                                                                        <OPTION VALUE="3">TRABAJO</OPTION>

                                                                                    </SELECT></div>
                                                                                <div class="col-xs-6 col-md-3">
                                                                                    <button id="txtdato" type="submit" class="btn btn-default">Submit</button> 

                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                    <div class="panel panel-default">
                                                                        <div class="panel-body">

                                                                            <div class="row">
                                                                                <div class="col-xs-6 col-md-2"><label >Dirección</label></div>
                                                                                <div class="col-xs-6 col-md-4"><input class="form-control" placeholder="Calle" onblur="validatePass(this);"></div>
                                                                                <div class="col-xs-6 col-md-4"><input class="form-control" placeholder="Casa" onblur="validatePass(this);"></div>



                                                                            </div>


                                                                            <div class="row">
                                                                                <div class="col-xs-6 col-md-2"><label >Departamento</label></div>
                                                                                <div class="col-xs-6 col-md-4"><SELECT NAME="selCombo" SIZE=1> 
                                                                                        <OPTION VALUE="1">PERSONAL</OPTION>
                                                                                        <OPTION VALUE="2">TRABAJO</OPTION>


                                                                                    </SELECT></div>
                                                                                <div class="col-xs-6 col-md-4"><label >Municipio</label><SELECT NAME="selCombo" SIZE=1> 
                                                                                        <OPTION VALUE="1">PERSONAL</OPTION>
                                                                                        <OPTION VALUE="2">TRABAJO</OPTION>


                                                                                    </SELECT></div>
                                                                                <div class="col-xs-6 col-md-4">
                                                                                    <button type="submit" class="btn btn-default">Submit</button> 
                                                                                </div>
                                                                            </div>



                                                                        </div>
                                                                    </div>


                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="panel panel-default">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="glyphicon glyphicon-user">
                                                                        </span>Correo</a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapseThree" class="panel-collapse collapse">
                                                                <div class="panel-body">



                                                                    <div class="row">
                                                                        <div class="col-xs-6 col-md-2"><label >Correo</label>

                                                                        </div>
                                                                        <div class="col-xs-6 col-md-4">
                                                                            <input class="form-control" placeholder="EJEMPLO@EJEMPLO.COM">
                                                                        </div>
                                                                        <div class="col-xs-6 col-md-2"><label >Tipo </label><SELECT NAME="selCombo" SIZE=1> 
                                                                                <OPTION VALUE="1">PERSONAL</OPTION>
                                                                                <OPTION VALUE="2">TRABAJO</OPTION>


                                                                            </SELECT></div>
                                                                        <button class="btn btn-primary" >guardar</button>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                                </div>
                                            </div>





                                        </div>
                                    </div>
                                </div>



                            </div>
                            <div class="row">
                                <div class="col-md-4"><label>Campo de Búsquedad</label>

                                    <select name="dia" id="dia">
                                        <option>Correo</option>
                                        <option>Nombre</option>
                                        <option>Teléfono</option>
                                        <option>Documento</option>
                                    </select>


                                </div>
                                <div class="col-md-6 col-md-4">
                                    <input class="form-control" placeholder="valor de Busqueda" >

                                </div>
                                <div class="col-md-6 col-md-4">
                                    <input type="submit" class="btn btn-success" name="btm_guardar" id="btm_guardar" value="Buscar">
                                </div>
                            </div>
                            <div> <table>

                                    <!--          LISTADO     -->
                                    <jsp:useBean id="estado2" scope="request" class="BAL.cbusqueda" />

                                    <c:set var="list" scope="request" value="${estado2.listado}"/>

                                    <display:table name="list" export="true" id="fila"  class="table table-condensed"  >
                                        <display:setProperty name="export.rtf.filename" value="example.rtf" />

                                        <display:column property="codigo" title="Codigo" />
                                        <display:column property="nombre" title="Nombre" />
                                        <display:column property="apellido" title="Apellido" />

                                        <display:setProperty name="export.pdf" value="true" />
                                        <display:column title="Editar">
                                            <form  id="updateCita" method="post" action=" ">
                                                <input type="hidden" name="codigoCita" value="${fila.codigo}" >
                                                <input type="submit" name="cmdguardar" class="btn btn-link" value="Modificar" POST="SUMIT"/>      
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

        <script src="../scripts/jquery.min.js" type="text/javascript"></script> 
        <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../scripts/default.js" type="text/javascript"></script>

        <script src="scripts/carousel/jquery.carouFredSel-6.2.0-packed.js" type="text/javascript"></script><script type="text/javascript">$('#list_photos').carouFredSel({responsive: true, width: '100%', scroll: 2, items: {width: 320, visible: {min: 2, max: 6}}});</script><script src="scripts/camera/scripts/camera.min.js" type="text/javascript"></script>
        <script src="scripts/easing/jquery.easing.1.3.js" type="text/javascript"></script>
        <script type="text/javascript">function startCamera() {
                                                                                        $('#camera_wrap').camera({fx: 'simpleFade, mosaicSpiralReverse', time: 2000, loader: 'none', playPause: false, navigation: true, height: '38%', pagination: true});
                                                                                    }
                                                                                    $(function() {
                                                                                        startCamera()
                                                                                    });</script>

        <script src="scripts/wookmark/js/jquery.wookmark.js" type="text/javascript"></script>
        <script type="text/javascript">$(window).load(function() {
                                                                                        var options = {autoResize: true, container: $('#gridArea'), offset: 10};
                                                                                        var handler = $('#tiles li');
                                                                                        handler.wookmark(options);
                                                                                        $('#tiles li').each(function() {
                                                                                            var imgm = 0;
                                                                                            if ($(this).find('img').length > 0)
                                                                                                imgm = parseInt($(this).find('img').not('p img').css('margin-bottom'));
                                                                                            var newHeight = $(this).find('img').height() + imgm + $(this).find('div').height() + $(this).find('h4').height() + $(this).find('p').not('blockquote p').height() + $(this).find('iframe').height() + $(this).find('blockquote').height() + 5;
                                                                                            if ($(this).find('iframe').height())
                                                                                                newHeight = newHeight + 15;
                                                                                            $(this).css('height', newHeight + 'px');
                                                                                        });
                                                                                        handler.wookmark(options);
                                                                                        handler.wookmark(options);
                                                                                    });</script>
        <script src="scripts/yoxview/yox.js" type="text/javascript"></script>
        <script src="scripts/yoxview/jquery.yoxview-2.21.js" type="text/javascript"></script>
        <script type="text/javascript">$(document).ready(function() {
                                                                                        $('.yoxview').yoxview({autoHideInfo: false, renderInfoPin: false, backgroundColor: '#ffffff', backgroundOpacity: 0.8, infoBackColor: '#000000', infoBackOpacity: 1});
                                                                                        $('.yoxview a img').hover(function() {
                                                                                            $(this).animate({opacity: 0.7}, 300)
                                                                                        }, function() {
                                                                                            $(this).animate({opacity: 1}, 300)
                                                                                        });
                                                                                    });</script>

    </body>
</html>