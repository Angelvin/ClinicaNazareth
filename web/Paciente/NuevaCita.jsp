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
        <script src="../scripts/modernizr2.6.2.js" type="text/javascript" ></script>

        <script src="../scripts/bootstrap/js/moment.min.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap/js/bootstrap-datetimepicker.es.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <link href="../scripts/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
        <script>
            // fallback para el datepicker con jquery
            Modernizr.load({
                test: Modernizr.inputtypes.date,
                nope: ['http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js', 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.7/jquery-ui.min.js', 'jquery-ui.css'],
                complete: function() {
                    $('input[type=date]').datepicker({
                        dateFormat: 'yy-mm-dd'
                    });
                }

            });</script>
        <script>

            $.fn.datetimepicker.defaults = {
                pickDate: true, //en/disables the date picker
                pickTime: true, //en/disables the time picker
                useMinutes: true, //en/disables the minutes picker
                useSeconds: true, //en/disables the seconds picker
                useCurrent: true, //when true, picker will set the value to the current date/time
                minuteStepping: 1, //set the minute stepping
                minDate: '1 / 1 / 1900', //set a minimum date
                //set a maximum date (defaults to today +100 years)
                showToday: true, //shows the today indicator
                language: 'es', //sets language locale
                defaultDate: "", //sets a default date, accepts js dates, strings and moment objects
                disabledDates: [], //an array of dates that cannot be selected
                enabledDates: [], //an array of dates that can be selected
                useStrict: false, //use "strict" when validating dates
                sideBySide: false, //show the date and time picker side by side
                daysOfWeekDisabled: [0, 6]          //for example use daysOfWeekDisabled: [0,6] to disable weekends
            };</script>
        <script type="text/javascript">
            $(function() {
                $('#datetimepicker5').datetimepicker({
                    pickTime: false,
                    showToday: true,
                    language: 'es',
                    daysOfWeekDisabled: [0, 7]

                });
            });
        </script>
        <script>
            $(function() {
                $('#cmbEspecialidadID').change(function() {
                    $('#myForm').submit();
                });
            });
            $(function() {
                $('#cmbDoctor').change(function() {
                    $('#myForm').submit();
                });
            });
        </script>
        <link href="../scripts/jqueryUI.css" rel="stylesheet" type="text/css" />
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
                            <form method="GET" action="NuevaCita.jsp" id="myForm">
                                <div class="tab-pane active" id="Citas">
                                    <div class="panel panel-info">
                                        <div class="panel-heading"><h3>Nueva Cita</h3> </div>
                                        <div class="panel-body">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-xs-6">
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
                                                                    HttpSession cmbEspecialidad = request.getSession();
                                                                    cmbEspecialidad.setAttribute("sEspecialidad", request.getParameter("cEspecialidad"));

                                                                %>

                                                                <%
                                                                    Connection connection2 = cConexion.conectar_ds();
                                                                    Statement pst2 = connection2.createStatement();
                                                                    String query2 = "select te.idTipoEmpleado as ID, te.nombreTipoEmp as Nombre from tipo_empleado AS te where te.idTipoEmpleado between 4 and 8";
                                                                    ResultSet rs2 = null;
                                                                    try {
                                                                        if (cmbEspecialidad.getAttribute("sEspecialidad") == null || cmbEspecialidad.getAttribute("sEspecialidad").equals("")) {
                                                                            rs2 = pst2.executeQuery(query2);
                                                                            out.println("<select class='form-control' name='cEspecialidad' id='cmbEspecialidadID'>");
                                                                            out.println("<option></option>");
                                                                            while (rs2.next()) {
                                                                                out.println("<option value='" + rs2.getInt("ID") + "'>" + rs2.getString("Nombre") + "</option>");
                                                                            }
                                                                            out.println("</select>");
                                                                        } else {
                                                                            out.println("<p>" + "La especialidad Seleccionada es: " + cmbEspecialidad.getAttribute("sEspecialidad") + "</p>");

                                                                        }
                                                                    } catch (Exception e) {
                                                                        System.out.print(e.getMessage());
                                                                    } finally {
                                                                        connection2.close();
                                                                        pst2.close();
                                                                    }


                                                                %>
                                                            </div>
                                                        </fieldset>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-6">
                                            <fieldset class="well">
                                                <legend><span class="badge">2</span> Seleccione un medico:</legend>
                                                <div class=" col-xs-8">
                                                    <%
                                                        HttpSession cmbDoctor = request.getSession();
                                                        cmbDoctor.setAttribute("sDoctor", request.getParameter("cDoctor"));
                                                    %>

                                                    <%
                                                        if (cmbEspecialidad.getAttribute("sEspecialidad") == null || cmbEspecialidad.getAttribute("sEspecialidad").equals("")) {
                                                            out.println(BAL.Assets.DisplayError("Primero seleccione una especialidad", "/Acceso.jsp", "100", "1.2em"));
                                                        } else {
                                                            Connection connection3 = cConexion.conectar_ds();
                                                            Statement pst3 = connection3.createStatement();
                                                            String query3 = "SELECT e.idEmpleado as iD,CONCAT( p.pnombrePer,'  ', p.snombrePer, ' ',p.pApellPer ) as Nombre FROM empleado as e, persona as p WHERE e.fkpersona=p.idPersona  and e.fkTipoemple=" + cmbEspecialidad.getAttribute("sEspecialidad");
                                                            ResultSet rs3 = null;

                                                            try {
                                                                rs3 = pst3.executeQuery(query3);
                                                                out.println("<p>" + "Los medicos disponibles para:  " + cmbEspecialidad.getAttribute("sEspecialidad") + " son" + "</p>");
                                                                out.println("<select class='form-control' name='cDoctor' id='cmbDoctor'>");
                                                                while (rs3.next()) {
                                                                    out.println("<option value='" + rs3.getInt("ID") + "'> Dr " + rs3.getString("Nombre") + "</option>");
                                                                }
                                                                out.println("</select>");
                                                            } catch (Exception e) {
                                                                System.out.print(e.getMessage());
                                                            } finally {
                                                                connection3.close();
                                                                pst3.close();
                                                            }
                                                        }
                                                    %>
                                                </div>
                                            </fieldset>

                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <fieldset class="well">
                                                <legend><span class="badge">3</span> Seleccione una fecha:</legend>
                                                <div class='col-xs-8'>
                                                    <div class="form-group">
                                                        <div class='input-group date' id='datetimepicker5' data-date-format="DD/MM/YYYY">
                                                            <input type='text' class="form-control" placeholder="Clic en la imagen" />
                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="col-xs-6">
                                            <fieldset class="well">
                                                <legend><span class="badge">4</span> Horarios Disponibles:</legend>

                                                <%
                                                    if (cmbDoctor.getAttribute("sDoctor") == null || cmbDoctor.getAttribute("sDoctor").equals("")) {
                                                        out.println(BAL.Assets.DisplayError("Seleccione un Dr valido", "/Acceso.jsp", "100", "1.2em"));
                                                    } else {
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

                                                    }

                                                %>
                                            </fieldset>

                                        </div>
                                        <input type="submit" name="cmdguardar" class="btn btn-primary btn-lg" value="Crear"  POST="SUMIT"/>

                                    </div>
                                </div>
                            </div>
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
