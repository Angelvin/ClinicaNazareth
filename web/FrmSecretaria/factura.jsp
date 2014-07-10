<!DOCTYPE HTML>
<%@taglib prefix="display" uri="http://displaytag.sf.net" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/jspf/validar.jspf" %>

<style media="screen" type="text/css">.hidden{display:none;</style>
<html>
<head>
    <script>
        function myFunction(){
            location.reload();
        }
        
    </script>
    <meta charset="utf-8">
    <title>Clínica Nazareth</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Zaid Archila">
    <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../scripts/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <script src="scripts/jquery.min.js" type="text/javascript"></script>

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
  



</head>
<body id="pageBody">

<div id="divBoxed" class="container">

    <div class="transparent-bg" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: -1;zoom: 1;"></div>

  <div class="divPanel notop nobottom">
            <div class="row-fluid">
                <div class="span12">  


                    <!--Edit Site Name and Slogan here-->
          <div id="divLogo">
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

      <li class="next"><a href="../sistema/login.html">Salir <span class="glyphicon glyphicon-off"></span></a></li>

       <li class="next"><a href="../FrmSecretaria/EntraSecret.html">Menu <span class="glyphicon glyphicon-tasks"></span></a></li>
 <li class="next"></li>
  
</ul>


  </div>
</div>
                </div>
  <div class="panel-body">

</div>
<div>

</div>
                           <jsp:useBean id="entrega" scope="request" class="BAL.cfactura" />
                            <c:set var="lista" scope="request" value="${entrega.listado}"/>
                            <display:table varTotals="totals" name="lista" export="true" class="its" id="fila" defaultsort="1">
                            <display:setProperty name="export.rtf.filename" value="example.rtf" />
                            <display:column class="hidden" headerClass="hidden" property="codigo" group="1" title="codigo" />
                            <display:column property="paciente" title="Paciente" group="2" style="width:262px;"/>
                            <display:column property="fecha" title="Fecha Factura" group="3" style="width:120px;" />
                            <display:column property="medicamento" title="Medicamento" style="width:200px;" />
                            <display:column property="cantidad" title="Cant" style="width:50px;" />
                            <display:column property="precio" title="C/U" style="width:50px;"/>
                            <display:column property="subtotal" title="subtotal" style="width:50px;" total="true" format="{0,number,0.00}"/>
                            <display:setProperty name="export.pdf" value="true"/>
                            <display:column group="1" title="Facturar">
                            <form name="Despacho" method="request" action="../srvFactura">
                                <input type="text" class="hidden" name="txtcodigo" value="${fila.codigo}">
                                <select name="cmbpago" size="1">
                                <option value="Select">Tipo de pago</option>
                                <option value="Gratis">Gratis</option>
                                <option value="Efectivo">Efectivo</option>
                                <option value="Credito">Credito</option>
                                </select>
                                <button type="submit" class="btn btn-sm btn-default">Facturar</button>
                                </form>
                            </display:column>
                            </display:table>
                            
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

<script src=".../scripts/jquery.min.js" type="text/javascript"></script> 
<script src=".../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src=".../scripts/default.js" type="text/javascript"></script>

<script src="scripts/carousel/jquery.carouFredSel-6.2.0-packed.js" type="text/javascript"></script><script type="text/javascript">$('#list_photos').carouFredSel({ responsive: true, width: '100%', scroll: 2, items: {width: 320,visible: {min: 2, max: 6}} });</script><script src="scripts/camera/scripts/camera.min.js" type="text/javascript"></script>
<script src="scripts/easing/jquery.easing.1.3.js" type="text/javascript"></script>
<script type="text/javascript">function startCamera() {$('#camera_wrap').camera({ fx: 'simpleFade, mosaicSpiralReverse', time: 2000, loader: 'none', playPause: false, navigation: true, height: '38%', pagination: true });}$(function(){startCamera()});</script>

<script src="scripts/wookmark/js/jquery.wookmark.js" type="text/javascript"></script>
<script type="text/javascript">$(window).load(function () {var options = {autoResize: true,container: $('#gridArea'),offset: 10};var handler = $('#tiles li');handler.wookmark(options);$('#tiles li').each(function () { var imgm = 0; if($(this).find('img').length>0)imgm=parseInt($(this).find('img').not('p img').css('margin-bottom')); var newHeight = $(this).find('img').height() + imgm + $(this).find('div').height() + $(this).find('h4').height() + $(this).find('p').not('blockquote p').height() + $(this).find('iframe').height() + $(this).find('blockquote').height() + 5;if($(this).find('iframe').height()) newHeight = newHeight+15;$(this).css('height', newHeight + 'px');});handler.wookmark(options);handler.wookmark(options);});</script>
<script src="scripts/yoxview/yox.js" type="text/javascript"></script>
<script src="scripts/yoxview/jquery.yoxview-2.21.js" type="text/javascript"></script>
<script type="text/javascript">$(document).ready(function () {$('.yoxview').yoxview({autoHideInfo:false,renderInfoPin:false,backgroundColor:'#ffffff',backgroundOpacity:0.8,infoBackColor:'#000000',infoBackOpacity:1});$('.yoxview a img').hover(function(){$(this).animate({opacity:0.7},300)},function(){$(this).animate({opacity:1},300)});});</script>

</body>
</html>