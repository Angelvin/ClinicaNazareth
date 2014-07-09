<%@page import="BAL.edPaciente" %>
<%@page import="BEANS.bedipaciente" %>
<%@include file="/WEB-INF/jspf/validar.jspf" %>
<%@page language="java" session="true" errorPage="../WEB-INF/jspf/ErrorPage.jsp" %>
<!DOCTYPE HTML>
<html>

    <head>
        <meta charset="utf-8">
        <title>Clínica Nazareth</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Zaid Archila">
        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../styles/custom.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <div id="divBoxed" class="container">
            <div class="transparent-bg" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: -1;zoom: 1;"></div>
            <div class="divPanel notop nobottom">
                <div class="row-fluid">
                    <div class="span12">
                        <!--Edit Site Name and Slogan here-->
                        <div id="divLogo"> <a href="index.html" id="divSiteTitle">Clínica Nazareth</a>
                            <br /> <a href="index.html" id="divTagLine">¡<span class="camera_full_width">Gestión de Administración</span>!</a>
                        </div>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span12"></div>
                </div>
            </div>
            <!--DENTRO DE ESTE DIV CREAR EL FROMULARIO FAVOR NO UTILZAR
TABLAS YA QUE EL FROMULARIO SE AJUSTA AL ESPACIO PARA QUE
PUEDA VERSE EN CUALQUEIR TAMAÑO
            -->
            <div class="col-xs-12 col-sm-12 col-md-12">
                <jsp:include page="menu.jsp"></jsp:include>
                    <div class="panel panel-primary">
                        <div class="panel-heading"></div>
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
                        <form id="updateCita" method="post" action="../Sedpaciente ">
                            <div class="panel panel-default">
                                <div class="panel-heading">Datos</div>
                                <div class="panel-body">
                                    <input name="codigoC" type="hidden" id="codigoC" value="<%=list.getIdpaciente()%>">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Primer Nombre</label>
                                            <input id="txtnombre" name="txtnombre" class="form-control" placeholder="nombre" value="<%=list.getNombre()%>">
                                        </div>
                                        <div class="col-md-6">
                                            <label>Segundo Nombre</label>
                                            <input name="txtnombres" id="txtnombres" class="form-control" placeholder="nombre" value="<%=list.getSnombre()%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Primer Apellido</label>
                                        <input id="txtapellido" name="txtapellido" class="form-control" placeholder="apellido" value="<%=list.getApellido()%>" onblur="validatePass(this);">
                                    </div>
                                    <div class="col-md-6">
                                        <label>Segundo Apellido</label>
                                        <input id="txtapellidos" name="txtapellidos" class="form-control" placeholder="apellido" value=" <%=list.getSapellido()%>" onblur="validatePass(this);">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Genero</label>
                                        <input id="txtsexo" name="txtsexo" class="form-control" placeholder="sexo" value="<%=list.getSexo()%>" onblur="validatePass(this);">
                                    </div>
                                    <div class="col-md-6">
                                        <label>Iglesia</label>
                                        <input id="txtiglesia" name="txtiglesia" class="form-control" placeholder="iglesia" value=" <%=list.getIglesia()%>" onblur="validatePass(this);">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>fecha Nacimiento</label>
                                        <input type="date" id="txtFecha" name="txtFecha" class="form-control" placeholder="sexo" value="<%=list.getFecha()%>" onblur="validatePass(this);"> <a>La fecha debe ser menor a la actual</a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"></div>
                                    <div class="col-md-6">
                                        <input type="submit" name="cmdguardar" class="btn btn-Contol" value="Guardar" POST="SUMIT" />
                                    </div>
                                </div>
                            </div>
                    </div>
                    </form>
                </div>
                <div></div>
            </div>
        </div>
    </div>
    <div id="footerOuterSeparator"></div>
    <div id="divFooter" class="footerArea shadow">
        <div class="divPanel">
            <br />
            <br />
            <div class="row-fluid">
                <div class="span12">
                    <p class="copyright">Copyright ? 2014 Clínica Nazareth. All Rights Reserved.</p>
                    <div class="social_bookmarks"></div>
                </div>
            </div>
        </div>
    </div>
    <script src="../scripts/jquery.min.js" type="text/javascript"></script>
    <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>