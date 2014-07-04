<%@page import="BEANS.selGrupo"%>
<%@page import="BEANS.sMedicamento"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <title>Clínica Nazareth</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Zaid Archila">
        <script src="../scripts/jquery.min.js" type="text/javascript"></script> 
        <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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



        <div class="col-xs-12 col-sm-6 col-md-12">
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
                                                    <div class="col-xs-6 col-md-4">Código de Producto</div>
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




                                                                        <div class="row"><div class="col-xs-6 col-md-4">fecha ingreso</div>
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

                                                <jsp:useBean id="listaM" scope="request" class="BAL.listaMedicamento" />

                                                <c:set var="list" scope="request" value="${listaM.listado}"/>

                                                <display:table name="list" export="true" id="fila"  class="table table-condensed"  >
                                                    <display:setProperty name="export.rtf.filename" value="example.rtf" />

                                                    <display:column property="idMedica" title="ID" />
                                                    <display:column property="nombreMe" title="Nombre" />
                                                    <display:column property="viAdmon" title="via administracion" />
                                                    <display:column property="presen" title="Presentacion" />
                                                    <display:column property="existencia" title="Existenci" />
                                                    <display:column property="estado" title="Estadomedicamento" />
                                                    <display:column property="subgrupo" title="subgrupo" />
                                                    <display:setProperty name="export.pdf" value="true" />
                                                    <display:column title="Editar">

                                                        <input  type="hidden" id="codigoMed" name="codigoMed" value="${fila.idMedica}" >
                                                        <input  type="hidden" id="nombreMedi" name="codigoMedi" value="${fila.nombreMe}" >
                                                        <a class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg" onClick="kk(${fila.idMedica}, '${fila.nombreMe}');">
                                                            enviar
                                                        </a>
                                                        <input type="BUTTON" value="ENVIAR" POST="SUMIT"/>
                                                    </display:column>

                                                </display:table>
                                                <script type="text/javascript">
            function kk(UUID, nm) {
                document.getElementById('txtaccion').value = UUID;
                document.getElementById('txtnombre').value = nm;

            }
                                                </script>
                                                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                                    <form method="post" action="../srvEntrada">
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <style> .form-control{font-size:1em;height:auto;padding:5px;padding-left:10px}label{padding:5px;font-size:1.4em}</style>
                                                                    <div class="row">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

                                                                        <div class="col-md-6">
                                                                            <h4 class="modal-title" id="myModalLabel">Agregando Medicamento </h4><br>
                                                                            <input name="txtnombre" type="text" id="txtnombre" class="form-control" readonly>
                                                                        </div>
                                                                        <br>
                                                                    </div>
                                                                </div>
                                                                <div class="container">

                                                                    <br>
                                                                    <div class="col-md-8">
                                                                        <input name="txtaccion" type="hidden" id="txtaccion" class="form-control">
                                                                        <br>

                                                                        <div class="form-control">
                                                                            <label for="">Cantidad</label>
                                                                            <input type="text" name="txtCanti" id="txtCanti" class="form-control" placeholder="Nombre" required>

                                                                        </div>
                                                                        <div class="form-control">
                                                                            <label for="">Presentacion</label>
                                                                            <input name="txtpresen" id="txtpresen" type="text" class="form-control" placeholder="Nombre" required>

                                                                        </div>

                                                                        <div class="form-control">
                                                                            <label for="">Precio:</label>
                                                                            <input name="txtPrecio" id="txtFecha" type="text" class="form-control" placeholder="Nombre" required>

                                                                        </div>

                                                                        <div class="form-control">
                                                                            <label for="">Fecha inicio</label>
                                                                            <input name="txtFechaIni" id="txtFecha" type="text" class="form-control" placeholder="Nombre" required>

                                                                        </div>

                                                                        <div class="form-control">
                                                                            <label for="">Fecha caducidad</label>
                                                                            <input name="txtFecha" id="txtFecha" type="text" class="form-control" placeholder="Nombre" required>

                                                                        </div>
                                                                        <div class="form-control">
                                                                            <input type="submit" class="btn btn-primary btn-lg" />
                                                                        </div>
                                                                    </div>

                                                                </div>

                                                            </div>

                                                        </div>
                                                    </form>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <form method="post" action="../srvMedicamento">
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
                                                            <option value="<%= rs.getString("idSubGrupo")%>"><%= rs.getString("nombreSubGrupo")%></option>
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
                                    </form>
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