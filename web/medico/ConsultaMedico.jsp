<%-- 
    Document   : consultaMedico
    Created on : 10-jul-2014, 11:00:47
    Author     : Cesar
--%>

<!DOCTYPE HTML>

<html>
    <head>

        <meta charset="utf-8">
        <title>Clínica Nazareth</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Cesar Cordova">
        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../scripts/panelTabs.css" rel="stylesheet" />
        <link href="../styles/custom.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" charset="utf-8" src="../scripts/bootstrap/css/customtabs.js"></script>

    </head>
    <body>
        <div class="container">
            <div class="divPanel notop nobottom">
                <div class="row-fluid">
                    <div class="span12">
                        <!--Edit Site Name and Slogan here-->
                        <div>
                            <a href="index.html" id="divSiteTitle">Clínica Nazareth</a><br />
                            <a href="index.html" id="divTagLine">¡<span class="camera_full_width">Gestión de Administración</span>!</a>
                        </div>
                    </div>
                    <div class="navbar-form navbar-right" role="search">
                        Bienvenido Dr.:<b> <c:out  value="${userName}"></c:out>
                                <a class="btn btn-link" href="../cerrarSesion.jsp">Cerra Sesion</a></b>
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

                        </div>
                                       </div>

                        <form name="gEmpleado" method="post" action="../SrEmpleado ">
                            <div class="panel-body">

                            <div class="panel panel-info">
                                <div class="panel-heading">Datos generales</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6" ><label>Nº Expediente:</label><input name="txtExp"  id="txtExp" class="form-control"  placeholder="Numero de expediente"></div>
                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6"><label>Nombre</label><input name="txtNombre" id="txtNombre" class="form-control"  placeholder="Nombre de paciente" pattern="[a-z]" required ></div>
                                         <div class="col-md-6"><label>Fecha nacimiento</label> <input  name="txtfecha" type="date" id="txtfecha" class="form-control" required />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6"><label >Genero </label><SELECT class="form-control" NAME="comboSex" id="comboSex" SIZE=1> 
                                                <OPTION VALUE="m">Masculino</OPTION>
                                                <OPTION VALUE="f">Femenino</OPTION>
                                            </SELECT></div>
                                    <div class="col-md-6"><label>Ocupación:</label><input name="txtOcupacion" id="txtNombre" class="form-control"  placeholder="Ocupación del paciente" pattern="[a-z]" required ></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6"><label>Teléfono</label><input name="txtTel" id="txtNombre" class="form-control"  placeholder="Teléfono de paciente" ></div>
                                        <div class="col-md-6"><label>Nombre del Padre o Madre:</label><input name="txtNombreP" id="txtNombreP" class="form-control"  placeholder="Nombre del padre o madre del paciente" pattern="[a-z]" required ></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6"><label>Dirección:</label><input name="txtTel" id="txtDireccion" class="form-control"  placeholder="Dirección del paciente" ></div>
                                        <div class="col-md-6"><label>Iglesia a la que pertenece::</label><input name="txtIglesia" id="txtIglesia" class="form-control"  placeholder="Iglesia a la que pertenece el paciente" pattern="[a-z]" required ></div>
                                    </div>
                                    
                                    <div class="row">
                                         <div class="col-md-6"><label>Fecha</label> <input  name="txtfecha" type="date" id="txtfecha" class="form-control" required />
                                        </div>
                                    </div>
                                    
                                    
                                    </div>


                            </div>
                        
                        <div class="panel panel-info">
                            <div class="panel-heading">Historial Clínico del Paciente</div>
                            <div class="panel-body">
                                <div class="row">
                                 
                                <div class="table-responsive">
                                    <table class="table">
                                        
                                     </table>
                                </div>

                                </div> 
                            </div>
                        </div>
                            
                        <div class="panel panel-info">
                            <div class="panel-heading">Datos Clinicos:</div>
                            <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6" ><label>Temperatura:</label><input name="txtTemp"  id="txtExp" class="form-control"  placeholder="Temperatura de paciente"></div>
                                        <div class="col-md-6"><label>Pulso:</label><input name="txtPulso" id="txtPulso" class="form-control"  placeholder="Pulso de paciente"</div>             
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6"><label>T.A.:</label><input name="txtTA" id="txtTA" class="form-control"  placeholder="T.A. de paciente"</div>
                                        <div class="col-md-6"><label>Peso:</label><input name="txtPeso" id="txtTA" class="form-control"  placeholder="Peso de paciente"</div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6"><label>Consulta por:</label><input name="txtConsulta" id="txtTA" class="form-control"  placeholder="Consulta de paciente"</div>
                                        
                                    </div>
                                    
                                    
                                    </div>
                            </div>
                        </div>
                                
                     </div>
                                
                        <div class="row">
                            <div class="col-xs-6 col-md-4"></div>
                            <div class="col-xs-6 col-md-4"> <input name="cmdguardar"  class="btn btn-group-lg btn-primary" type="submit" id="cmdguardar" value="guardar"></div>
                            <div class="col-xs-6 col-md-4"></div>
                        </div>

                    </form>
                </div>
                        
            <script src="../scripts/jquery.min.js" type="text/javascript"></script>
            <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
            <script src="../scripts/default.js" type="text/javascript"></script>
            <script src="../scripts/modernizr.js" type="text/javascript"></script>

    </body>
</html>