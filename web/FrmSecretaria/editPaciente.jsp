
<%@page import="BAL.edPaciente"%>
<%@page import="BEANS.bedipaciente"%>

<!DOCTYPE HTML>
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
                                    <li class="next"><a href="../login.html">Salir <span class="glyphicon glyphicon-off"></span></a></li>

                                    <li class="next"></li>

                                </ul>


                            </div>
                        </div>

                    </div>
                    <div class="panel-body">
                        <h1>
                            <%
                                int setUID = 0;
                                //setUID = Integer.parseInt(request.getParameter("codigo"));
                                if (request.getParameter("algo") != "") {
                                    setUID = Integer.parseInt(request.getParameter("codigo"));
                                } else {
                                    //do nothing
                                }
                                bedipaciente list = edPaciente.getPersona(setUID);
                            %>


                        </h1>
                        <form  id="updateCita" method="post" action="../Sedpaciente ">
                            <div class="panel panel-default">
                                <div class="panel-heading">Datos</div>
                                <div class="panel-body">
                                    <input  name="codigoC" id="codigoC" value="<%=list.getIdpaciente()%>">
                                    <div class="row">
                                        <div class="col-md-6" ><label>Primer Nombre</label><input id="txtnombre" name="txtnombre" class="form-control"  placeholder="nombre" value="<%=list.getNombre()%>"></div>

                                        <div class="col-md-6"><label>Segundo Nombre</label><input name="txtnombres" id="txtnombres" class="form-control" placeholder="nombre"  value="<%=list.getSnombre()%>"></div>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-md-6"><label>Primer Apellido</label><input   id="txtapellido" name="txtapellido"    class="form-control"  placeholder="apellido" value="<%=list.getApellido()%>" onblur="validatePass(this);"></div>
                                    <div class="col-md-6"><label>Segundo Apellido</label><input   id="txtapellidos" name= "txtapellidos" class="form-control" placeholder="apellido" value=" <%=list.getSapellido()%>"  onblur="validatePass(this);"></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"><label>Genero</label><input   id="txtsexo" name="txtsexo"    class="form-control"  placeholder="sexo" value="<%=list.getSexo()%>" onblur="validatePass(this);"></div>
                                    <div class="col-md-6"><label>Iglesia</label><input   id="txtiglesia" name= "txtiglesia" class="form-control" placeholder="iglesia" value=" <%=list.getIglesia()%>"  onblur="validatePass(this);"></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"><label>fechanacimiento</label><input   id="txtFecha" name="txtFecha"    class="form-control"  placeholder="sexo" value="<%=list.getFecha()%>" onblur="validatePass(this);"></div>

                                </div>
                                         <div class="row">
  <div class="col-md-6"></div>
  <div class="col-md-6"><input type="submit" name="cmdguardar" class="btn btn-Contol" value="Guardar" POST="SUMIT"/></div>
</div>
                            </div>
                    </div>

                    
                    </form>
                   
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
                        Copyright ? 2014 Clínica Nazareth. All Rights Reserved.
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