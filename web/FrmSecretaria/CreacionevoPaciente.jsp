<%@page import="BEANS.Bfecha"%>
<%@page import="librebeans.municipio"%>
<%@page import="java.sql.ResultSet"%>
?<!DOCTYPE HTML>
<%@page language="java" session="true" errorPage="../WEB-INF/jspf/ErrorPage.jsp"   %>

<html>
    <head>
        <meta charset="utf-8">
        <title>Clínica Nazareth</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Zaid Archila">
        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../styles/custom.css" rel="stylesheet" type="text/css" />

        <%
            Bfecha f = Bfecha.getFecha();
        %>

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
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <form name="form1" method="post" action="../creapaciente">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Usuario</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6" ><label >Usuario</label>
                                            <input class="form-control" name="txtusuario" id="txtusuario" placeholder="ejemplo@ejemplo.com"  type="email" required>
                                        </div>
                                        <div class="col-md-6" >

                                            <label>Contraseña</label><input name="txtcontra"  id="txtcontra" type="password" class="form-control" placeholder="Password" pattern="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" required>
                                            <a>(Entre 8 y 10 caracteres, por lo menos un digito y un alfanumérico, y no puede contener caracteres espaciales)</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-primary">
                                <div class="panel-heading">Datos</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6" ><label>Primer Nombre</label><input name="txtnombrep" id="txtnombrep" class="form-control"  placeholder="nombre" pattern="/([a-z])/" required></div>
                                        <div class="col-md-6"><label>Segundo Nombre</label><input name="txtnombres" id="txtnombres" class="form-control" placeholder="nombre"pattern="/([a-z])/" required></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6"><label>Primer Apellido</label><input   id="txtapellido" name="txtapellido"    class="form-control"  placeholder="apellido" pattern="/([a-z])/" required></div>
                                        <div class="col-md-6"><label>Segundo Apellido</label><input   id="txtapellidos" name= "txtapellidos" class="form-control" placeholder="apellido"  pattern="/([a-z])/" required></div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">Fecha Nacimiento y Genero</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6"><label>Fecha </label><input class="form-control" name="txtfecha" max="<%=f.getFechalo()%>" type="date" id="txtfecha" size="10" maxlength="10" required> <a>La fecha debe ser menor a la actual</a></div>
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
                                    <label>Iglesia</label><input class="form-control" name="txtigle" type="text" id="txtigle" size="10" maxlength="10" pattern="/([a-z])/" required >
                                </div>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">Documento y Telefono</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-6 col-md-2"><label >Documento</label>
                                        </div>
                                        <div class="col-xs-6 col-md-3">
                                            <input class="form-control" name="txtdocu" type="text" id="txtdocu" placeholder="Documento" pattern="/([0-9]|-)/" required>
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
                                            <input class="form-control" name="txtele" type="text" id="txtele"  placeholder="Numero Telefono" pattern="/([0-9]|-)/" required>
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
                                        <div class="col-md-6"><input name="txtcalle" type="text" id="txtcalle" class="form-control" placeholder="Calle" pattern="/([a-z])/" required></div>
                                        <div class="col-md-6"> <input name="txtcasa" type="text" id="txtcasa" class="form-control" placeholder="Casa" pattern="/([a-z])/" required ></div>
                                        <div class="col-md-4"><label>Municipio</label><SELECT class="form-control" NAME="txtmuni" id="txtmuni" SIZE=1> 
                                                <option >Seleccionar opcion</option>
                                                <%
                                                    ResultSet rstm = municipio.getmuni();
                                                    while (rstm.next()) {%>

                                                <option value="<%= rstm.getString("idmuni")%>"><%= rstm.getString("nombreMui")%></option>

                                                <%}

                                                %>
                                            </SELECT></div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">correo adicional</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6"><input class="form-control" name="correo"  id="correo" placeholder="ejemplo@ejemplo.Com" type="email" required ></div>
                                        <div class="col-md-6"><SELECT name="tipocorreo" class="form-control" SIZE=1   >
                                                <OPTION VALUE="Personal">Personal</OPTION>
                                                <OPTION VALUE="Trabajo">Trabajo</OPTION>

                                            </SELECT></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-md-4"></div>
                                <div class="col-xs-6 col-md-4"> <input name="cmdguardar"  class="btn btn-group-lg btn-lg" type="submit" id="cmdguardar" value="Registrar Paciente"></div>
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
                            Copyright 2014 Clínica Nazareth. All Rights Reserved.
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