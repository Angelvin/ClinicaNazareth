
<!DOCTYPE HTML>
<%@include file="../frementop.jspf" %>
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


        <link href="../scripts/bootstrap/css/datepicker.css" rel="stylesheet" />
        <link href="../scripts/bootstrap/css/slider.css" rel="stylesheet" type="text/css" />


        <link href="../scripts/panelTabs.css" rel="stylesheet" />
        <link href="../styles/custom.css" rel="stylesheet" type="text/css" /> 





    </style>
</head>
<body id="pageBody">
    <div>



        <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <h2>Reprogramar </h2>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 col-md-4">Medico</div>
                                <div class="col-xs-6 col-md-4"><select>
                                        <option value="volvo">Medico1</option>
                                        <option value="saab">Medico2</option>
                                        <option value="mercedes">medico3</option>
                                        <option value="audi">medico4</option>
                                    </select></div>
                                <div class="col-xs-6 col-md-4"></div>

                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 col-md-4">Hora</div>
                                <div class="col-xs-6 col-md-4"><select>
                                        <option value="volvo">8:00</option>
                                        <option value="saab">8:30</option>
                                        <option value="mercedes">9:00</option>
                                        <option value="audi">9:30</option>
                                    </select></div>
                                <div class="col-xs-6 col-md-4"></div>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">

                                <div class="col-xs-6 col-md-4">fecha</div>
                                <div class="col-xs-12 col-sm-6 col-md-8">
                                    <div class="container">
                                        <div class="row">
                                            <div class='col-sm-6'>
                                                <div class="form-group">
                                                    <div class='input-group date' id='datetimepicker5' data-date-format="YYYY/MM/DD">
                                                        <input type='text' class="form-control" />
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <script type="text/javascript">
                                                $(function() {
                                                    $('#datetimepicker5').datetimepicker({
                                                        pickTime: false
                                                    });
                                                });
                                            </script>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


    </div>
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

                                <li class="next"><a href="../sistema/login.jsp">Salir <span class="glyphicon glyphicon-off"></span></a></li>

                                <li class="next"><a href="../FrmSecretaria/Entrada.jsp">Menu <span class="glyphicon glyphicon-tasks"></span></a></li>
                                <li class="next"></li>

                            </ul>


                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-folder-close">
                                                    </span>Citas Programadas</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <div class="panel-body">

                                                <table>

                                                    <!--          LISTADO     -->
                                                    <jsp:useBean id="estado2" scope="request" class="BAL.confimado" />

                                                    <c:set var="list" scope="request" value="${estado2.listado}"/>

                                                    <display:table name="list" export="true" id="fila"  class="table table-condensed"  >
                                                        <display:setProperty name="export.rtf.filename" value="example.rtf" />
                                                        <display:column title="saber">
                                                            <input type="radio">
                                                        </display:column>
                                                        <display:column property="codigo" title="Codigo" />
                                                        <display:column property="nombre" title="Nombre" />
                                                        <display:column property="motivo" title="Motivo" />
                                                        <display:column property="especialidad" title="Especialidad" />
                                                        <display:column property="medico" title="Mèdico" />
                                                        <display:column property="hora" title="Hora" />


                                                        <display:setProperty name="export.pdf" value="true" />

                                                        <display:column title="Editar">
                                                            <a href="javascript:enviar()">
                                                                enviar
                                                            </a>
                                                            <input type="BUTTON" value="ENVIAR" POST="SUMIT"/>
                                                        </display:column>
                                                    </display:table>
                                                </table>
                                            </div>   

                                            <div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-th">
                                                    </span>Cita en Retraso</a>
                                            </h4>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse">
                                            <div class="panel-body">


                                                <table>

                    <!--          LISTADO     -->
                    <jsp:useBean id="estado3" scope="request" class="BAL.tarde" />

                    <c:set var="lista" scope="request" value="${estado3.listado}"/>
                    <ajax:displayTag id="displayTagFrame" ajaxFlag="displayAjax">

                        <display:table name="lista" export="true" id="fila" class="table table-condensed">
                            <display:setProperty name="export.rtf.filename" value="example.rtf"/>
                            <display:column title="saber">
                                <input type="radio">
                            </display:column>
                            <display:column property="codigo" title="Codigo" />

                            <display:column property="nombre" title="Nombre" />


                            <display:column property="medico" title="Mèdico" />
                            <display:column title="Editar">
                                <a href="javascript:enviar()">
                                    enviar
                                </a>
                                <input type="BUTTON" value="ENVIAR" POST="SUMIT"/>
                            </display:column>
                        </display:table>
                    </ajax:displayTag>


                </table>
             </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="glyphicon glyphicon-user">
                                                    </span>Estado de Cita</a>
                                            </h4>
                                        </div>
                                        <div id="collapseThree" class="panel-collapse collapse">
                                            <div class="panel-body">

                                                <table class="table table-bordered">
                    <!--          LISTADO     -->
                    <jsp:useBean id="estado" scope="request" class="BAL.Espera" />
                    <c:set var="lista" scope="request" value="${estado.listado}"/>
                    <ajax:displayTag id="displayTagFrame" ajaxFlag="displayAjax">
                        <display:table name="lista" export="true" id="fila" >
                            <display:setProperty name="export.rtf.filename" value="example.rtf"/>
                            <display:column title="saber" >
                                <input type="radio">
                            </display:column>
                            <display:column property="codigo" title="Codigo" />
                            <display:column property="correocita" title="Correo" />
                            <display:column property="nombre" title="Nombre" />

                            <display:column property="fechasoli" title="Fecha Solicitud" />
                            <display:column property="fecha" title="Fecha" />
                            <display:column property="hora" title="Hora" />
                            <display:column property="estado" title="Estado Cita" />
                            <display:column title="Editar">
                                <form  id="updateCita" method="post" action="actualizarCita.jsp">
                                    <input type="hidden" name="codigoCita" value="${fila.codigo}" >
                                    <input type="submit" class="btn btn-link" value="ENVIAR" POST="SUMIT"/>      
                                </form>
                            </display:column>
                        </display:table>
                    </ajax:displayTag>
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
            </div>
        </div>


    </div>
    <div id="footerOuterSeparator"></div>

    <div id="divFooter" class="footerArea shadow">

        <div class="divPanel"><br /><br />
            <div class="row-fluid">
                <div class="span12">
                    <p class="copyright"> 
                        Copyright © 2014 Clínica Nazareth. All Rights Reserved.
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
    <script src="../scripts/bootstrap/js/bootstrap-slider.js" type="text/javascript"></script>
    <script src="../scripts/modernizr.js" type="text/javascript"></script>

    <script type="text/javascript">
                $('#ex1').slider({
                    formater: function(value) {
                        return 'temperatura: ' + value + '°C';
                    }
                });

                $('#ex2').slider({
                    formater: function(value) {
                        return 'Peso: ' + value + ' Libras';
                    }
                });

                $("#ex1").slider();
                $("#ex1").on('slide', function(slideEvt) {
                    $("#label_temp").text(slideEvt.value);
                });

                $("#ex2").slider();
                $("#ex2").on('slide', function(slideEvt) {
                    $("#label_peso").text(slideEvt.value);
                });

                $("#ex3").slider();
                $("#ex3").on('slide', function(slideEvt) {
                    $("#label_Altura").text(slideEvt.value);
                });
    </script>

    <script src="../scripts/carousel/jquery.carouFredSel-6.2.0-packed.js" type="text/javascript"></script><script type="text/javascript">$('#list_photos').carouFredSel({responsive: true, width: '100%', scroll: 2, items: {width: 320, visible: {min: 2, max: 6}}});</script><script src="../scripts/camera/scripts/camera.min.js" type="text/javascript"></script>
    <script src="../scripts/easing/jquery.easing.1.3.js" type="text/javascript"></script>
    <script type="text/javascript">function startCamera() {
                $('#camera_wrap').camera({fx: 'simpleFade, mosaicSpiralReverse', time: 2000, loader: 'none', playPause: false, navigation: true, height: '38%', pagination: true});
            }
            $(function() {
                startCamera()
            });</script>

    <script src="../scripts/wookmark/js/jquery.wookmark.js" type="text/javascript"></script>
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
    <script src="../scripts/yoxview/yox.js" type="text/javascript"></script>
    <script src="../scripts/yoxview/jquery.yoxview-2.21.js" type="text/javascript"></script>
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