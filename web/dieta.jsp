<%-- 
    Document   : dieta
    Created on : 03-22-2014, 06:10:45 AM
    Author     : joss
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>Clinica Nazareth</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Html5TemplatesDreamweaver.com">

    <link href="scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="scripts/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Icons -->
    <link href="scripts/icons/general/stylesheets/general_foundicons.css" media="screen" rel="stylesheet" type="text/css" />  
    <link href="scripts/icons/social/stylesheets/social_foundicons.css" media="screen" rel="stylesheet" type="text/css" />
    <!--[if lt IE 8]>
        <link href="scripts/icons/general/stylesheets/general_foundicons_ie7.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="scripts/icons/social/stylesheets/social_foundicons_ie7.css" media="screen" rel="stylesheet" type="text/css" />
    <![endif]-->
    <link rel="stylesheet" href="scripts/fontawesome/css/font-awesome.min.css">
    <!--[if IE 7]>
        <link rel="stylesheet" href="scripts/fontawesome/css/font-awesome-ie7.min.css">
    <![endif]-->

    <link href="scripts/carousel/style.css" rel="stylesheet" type="text/css" /><link href="scripts/camera/css/camera.css" rel="stylesheet" type="text/css" />
	<link href="scripts/wookmark/css/style.css" rel="stylesheet" type="text/css" />	<link href="scripts/yoxview/yoxview.css" rel="stylesheet" type="text/css" />

    <link href="http://fonts.googleapis.com/css?family=Syncopate" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Maven+Pro" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Oxygen" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">

    <link href="styles/custom.css" rel="stylesheet" type="text/css" />	
	
</head>
<body id="pageBody">

<div id="divBoxed" class="container">

    <div class="transparent-bg" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: -1;zoom: 1;"></div>

    <div class="divPanel notop nobottom">
            <div class="row-fluid">
                <div class="span12">					

                    <!--Edit Site Name and Slogan here-->
					<div id="divLogo">
                        <a href="index.html" id="divSiteTitle">Clínica Nazarethe</a><br />
                        <a href="index.html" id="divTagLine">¡Bienvenido!</a>
                    </div>

	            </div>
            </div> 
			
            <div class="row-fluid">
                <div class="span12">				
                    <div class="centered_menu">                      
                    <!--Edit Navigation Menu here-->
					<div class="navbar">
                        <button type="button" class="btn btn-navbar-highlight btn-large btn-primary" data-toggle="collapse" data-target=".nav-collapse">
                            NAVIGATION <span class="icon-chevron-down icon-white"></span>
                        </button>
                        <div class="nav-collapse collapse">
                            <ul class="nav nav-pills ddmenu">
                                <li class="dropdown active">
								<a href="inicio.jsp">Inicio</a></li>								
								<li><a href="historia.jsp">Informacion</a></li>
								<li><a href="contact.php">Contáctenos</a></li>
                                <li><a href="contact.php">Salir</a></li>
                            </ul>
                      </div>
                    </div>                     
                    </div>
	            </div>
            </div>

            <div class="row-fluid">
            <div class="span12">

                <div id="headerSeparator"></div>
                <!--Edit Camera Slider here-->


                <div data-src="slider-images/desert.jpg" ></div>
              <div data-src="slider-images/dancer.jpg" >                    </div>
              <div data-src="slider-images/sunset.jpg" >                  </div>
                    <br style="clear:both"/>
                    <div style="margin-bottom:40px"></div>
                    <!--End Camera Slider here-->

              <div id="divHeaderText" class="page-content">
                    <div id="divHeaderLine1">Bienvenido: 
                      <p>&nbsp;</p>
                    </div>
					</br>
                    <div >
                    
                        <FORM name=form action="validar.jsp" method="post">
                          Clinica Nazareth 
                        </FORM>

                </div>
                    <a href="Registro.html">Hacer Cita </a><br />
					<a href="Registro.html">Historial </a><br />
					<a href="Registro.html">Cuadro Medico</a><br />
					<a href="Registro.html">Resultados</a><br />
              </div>
              <a href="Registro.html">Registrate Ya!!! </a><br />                    
              </div>
				<hr>

                <div id="headerSeparator2"></div>						
				
            </div>
        </div>
    </div>
    <div class="shout-box">
      <div class="row-fluid">
        <div class="span3"> <a href="#" class="btn btn-large btn-primary btn-right">¡Haz tu Cita YA !</a> </div>
      </div>
    </div>
  <div id="footerOuterSeparator"></div>

    <div id="divFooter" class="footerArea shadow">

        <div class="divPanel">

            <div class="row-fluid">
                <div class="span3" id="footerArea1">
                
                    <h3>Servicios</h3>

                    <p>Ofrecemos consultas medicas, examenes clinicos y farmacia.</p>
                    
                    <p> 
                        <a href="#" title="Terms of Use">Terms of Use</a><br />
                        <a href="#" title="Privacy Policy">Privacy Policy</a><br />
                        <a href="#" title="FAQ">FAQ</a><br />
                        <a href="#" title="Sitemap">Sitemap</a>
                    </p>

                </div>
                <div class="span3" id="footerArea2">

                    <h3>Servicios Hospitalarios </h3> 
                  
                        <a href="#" title="">Seminarios</a><br />
                        <a href="#" title=""> Consulta externa</a><br />   
                        <a href="#" title="">Nuevos descubrimientos</a><br />
                        <a href="#" title="">Nuevos tratamientos</a>
                    
                </div>
                <div class="span3" id="footerArea3">

                    <h3>Publicaciones</h3> 
                    <p>Aqui encontrara las publicaciones y actividades que se estaran llevando dentro de la clinica.  </p>

                </div>
                <div class="span3" id="footerArea4">

                    <h3>Contactanos</h3>  
                                                               
                    <ul id="contact-info">
                    <li>                                    
                        <i class="general foundicon-phone icon"></i>
                        <span class="field">Telefono:</span>
                        <br />
                        (503) 2280-7069 / 7864-1834                                                                      
                    </li>
                    <li>
                        <i class="general foundicon-mail icon"></i>
                        <span class="field">Email:</span>
                        <br />
                        <a href="mailto:info@yourdomain.com" title="Email">info@yourdomain.com</a>
                    </li>
                    <li>
                        <i class="general foundicon-home icon" style="margin-bottom:50px"></i>
                        <span class="field">Direccion:</span>
                        <br />
                        Colonia Medica Local 50<br />
                        San Salvador
                    </li>
                    </ul>

                </div>
            </div>

            <br /><br />
            <div class="row-fluid">
            <div class="span12">
            <p class="copyright"> 
            Copyright © ASI II. All Rights Reserved.
            </p>

            <div class="social_bookmarks">                    
                <a href="#"><div class="icon_twitter"></div></a>
                <a href="#"><div class="icon_facebook"></div></a>
                <a href="#"><div class="icon_google"></div></a>
                <a href="#"><div class="icon_pinterest"></div></a>                   
            </div>
            </div>
            </div>

        </div>
    </div>
</div>
<br /><br /><br />

</body>
</html>


