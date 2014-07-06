<%--
    Document   : Paciente
    Created on : 02-jul-2014, 10:54:57
    Author     : daMgeL
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DAL.cConexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.eclipse.persistence.internal.oxm.schema.model.Include"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/validar.jspf" %>
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
                                                                    <%
                                                                        Connection connection2 = cConexion.conectar_ds();
                                                                        Statement pst2 = connection2.createStatement();
                                                                        String query2 = "select te.idTipoEmpleado as ID, te.nombreTipoEmp as Nombre from tipo_empleado AS te where te.idTipoEmpleado between 4 and 8";
                                                                        ResultSet rs2 = null;
                                                                        try {
                                                                            rs2 = pst2.executeQuery(query2);
                                                                            out.println("<select class='form-control'>");
                                                                            while (rs2.next()) {
                                                                                out.println("<option value='" + rs2.getInt("ID") + "'>" + rs2.getString("Nombre") + "</option>");
                                                                                // out.println(rs.getString("horaini"));
                                                                                //out.println(rs.getString("fkempleado"));
                                                                            }
                                                                            out.println("</select>");
                                                                        } catch (Exception e) {
                                                                            System.out.print(e.getMessage());
                                                                        } finally {
                                                                            connection2.close();
                                                                            pst2.close();
                                                                        }


                                                                    %>
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
                                                            <%
                                                                Connection connection = cConexion.conectar_ds();
                                                                Statement pst = connection.createStatement();
                                                                String query = "select DISTINCT(h.horaini) as HorasDisponibles, h.idhorario from  horario as h inner join cita as c on h.idhorario=c.fkhorario where h.fkempleado='2' order by HorasDisponibles asc";
                                                                ResultSet rs = null;
                                                                try {
                                                                    rs = pst.executeQuery(query);
                                                                    out.println("<select class='form-control'>");
                                                                    while (rs.next()) {
                                                                        out.println("<option value='" + rs.getString("idhorario") + "'>" + rs.getString("HorasDisponibles") + "</option>");
                                                                        // out.println(rs.getString("horaini"));
                                                                        //out.println(rs.getString("fkempleado"));
                                                                    }
                                                                    out.println("</select>");

                                                                } catch (Exception e) {
                                                                    System.out.print(e.getMessage());
                                                                } finally {
                                                                }
                                                            %>
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
