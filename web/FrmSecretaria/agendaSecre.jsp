<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <title>Clinica Nazareth</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Zaid Archila">
        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
        <link href="../styles/custom.css" rel="stylesheet" type="text/css" /> 
        <style>
            .badge
            {
                font-size: 1.5em;
            }
        </style>
    </head>
    <body id="pageBody">
        <div id="divBoxed" class="container">
            <div class="transparent-bg" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: -1;zoom: 1;"></div>
            <div class="divPanel notop nobottom">
                <div class="row-fluid">
                    <div class="span12">  
                        <div id="divLogo">
                            <a href="index.html" id="divSiteTitle">Clinica Nazareth</a><br />
                            <a href="index.html" id="divTagLine">¡<span class="camera_full_width">Gestión de Administración</span>!</a>
                        </div>

                    </div>
                </div> 
                <div class="row-fluid">
                    <div class="span12">
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
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
                        <div class="col-md-2">
                            <br>
                            <ul class="nav nav-pills nav-stacked panel panel-default">
                                <li><a data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-edit"></i> Bloquear Fechas</a></li>
                                <li><a href="#"><i class="glyphicon glyphicon-edit"></i>Bloquear Horarios</a></li>
                                <li>#</li>
                                <li>#</li>
                                <li>#</li>
                            </ul>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <form>
                                            <fieldset class="well">
                                                <legend><span class="badge">1</span> Seleccione una especialidad:</legend>
                                                <div class=" col-xs-6">
                                                    <select class="form-control">
                                                        <option value="volvo">Medicina General</option>
                                                        <option value="saab">Ortoestetica</option>
                                                        <option value="mercedes">Pediatria</option>
                                                    </select>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                    <div class="col-xs-5">
                                        <form>
                                            <fieldset class="well">
                                                <legend><span class="badge">2</span> Seleccione un medico:</legend>
                                                <div class=" col-xs-6">
                                                    <select class="form-control">
                                                        <option value="volvo">Dr John Doe</option>
                                                        <option value="saab">Dr Juan Perez</option>
                                                        <option value="mercedes">Dra Emily Santos</option>
                                                    </select>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                    <div class="col-xs-5">
                                        <form>
                                            <fieldset class="well">
                                                <legend><span class="badge">3</span> Seleccione una fecha:</legend>
                                                <div class=" col-xs-6">
                                                    <input type="date" class="form-control" >
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                    <div class="col-xs-5">
                                        <form>
                                            <fieldset class="well">
                                                <legend><span class="badge">4</span> Horarios Disponibles:</legend>
                                                <select  class="form-control">
                                                    <option value="volvo">8:00--8:30</option>
                                                    <option value="saab">9:00--9:30</option>
                                                    <option value="mercedes">10:00--10:30</option>
                                                    <option value="audi">11:00--11:30</option>
                                                </select>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>   
                    <div>
                        <table class="table table-condensed">
                            <tr>
                                <td>Id</td>
                                <td>Nombre</td>
                                <td>Motivo </td>
                                <td>Especialidad</td>
                                <td>Médico</td>
                                <td>Hora </td>
                            </tr>
                            <tr class="danger">
                                <td>1</td>
                                <td> José
                                    Ángel
                                    Gómez
                                    Álvarado</td>
                                <td>Infeccion </td>
                                <td>General </td>
                                <td>Dra.Cerna </td>
                                <td>8:00 </td>

                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Lili
                                    Ana
                                    Álvarez
                                    Guzmán</td>
                                <td>Dolor de Cabeza</td>
                                <td>General </td>
                                <td>Dr.Rosales </td>
                                <td>8:30 </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Denis
                                    Ingrid   Fuentes     ...</td>
                                <td>Dolor de diente</td>
                                <td>Odontólogo </td>
                                <td>Dr.Salinas</td>
                                <td>9:00 </td>
                            </tr>
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
                            Copyright � 2014 Clínica Nazareth. All Rights Reserved.
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

        <script src="../scripts/jquery.min.js" type="text/javascript"></script> 
        <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../scripts/default.js" type="text/javascript"></script>        
    </body>
</html>