<%--
    Document   : Paciente
    Created on : 02-jul-2014, 10:54:57
    Author     : daMgeL
--%>

<%@page import="org.eclipse.persistence.internal.oxm.schema.model.Include"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String route = this.getServletContext().getContextPath() + "/Acceso.jsp";
    String url = response.encodeRedirectURL(route);
    try {
        if (request.getSession(false) == null) {
            //si no hay session, redirecciona a login
            response.sendRedirect(url);
        } else if (request.getSession().getAttribute("userName").equals("") || request.getSession().getAttribute("uidPaciente").equals("") || request.getSession().getAttribute("uidLogin").equals("")) {
            //si existen sessiiones y hay alguna vacia, redireccionar a login
            response.sendRedirect(url);
        } else {
        }
    } catch (java.lang.NullPointerException ex) {
        response.sendRedirect(url);
    }
%>
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
                <div class="row">
                    <div class="col-md-2">
                    <jsp:include page="leftMenu.jsp"></jsp:include>
                </div>
                <div class="col-md-10">
                    <div class="tab-content">
                        <div class="tab-pane active" id="Citas">
                            <div class="panel panel-info">
                                <div class="panel-heading"><h3>Nueva Cita</h3> </div>
                                <div class="panel-body">
                                    <form method="post" acction="..">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-xs-6">
                                                        <form>
                                                            <fieldset class="well">
                                                                <style>
                                                                    .badge
                                                                    {
                                                                        font-size: 1.5em;
                                                                    }
                                                                </style>
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
                                                    <div class="col-xs-6">
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
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-xs-6">
                                                        <form>
                                                            <fieldset class="well">
                                                                <legend><span class="badge">3</span> Seleccione una fecha:</legend>
                                                                <div class=" col-xs-6">
                                                                    <input type="date" class="form-control" >
                                                                </div>
                                                            </fieldset>
                                                        </form>
                                                    </div>
                                                    <div class="col-xs-6">

                                                        <fieldset class="well">
                                                            <legend><span class="badge">4</span> Horarios Disponibles:</legend>
                                                            <select  class="form-control">
                                                                <option value="volvo">8:00--8:30</option>
                                                                <option value="saab">9:00--9:30</option>
                                                                <option value="mercedes">10:00--10:30</option>
                                                                <option value="audi">11:00--11:30</option>
                                                            </select>
                                                        </fieldset>

                                                    </div>
                                                    <input type="submit" name="cmdguardar" class="btn btn-primary btn-lg" value="Crear"  POST="SUMIT"/>

                                                </div>
                                            </div>
                                        </div>

                                </div>
                                <div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
