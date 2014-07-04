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
                var RegExPattern = /(^[0-9]{2,3}-? ?[0-9]{6,7}$)/;

                if ((campo.value.match(RegExPattern)) && (campo.value != '')) {

                } else {
                    alert('El campo debe ser llenado nª TELEFONO');
                }
            }

            function correo(campo) {
                var RegExPattern = /([\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4})/;

                if ((campo.value.match(RegExPattern)) && (campo.value != '')) {

                } else {
                    $("#alert_template button").after('<span>Escriba un email valido</span>');
                    $('#alert_template').fadeIn('slow');
                }
            }
        </script>



    </head>
    <body id="pageBody">
        <div class="alert alert-danger" id="alert_template" style="display: none; width: 60%; z-index: 0009;  ">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        </div>
        <div id="divBoxed" class="container">

            <div class="transparent-bg" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: -1;zoom: 1;"></div>

            <div class="divPanel notop nobottom">
                <div class="row-fluid">
                    <div class="span12">  


                        <!--Edit Site Name and Slogan here-->
                        <div id="divLogo">
                            <a href="index.jsp" id="divSiteTitle">Clínica Nazareth</a><br />
                            <a href="index.jsp" id="divTagLine">¡<span class="camera_full_width">Gestión de Administración</span>!</a>

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
                                    <li class="next"><a href="../Acceso.jsp">Salir <span class="glyphicon glyphicon-off"></span></a></li>
                                    <li class="next"><a href="../FrmSecretaria/indexSecre.jsp.jsp">Menu <span class="glyphicon glyphicon-tasks"></span></a></li>
                                    <li class="next"></li>

                                </ul>


                            </div>
                        </div>

                    </div>

                    <form name="gEmpleado" method="post" action="../sEmpleado">
                        <div class="panel-body">

                            <div class="panel panel-info">
                                <div class="panel-heading">Crearcion de Acceso </div>
                                <div class="panel-body">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="row">

                                                <div class="col-xs-6 col-md-6"><label >Usuario</label>

<input class="form-control" name="txtUsu" id="txtUsu"  placeholder="EJEMPLO@EJEMPLO.COM" onblur="correo(this);" value="EJEMPLO@EJEMPLO.COM">
                                                </div>
                                                <div class="col-xs-6 col-md-4"><label>Rol</label>
                                                    <select class="form-control" name="txtrol" id="txtrol"  >
                                                <option value="m">Masculino</option>
                                                <option value="f">Femenino</option>

                                            </select>
                                                    
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-body">

                                            <div class="row">
                                                <div class="col-md-6" ><label>Contraseña</label> <input name="txtContra" id="txtContra" type="password" value="angel" class="form-control" placeholder="Password" required></div>
                                                <div class="col-md-6"><label>repetir-Contraseña</label> <input  type="password" class="form-control" value="angel" placeholder="Password" required></div>
                                            </div>
                                        </div>
                                    </div>




                                </div>
                            </div>

                            <div class="panel panel-info">
                                <div class="panel-heading">Datos generales</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6" ><label>Primer Nombre</label><input name="txtPNombre"  id="txtPNombre" class="form-control"  placeholder="nombre" onblur="validatePass(this);" value="medico"></div>
                                        <div class="col-md-6"><label>Segundo Nombre</label><input name="txtSNombre" id="txtSNombre" class="form-control" placeholder="nombre" onblur="validatePass(this);" value="medico" ></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6"><label>Primer Apellido</label><input name="txtPApe" id="txtPApe" class="form-control"  placeholder="apellido"onblur="validatePass(this);" value="medico"></div>
                                        <div class="col-md-6"><label>Segundo Apellido</label><input name="txtSApe"id="txtSApe"  class="form-control" placeholder="apellido"onblur="validatePass(this);" value="medico" ></div>
                                    </div>
                                     <div class="row">
                                        <div class="col-md-6"><label>fecha nacimiento</label> <input  name="txtfecha" id="txtfecha" class="form-control" value="2014-08-04" /></div>
                                        <div class="col-md-6"><label >genero </label><SELECT class="form-control" NAME="comboSex" id="comboSex" SIZE=1> 
                                            <OPTION VALUE="m">Masculino</OPTION>
                                            <OPTION VALUE="f">Femenino</OPTION>


                                        </SELECT></div>
                                    </div>

                                </div>


                            </div>
                        </div>
                        <div class="panel panel-info">
                            <div class="panel-heading">correo </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-6 col-md-4"><input class="form-control" name="txtCorreo" id="txtCorreo" placeholder="ejemplo@gmail.com" value="ejemplo@gmail.com" onblur="docu(this);"></div>
                                    
                                    <div class="col-xs-6 col-md-2"><label >Tipo </label><SELECT NAME="comboTipoCorreo" id="comboTipoCorreo" class="form-control" SIZE=1> 
                                            <OPTION VALUE="personal">Personal</OPTION>
                                            <OPTION VALUE="trabajo">Laboral</OPTION>


                                        </SELECT>
</div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-info">
                            <div class="panel-heading">Datos: Documento, telefono</div>
                            <div class="panel-body">


                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-xs-6 col-md-2"><label >Documento</label>

                                            </div>
                                            <div class="col-xs-6 col-md-3">
                                                <input class="form-control" name="txtDocu" id="txtDocu" placeholder="Documento" onblur="docu(this);" value="12313">
                                              
                                            </div>
                                            <div class="col-xs-6 col-md-4"><label >Tipo </label><SELECT class="form-control" NAME="comboDocu" id="comboDocu" SIZE=1> 
                                                    <OPTION VALUE="dui">DUI</OPTION>
                                                    <OPTION VALUE="carnet">Carnet de Minoridad</OPTION>
                                                    <OPTION VALUE="pasapote">Pasaporte</OPTION>
                                                     <OPTION VALUE="nit">Nit</OPTION>

                                                </SELECT>

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
                                                <input class="form-control" name="txtCel" id="txtCel" placeholder="NUMERO TELEFONO" onblur="tele(this);" value="12345678">
                                                
                                            </div>
                                            <div class="col-xs-6 col-md-4"><label >Tipo </label><SELECT class="form-control" NAME="comboTipoCel" id="comboTipoCel" SIZE=1> 
                                                    <OPTION VALUE="1">FIJO</OPTION>
                                                    <OPTION VALUE="2">CELULAR</OPTION>
                                                    <OPTION VALUE="3">TRABAJO</OPTION>

                                                </SELECT></div>

                                        </div>
                                    </div>
                                </div>






                            </div>
                        </div>
                        <div class="panel panel-info">
                            <div class="panel-heading">Direccion</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-6 col-md-4"><input class="form-control" name="txtcalle" id=txtcalle" values="calle" placeholder="Calle: San Antonio" onblur="validatePass(this);" value="planes"></div>
                                    <div class="col-xs-6 col-md-4"><input class="form-control" name="txtcasa" id=txtcasa" values="casa" placeholder="N° casa:45" onblur="validatePass(this);" value="tres"></div>
                                    
                                    <div class="col-xs-6 col-md-2"><label >Municipio</label><SELECT class="form-control" NAME="comboMunicipio" id="comboMunicipio" SIZE=1> 
                                            <OPTION VALUE="1">PERSONAL</OPTION>
                                            <OPTION VALUE="2">TRABAJO</OPTION>
                                        </SELECT></div>
                                    <div class="col-xs-6 col-md-2"><label >Departamento</label><SELECT class="form-control" NAME="comboDepa" SIZE=1> 
                                            <OPTION VALUE="1">PERSONAL</OPTION>
                                            <OPTION VALUE="2">TRABAJO</OPTION>
                                        </SELECT></div>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-info">
                            <div class="panel-heading">Dato empleado</div>
                            <div class="panel-body">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-xs-6 col-md-4"><label >Cargo</label>

                                            </div>

                                            <div class="col-xs-6 col-md-2">
                                                
                                                <SELECT class="form-control" SIZE=1 NAME="comboCargo" id="comboCargo"> 
                                                    <OPTION VALUE="1">PERSONAL</OPTION>
                                                    <OPTION VALUE="2">TRABAJO</OPTION>


                                                </SELECT></div>

                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-body">

                                        <div class="row">
                                            <div class="col-xs-6 col-md-4"><label >Tipo Empleado</label>

                                            </div>

                                            <div class="col-xs-6 col-md-2">
                                                
                                                <SELECT class="form-control" SIZE=1 NAME="comboTipoE" id="comboTipoE" > 
                                                    <OPTION VALUE="1">PERSONAL</OPTION>
                                                    <OPTION VALUE="2">TRABAJO</OPTION>


                                                </SELECT></div>

                                        </div>

                                        


                                    </div>

                                </div>

                            </div>

                        </div>

                        <input type="submit" value="guardar"/>
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
                        Copyright � 2014 Clínica Nazareth. All Rights Reserved.
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