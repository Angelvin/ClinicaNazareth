
<!DOCTYPE HTML>
<%@include file="/WEB-INF/jspf/validar.jspf" %>
<%@include file="../frementop.jspf" %>

<html>
    <head>
        <meta charset="utf-8">
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
                    if (this.className == "Busquedamedico") {
                        this.className = "";
                        this.value = "";
                    }
                });

                $("thead input").blur(function(i) {
                    if (this.value == "") {
                        this.className = "Busquedamedico";
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


                        <!--Edit Site Name and Slogan here-->
                        <div id="divLogo">
                            <a href="index.jsp" id="divSiteTitle">Clínica Nazareth</a><br />
                            <a href="index.jsp" id="divTagLine">¡<span class="camera_full_width">Búsqueda de Paciente</span>!</a>
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
                        <div class="panel-heading">

                        </div>
                        <div class="panel-body">
                            <div>



                                <form name="form1" method="post" action="../SBusqueda">


                                    <div><table>

                                            <!--          LISTADO     -->
                                        <jsp:useBean id="estado" scope="request" class="BEANS.bhorario" />

                                        <c:set var="list" scope="request" value="${estado.listado}"/>

                                        <display:table name="list" export="true" id="fila"  class="table table-condensed" pagesize="10" >
                                            <display:header>
                                                <input type="hidden" name="medico" class="Busquedamedico" class="form-control">
                                            </display:header>
                                            <display:setProperty name="export.rtf.filename" value="example.rtf" />

                                            <display:column property="idempleado" title="Empleado" />
                                            <display:column property="medico" title="Medico" />


                                            <display:setProperty name="export.pdf" value="true" />

                                            <display:column title="Editar">
                                                <form  id="updateCita" method="post" action="../Shorario ">
                                                    <input type="hidden" name="codigo" value="${fila.idempleado}" >
                                                    <input type="submit" name="cmdguardar" class="btn btn-link" value="Crear Horario" POST="SUMIT"/>
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