<%--
    Document   : Paciente
    Created on : 02-jul-2014, 10:54:57
    Author     : daMgeL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../scripts/bootstrap/css/bootstrap.css" rel="stylesheet">
        <link href="../scripts/bootstrap/css/contenido.css" rel="stylesheet">
        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <title>Bienvenido Paciente</title>
        <style>
            body{background-color: #eee6ff;}
            .container{background-color: #ffffff;border: solid 2px darkgrey;border-radius: 4px;display: block;margin:auto;padding: 20px;width: 90%;}
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
            <%
                String userName = (String) request.getSession().getAttribute("userName");
                Integer uidPaciente = (Integer) request.getSession().getAttribute("uidPaciente");

                if (userName == null) {
                    String route = this.getServletContext().getContextPath() + "/Acceso.jsp";
                    String url = response.encodeRedirectURL(route);
                    response.sendRedirect(url);
                } else if (userName != "") {
                }

            %>
            <div class="well">  Bienvenido :<c:out  value="${userName}"></c:out>
                El UID es:    <c:out value="${uidPaciente}"></c:out> <a class="btn btn-link" href="../cerrarSesion.jsp">Cerra Sesion</a></div>
                <div class="row">
                    <div class="col-md-2">
                        <div class="lista-enlaces">
                            <ul id="myTab">
                                <li class="active"><a class='glyphicon glyphicon-plus' href="#NuevaCita"> Nueva Cita</a></li>
                                <li class=""><a href="#Ofertas">Ver Historial Medico</a></li>
                                <li class=""><a href="#OfertasPublicadas">Inform Personal</a></li>
                                <li class=""><a href="#Aplicacion">Gestionar Parientes</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="tab-content">
                            <div class="tab-pane active" id="Citas">
                                <div class="panel panel-info">
                                    <div class="panel-heading"><h3>Citas Sin Aprobar</h3> </div>
                                    <div class="panel-body">
                                    <jsp:include page="ListaCitas.jsp"></jsp:include>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane active" id="NuevaCita">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Nueva Cita</div>
                                <div class="panel-body">

                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="Ofertas">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Publicar Ofertas</div>
                                <div class="panel-body">

                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="Aplicacion">
                            <div class="panel panel-primary">
                                <div class="panel-heading">APLICACIONES</div>
                                <div class="panel-body">
                                    <div class="col-md-12">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane active" id="OfertasPublicadas">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
