<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@include file="../frementop.jspf" %>
<%@include file="/WEB-INF/jspf/validar.jspf" %>
<head>
    <meta charset="utf-8">
    <title>Clinica Nazareth</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Angel Alvarado">

    <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../scripts/bootstrap/css/contenido.css" rel="stylesheet">
    <script src="../scripts/jquery.min.js" type="text/javascript"></script>
    <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

    <script src="../scripts/bootstrap/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="assets/js/jquery-v1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery-ui.js"></script>
    <script src="assets/js/jquery.validate.js"></script>   
    <script src="assets/js/modernizr2.6.2.js"></script>
    <script src="assets/js/holder.js"></script>
    <script src="assets/js/validarRegEmpleador.js"></script>

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
                if (this.className == "Busquedaespecialidad") {
                    this.className = "";
                    this.value = "";
                }
            });

            $("thead input").blur(function(i) {
                if (this.value == "") {
                    this.className = "Busquedaespecialidad";
                    this.value = asInitVals[$("thead input").index(this)];
                }
            });
        });
    </script>
</head>
<body id="pageBody">
    <div id="divBoxed" class="container">
        <div class="transparent-bg" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: -1;zoom: 1;"></div>
        <div class="divPanel notop nobottom">
            <div class="row-fluid">
                <div class="span12">  
                    <div id="divLogo">
                        <a href="index.html" id="divSiteTitle">Clinica Nazareth</a><br />
                        <a href="index.html" id="divTagLine">Â¡<span class="camera_full_width">GestiÃ³n de AdministraciÃ³n</span>!</a>
                    </div>

                </div>
            </div> 
            <div class="row-fluid">
                <div class="span12">
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <jsp:include page="menu.jsp"></jsp:include>
                <div class="panel panel-primary">
                    <div class="panel-heading">

                    </div>
                    <div class="panel-body">

                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-md-8">Mostrara las consultas programadas por especialidad</div>
                                    <div class="col-xs-6 col-md-4"> <div class="alert alert-info" role="alert">
                                            <a href="../FrmSecretaria/BusquedaPaciente.jsp" class="alert-link">Crear Cita</a>
                                        </div></div>
                                </div>




                            </div>
                        </div>
                    </div>   
                    <div>
                        <table>
                            <!--          LISTADO     -->
                        <jsp:useBean id="estado" scope="request" class="BAL.Confcita" />

                        <c:set var="list" scope="request" value="${estado.listado}"/>


                        <display:table name="list" export="true" id="fila" class="table table-condensed" >
                            <display:header>
                                <input type="hidden" name="especialidad" class="Busquedaespecialidad" class="form-control">
                            </display:header>
                            <display:setProperty name="export.rtf.filename" value="example.rtf"/>

                            <display:column property="paciente" title="Paciente" />
                            <display:column property="motivo" title="Motivo" />
                            <display:column property="especialidad" title="Especiliadad" />
                            <display:column property="medico" title="Medico" />
                            <display:column property="hora" title="Hora" />
                            <display:column property="fecha" title="Fecha" />

                        </display:table>

                    </table>
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
                        Copyright ï¿½ 2014 ClÃ­nica Nazareth. All Rights Reserved.
                    </p>
                    <div class="social_bookmarks"></div>
                </div>
            </div>
        </div>
    </div>
    <br /><br /><br />
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="row">
            <div class="modal-dialog  modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X </button>
                        <h4 class="modal-title" id="myModalLabel">Bloquear Fechas</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <fieldset class="well">
                                <legend><span class="badge">3</span> Seleccione una fecha:</legend>
                                <div class=" col-xs-6">
                                    <input type="date" class="form-control" >
                                </div>
                            </fieldset>
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
        </div>
    </div>

    <script src="../scripts/default.js" type="text/javascript"></script>        
</body>
</html>