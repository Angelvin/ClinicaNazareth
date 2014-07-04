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
                            <div class="tab-pane active" id="DatosPersonales">
                                <div class="panel panel-success">
                                    <div class="panel-heading"><h3>Datos Personales</h3></div>
                                    <div class="panel-body">
                                        <div class="col-md-12">
                                        <jsp:include page="ListDatosPersonales.jsp"></jsp:include>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>