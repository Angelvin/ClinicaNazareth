


<%@include file="/WEB-INF/jspf/validar.jspf" %>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clínica Nazareth</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Angel Alvarado">

        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../scripts/bootstrap/css/contenido.css" rel="stylesheet">
        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

        <script src="../scripts/bootstrap/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                /* #txt is display table id & employee_search_ class is field id which you want to filter */
                var oTable = $('#fila').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": true,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": false,
                    "bStateSave": false
                });
                $("thead input").keyup(function() {
                    oTable.fnFilter(this.value, $("thead input").index(this));
                });

                $("thead input").focus(function() {
                    if (this.className == "BusquedaPaciente") {
                        this.className = "";
                        this.value = "";
                    }
                });

                $("thead input").blur(function(i) {
                    if (this.value == "") {
                        this.className = "BusquedaPaciente";
                        this.value = asInitVals[$("thead input").index(this)];
                    }
                });
            });
        </script>
    </head>

    <body>
        <div class="container panel panel-default">
            <div class="divPanel notop nobottom">
                <div class="row-fluid">
                    <div class="span12">
                        <!--Edit Site Name and Slogan here-->
                        <div> <a href="index.jsp" id="divSiteTitle">Clínica Nazareth</a>
                            <br /> <a href="index.jsp" id="divTagLine">¡<span class="camera_full_width">Búsqueda de Paciente</span>!</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <jsp:include page="menu.jsp"></jsp:include>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Pacientes Existentes
                        </div>
                        <div class="panel-body">
                            <div>
                            <%@include file="../frementop.jspf" %>
                            <jsp:useBean id="estado2" scope="request" class="BAL.cbusqueda" />
                            <form name="form1" method="post" action="../SBusqueda">
                                <div>
                                    <table>
                                        <c:set var="list" scope="request" value="${estado2.listado}" />
                                        <display:table name="list" export="true" id="fila" class="table table-condensed" >
                                            <display:header>
                                                <input type="hidden" name="codigo" class="BusquedaPaciente" class="form-control">
                                            </display:header>
                                            <display:setProperty name="export.rtf.filename" value="example.rtf" />
                                            <display:column property="codigo" title="Codigo" />
                                            <display:column property="nombre" title="Nombre" />
                                            <display:column property="apellido" title="Apellido" />
                                            <display:setProperty name="export.pdf" value="true" />
                                            <display:column title="Editar">
                                                <form id="editPaciente" method="GET" action="../FrmSecretaria/editPaciente.jsp ">
                                                    <input type="hidden" name="codigo" value="${fila.codigo}">
                                                    <input type="hidden" name="cmdEdit" class="btn btn-link" value="Modificar" POST="SUMIT" />
                                                </form>
                                                <form id="updateCita" method="GET" action="../FrmSecretaria/editPaciente.jsp?">
                                                    <input type="hidden" name="codigo" value="${fila.codigo}">
                                                    <input type="submit" name="action" class="btn btn-link" value="EditarPaciente" POST="SUMIT" />
                                                </form>
                                                <form id="updateCita" method="GET" action="../FrmSecretaria/Agpaciente.jsp ">
                                                    <input type="hidden" name="codigo" value="${fila.codigo}">
                                                    <input type="submit" name="action" class="btn btn-link" value="Crear Cita" POST="SUMIT" />
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
            <div class="divPanel">
                <br />
                <br />
                <div class="row-fluid">
                    <div class="span12">
                        <p class="copyright">Copyright © 2014 Clinica Nazareth. All Rights Reserved.</p>
                        <div class="social_bookmarks"></div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
    </body>
</html>