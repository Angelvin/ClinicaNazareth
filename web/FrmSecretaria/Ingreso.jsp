<%@page import="BEANS.selGrupo"%>
<%@page import="BEANS.sMedicamento"%>
<%@page import="java.sql.ResultSet"%>
?<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>Cl�nica Nazareth</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Zaid Archila">
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
  
 
<script type="text/javascript">
<!--
function validatePass(campo) {
    var RegExPattern = /([a-z])/;
    
    if ((campo.value.match(RegExPattern)) && (campo.value!='')) {
        
    } else {
       alert('El campo debe ser llenado con texto');  
    } 
}
//-->
function docu(campo) {
    var RegExPattern = /([0-9]|-)/;
    
    if ((campo.value.match(RegExPattern)) && (campo.value!='')) {
        
    } else {
       alert('El campo debe ser llenado con numero');  
    } 
}
//-->
function tele(campo) {
    var RegExPattern = /(^[0-9]{2,3}-? ?[0-8]{6,7}$)/;
   
    if ((campo.value.match(RegExPattern)) && (campo.value!='')) {
        
    } else {
       alert('El campo debe ser llenado n� TELEFONO');  
    } 
}

function correo(campo) {
    var RegExPattern = /([\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4})/;
    
    if ((campo.value.match(RegExPattern)) && (campo.value!='')) {
        
    } else {
       alert('El campo debe ser llenado con el Correo');  
    } 
}
</script>



</style>
</head>
<body id="pageBody">

<div id="divBoxed" class="container">

    <div class="transparent-bg" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: -1;zoom: 1;"></div>

  <div class="divPanel notop nobottom">
            <div class="row-fluid">
                <div class="span12">  


                    <!--Edit Site Name and Slogan here-->
          <div id="divLogo">
                        <a href="index.html" id="divSiteTitle">Cl�nica Nazareth</a><br />
                      <a href="index.html" id="divTagLine">�<span class="camera_full_width">Gesti�n de Administraci�n</span>!</a>

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
  PUEDA VERSE EN CUALQUEIR TAMA�O
  -->


  
  <div class="col-xs-12 col-sm-6 col-md-12">
   <div class="panel panel-primary">
  <div class="panel-heading">
                      <div class="row">
  <div class="col-xs-12 col-md-8"><h2 class="panel-title">Bienvenida Secretaria: Luc�a</h2></div>
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


<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-11">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-folder-close">
                            </span>Ingreso de Medicamento</a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            

<div class="row">
  <div class="col-xs-6 col-md-4">C�digo de Producto</div>
  <div class="col-xs-6 col-md-4"><input type="text" class="form-control" placeholder="Codigo"> <button type="button" class="btn btn-default" data-dismiss="modal">buscar</button></div>
 <div class="col-xs-6 col-md-4">
  

<!-- Modal -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Nombre Medicamento</h4>
      </div>
      <div class="modal-body">
        <div class="row">

  <div class="col-xs-6 col-md-4">Cantidad</div>
  <div class="col-xs-6 col-md-4"><input type="text" class="form-control" placeholder="cantidad de medicamento" onblur="docu(this);"></div>
 
</div>


<div class="row">
  <div class="col-xs-6 col-md-4">Presentacion</div>
  <div class="col-xs-6 col-md-4"><input type="text" class="form-control" placeholder="Nombre"></div>
  
</div>



<div class="row">
  <div class="col-xs-6 col-md-4">Precio</div>
  <div class="col-xs-6 col-md-4"><input type="text" class="form-control" ></div>
 
</div>
<div class="row">
  <div class="col-xs-6 col-md-4">fecha ingreso</div>
  <div class="col-xs-6 col-md-4"><input type="date" class="form-control" name="fecha" value="" /></div>
 
</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Ingresar</button>
        
      </div>
    </div>
  </div>
</div>




 </div>
</div>
<table class="table table-hover">
    <tr>
      <td>Id </td>
      <td>C�digo</td>
      <td>Nombre</td>
      <td>Cantida</td>
      <td>Precio </td>
      <td> </td>
    </tr>
    <tr class="success">
      <td>1</td>
      <td>094812</td>
      <td>acetaminofen</td>
      <td>10</td>
      <td>$2</td>
      <td><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal1">
  Ingresar
</button> </td>
       <td></td>
       
    </tr>
    <tr >
      <td>2</td>
      <td>0126</td>
      <td>zorritoma</td>
      <td>15  </td>
      <td>$3</td>
      <td><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal1">
  Ingresar
</button> </td>
       <td></td>
       
    </tr>
    <tr class="success">
      <td>1</td>
      <td>0126</td>
      <td>penicilina</td>
      <td>54</td>
      <td>$14</td>
      <td><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal1">
  Ingresar
</button> </td>
       <td></td>
       
    </tr>
    <tr >
      <td>1</td>
      <td>01278</td>
      <td>gotas para ojos</td>
      <td>15</td>
      <td>$12</td>
      <td><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal1">
  Ingresar
</button> </td>
       <td></td>
       
    </tr>
     
      
  </table>
  

                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-th">
                            </span>Nuevo Producto</a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                              <div class="row">
  <div class="col-xs-6 col-md-4"><label >Nombre</label></div>
  <div class="col-xs-6 col-md-4"><input name="txtNombreMedica" type="text" class="form-control"  /></div>
  <div class="col-xs-6 col-md-4"></div>



</div>

  <div class="row">
  <div class="col-xs-6 col-md-4"><label >Existencia</label></div>
  <div class="col-xs-6 col-md-4"><input name="txtExis"type="text" class="form-control"  ></div>

  <div class="row">
  <div class="col-xs-6 col-md-4"><label >Via de Aplicacion</label></div>
  <div class="col-xs-6 col-md-4"><input name="txtViaAdmon"type="text" class="form-control"  ></div>
 
</div>

  <div class="row">
  <div class="col-xs-6 col-md-4"><label >Estado</label></div>
  <div class="col-xs-6 col-md-4"><input name="txtEstado"type="text" class="form-control"  ></div>
 
</div>
  
<div class="row">
  <div class="col-xs-6 col-md-4"><label >Presentacion</label> </div>
  <div class="col-xs-6 col-md-4"><input name="txtPresen" type="text" class="form-control"  onblur="validatePass(this);" ></div>
  
</div>

<div class="row">
  <div class="col-xs-6 col-md-4"><label>Grupo</label></div>
  <div class="col-xs-6 col-md-4"></div>
  <select name="cdcombo">
                <option>seleccionar opcion</option>
                <%
                    ResultSet rs = selGrupo.getGrupo();
                    while (rs.next()) {

             %>
                <option value="<%= rs.getString("idGrupo")%>"><%= rs.getString("nombreGrupo")%></option>
                <%
                    }

                %>
            </select>
</div>
  
</div>


<div class="row">
  <div class="col-xs-6 col-md-4"><label>SubGrupo</label></div>
  <div class="col-xs-6 col-md-4">
    
    <SELECT NAME="selCombo" SIZE=1> 
<OPTION VALUE="1">FIJO</OPTION>
<OPTION VALUE="2">CELULAR</OPTION>
<OPTION VALUE="3">TRABAJO</OPTION>

</SELECT>
  </div>
 
</div>
            <input type="submit" value="ingresar"/>

                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="glyphicon glyphicon-user">
                            </span>Account</a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="http://www.jquery2dotnet.com">Change Password</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="http://www.jquery2dotnet.com">Notifications</a> <span class="label label-info">5</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="http://www.jquery2dotnet.com">Import/Export</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-trash text-danger"></span><a href="http://www.jquery2dotnet.com" class="text-danger">
                                            Delete Account</a>
                                    </td>
                                </tr>
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
<div>
    

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
            Copyright � 2014 Clinica Nazareth. All Rights Reserved.
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