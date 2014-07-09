<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/validar.jspf" %>
<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <title>Clínica Nazareth</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Zaid Archila">
        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
            function validatePas(campo) {
                var RegExPattern = /(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$/;
                var errorMessage = 'Password Incorrecta.';
                if ((campo.value.match(RegExPattern)) && (campo.value != '')) {
                    alert('Password Correcta');
                } else {
                    alert(errorMessage);
                    campo.focus();
                }
            }
        </script>
        <script src="../scripts/modernizr2.6.2.js" type="text/javascript" ></script>
        <script>
            // fallback para el datepicker con jquery
            Modernizr.load({
                test: Modernizr.inputtypes.date,
                nope: ['http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.7/jquery-ui.min.js', 'jquery-ui.css'],
                complete: function() {
                    $('input[type=date]').datepicker({
                        dateFormat: 'yy-mm-dd'
                    });
                }

            });
        </script>
        <link href="../scripts/jqueryUI.css" rel="stylesheet" type="text/css" />
        <link href="../styles/custom.css" rel="stylesheet" type="text/css" />
    </head>
    <body id="pageBody">
        <div id="divBoxed" class="container">
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
                <jsp:include page="menu.jsp"></jsp:include>
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <form name="form1" method="post" action="../creapaciente">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Usuario</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6" ><label >Usuario</label>
                                            <input class="form-control" name="txtusuario" id="txtusuario" placeholder="EJEMPLO@EJEMPLO.COM" onblur="correo(this);">
                                        </div>
                                        <div class="col-md-6" >

                                            <label>Contraseña</label><input name="txtcontra"  id="txtcontra" type="password" class="form-control" placeholder="Password" onblur="validatePas(this);" >
                                            <a>Debe de contener numero, letras en mayusculas y  minusculas</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-primary">
                                <div class="panel-heading">Datos</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6" ><label>Primer Nombre</label><input name="txtnombrep" id="txtnombrep" class="form-control"  placeholder="nombre" onblur="validatePass(this);"></div>
                                        <div class="col-md-6"><label>Segundo Nombre</label><input name="txtnombres" id="txtnombres" class="form-control" placeholder="nombre" ></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6"><label>Primer Apellido</label><input   id="txtapellido" name="txtapellido"    class="form-control"  placeholder="apellido" onblur="validatePass(this);"></div>
                                        <div class="col-md-6"><label>Segundo Apellido</label><input   id="txtapellidos" name= "txtapellidos" class="form-control" placeholder="apellido"  onblur="validatePass(this);"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">Fecha Nacimiento y Genero</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6"><label>Fecha </label><input class="form-control" name="txtfecha" type="date" id="txtfecha" size="10" maxlength="10" > <a>La fecha debe ser menor a la actual</a></div>
                                        <div class="col-md-6"><label>Genero</label><select class="form-control" name="txtgenero"  >
                                                <option value="m">Masculino</option>
                                                <option value="f">Femenino</option>
                                            </select></div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">Iglesia</div>
                                <div class="panel-body">
                                    <label>Iglesia</label><input class="form-control" name="txtigle" type="text" id="txtigle" size="10" maxlength="10" onblur="validatePass(this);" >
                                </div>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">Documento y Telefono</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-6 col-md-2"><label >Documento</label>
                                        </div>
                                        <div class="col-xs-6 col-md-3">
                                            <input class="form-control" name="txtdocu" type="text" id="txtdocu" placeholder="Documento" onblur="docu(this);">
                                        </div>
                                        <div class="col-xs-6 col-md-4"><SELECT class="form-control" name="txttipodocu"   SIZE=1  >
                                                <OPTION VALUE="dui">DUI</OPTION>
                                                <OPTION VALUE="cernet de menor">Carnet de Minoridad</OPTION>
                                                <OPTION VALUE="pasaporte">Pasaporte</OPTION>
                                            </SELECT>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-md-2"><label >Teléfono</label>
                                        </div>
                                        <div class="col-xs-6 col-md-3">
                                            <input class="form-control" name="txtele" type="text" id="txtele"  placeholder="NUMERO TELEFONO" onblur="tele(this);">
                                        </div>
                                        <div class="col-xs-6 col-md-4"><SELECT class="form-control" name="txttipotele"  SIZE=1   >
                                                <OPTION VALUE="fijo">FIJO</OPTION>
                                                <OPTION VALUE="celular">CELULAR</OPTION>
                                                <OPTION VALUE="trabajo">TRABAJO</OPTION>

                                            </SELECT></div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">Direccion</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6"><input name="txtcalle" type="text" id="txtcalle" class="form-control" placeholder="Calle" onblur="validatePass(this);" ></div>
                                        <div class="col-md-6"> <input name="txtcasa" type="text" id="txtcasa" class="form-control" placeholder="Casa" onblur="validatePass(this);" ></div>
                                    </div>
                                    <input name="txtmuni" type="text" id="txtmuni"  class="form-control" placeholder="Casa" onblur="" value="1">
                                </div>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">correo adicional</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6"><input class="form-control" name="correo" type="text" id="correo" placeholder="EJEMPLO@EJEMPLO.COM" onblur="correo(this);" ></div>
                                        <div class="col-md-6"><SELECT name="tipocorreo" class="form-control" SIZE=1   >
                                                <OPTION VALUE="Personal">Personal</OPTION>
                                                <OPTION VALUE="Trabajo">Trabajo</OPTION>

                                            </SELECT></div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-6 col-md-4"></div>
                                <div class="col-xs-6 col-md-4"> <input name="cmdguardar"  class="btn btn-group-lg btn-primary" type="submit" id="cmdguardar" value="Guardar"></div>
                                <div class="col-xs-6 col-md-4"></div>
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
    </body>
</html>