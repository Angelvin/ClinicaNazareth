<%--
    Document   : Paciente
    Created on : 02-jul-2014, 10:54:57
    Author     : daMgeL
--%>

<%@page import="org.eclipse.persistence.internal.oxm.schema.model.Include"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" session="true" errorPage="../WEB-INF/jspf/ErrorPage.jsp"   %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../scripts/bootstrap/css/contenido.css" rel="stylesheet">
        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <title>Bienvenido Paciente</title>
        <style>
            .badge{background-color:#0088cc;}
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
