<%-- 
    Document   : indexmedico
    Created on : Jul 5, 2014, 10:35:53 PM
    Author     : Cesar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clinica Nazaret</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Cesar Cordova">
    <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../scripts/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    
    <!-- Icons -->
    <link href="../scripts/icons/general/stylesheets/general_foundicons.css" media="screen" rel="stylesheet" type="text/css" />  
    <link href="../scripts/icons/social/stylesheets/social_foundicons.css" media="screen" rel="stylesheet" type="text/css" />
    <link rel="../stylesheet" href="scripts/fontawesome/css/font-awesome.min.css">
    <link href="../scripts/carousel/style.css" rel="stylesheet" type="text/css" /><link href="scripts/camera/css/camera.css" rel="stylesheet" type="text/css" />
    <link href="../scripts/wookmark/css/style.css" rel="stylesheet" type="text/css" />	<link href="scripts/yoxview/yoxview.css" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Syncopate" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Maven+Pro" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Oxygen" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
    <link href="../styles/custom.css" rel="stylesheet" type="text/css" />	
    </head>
    <body>
        <div id="divBoxed" class="container">

    <div class="transparent-bg" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: -1;zoom: 1;"></div>

  <div class="divPanel notop nobottom">
            <div class="row-fluid">
                <div class="span12">	


                    <!--Edit Site Name and Slogan here-->
				  <div id="divLogo">
                        <a href="index.html" id="divSiteTitle">Clínica Nazaret</a><br />
                      <a href="index.html" id="divTagLine">¡<span class="camera_full_width">Gestion de medico</span>!</a>

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


  
    
 <div class="transparent-bg" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: -1;zoom: 1;"></div>
   <div class="panel panel-primary">
  <div class="panel-heading">
      <div class="row">
  <div class="col-xs-12 col-md-8"><h2 class="panel-title">Bienvenido Dr.<c:out value="${userName}"></c:out></h2></div>
  <div class="col-xs-6 col-md-4">
    <ul class="pager">
 
  <li class="next"><a href="../sistema/login.html">Salir <span class="glyphicon glyphicon-off"></span></a></li>
</ul>


  </div>
</div>
    
 
  </div>
  <div class="panel-body">
<div class="transparent-bg" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: -1;zoom: 1;"></div>
  <table class="table table-condensed">
    <tr>
       <button onclick="window.open('../sistema/AgendaMedico.html')" type="button" name="btm_Agenda" class="btn btn-default btn-lg btn-block">Agenda</button>
	 </tr>
	<tr>
        <button onclick="window.open('../sistema/BusquedaPacienteMedico.html')" type="button" name="btm_Busqueda_Paciente" class="btn btn-default btn-lg btn-block">Busqueda Paciente</button>
    </tr><tr>
      <button onclick="window.open('../sistema/cita_agenda.html')" type="button" name="btm_Crear_Cita" class="btn btn-default btn-lg btn-block">Crear Cita</button>
    </tr>
   <tr>
      <button onclick="window.open('../sistema/FarmaciaMedico.html')" type="button" name="btm_Farmacia" class="btn btn-default btn-lg btn-block">Farmacia</button>
    </tr>
  </table>
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
            Copyright © 2014 Cesar Cordova. All Rights Reserved.
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

<script src="../scripts/carousel/jquery.carouFredSel-6.2.0-packed.js" type="text/javascript"></script><script type="text/javascript">$('#list_photos').carouFredSel({ responsive: true, width: '100%', scroll: 2, items: {width: 320,visible: {min: 2, max: 6}} });</script><script src="scripts/camera/scripts/camera.min.js" type="text/javascript"></script>
<script src="../scripts/easing/jquery.easing.1.3.js" type="text/javascript"></script>
<script type="text/javascript">function startCamera() {$('#camera_wrap').camera({ fx: 'simpleFade, mosaicSpiralReverse', time: 2000, loader: 'none', playPause: false, navigation: true, height: '38%', pagination: true });}$(function(){startCamera()});</script>

<script src="../scripts/wookmark/js/jquery.wookmark.js" type="text/javascript"></script>
<script type="text/javascript">$(window).load(function () {var options = {autoResize: true,container: $('#gridArea'),offset: 10};var handler = $('#tiles li');handler.wookmark(options);$('#tiles li').each(function () { var imgm = 0; if($(this).find('img').length>0)imgm=parseInt($(this).find('img').not('p img').css('margin-bottom')); var newHeight = $(this).find('img').height() + imgm + $(this).find('div').height() + $(this).find('h4').height() + $(this).find('p').not('blockquote p').height() + $(this).find('iframe').height() + $(this).find('blockquote').height() + 5;if($(this).find('iframe').height()) newHeight = newHeight+15;$(this).css('height', newHeight + 'px');});handler.wookmark(options);handler.wookmark(options);});</script>
<script src="../scripts/yoxview/yox.js" type="text/javascript"></script>
<script src="../scripts/yoxview/jquery.yoxview-2.21.js" type="text/javascript"></script>
<script type="text/javascript">$(document).ready(function () {$('.yoxview').yoxview({autoHideInfo:false,renderInfoPin:false,backgroundColor:'#ffffff',backgroundOpacity:0.8,infoBackColor:'#000000',infoBackOpacity:1});$('.yoxview a img').hover(function(){$(this).animate({opacity:0.7},300)},function(){$(this).animate({opacity:1},300)});});</script>
 <script src="../scripts/modernizr.js" type="text/javascript"></script>
    </body>
</html>
