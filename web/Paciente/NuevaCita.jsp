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
        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
        <script src="../scripts/modernizr2.6.2.js" type="text/javascript" ></script>
        <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap/js/moment.min.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap/js/bootstrap-datetimepicker.es.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <link href="../scripts/jqueryUI.css" rel="stylesheet" type="text/css" />
        <link href="../scripts/bootstrap/css/contenido.css" rel="stylesheet">
        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../scripts/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
        <script>
            // fallback para el datepicker con jquery
            Modernizr.load({test: Modernizr.inputtypes.date, nope: ["http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js", "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.7/jquery-ui.min.js", "jquery-ui.css"], complete: function() {
                    $("input[type=date]").datepicker({dateFormat: "yy-mm-dd"})
                }})
        </script>
        <script type="text/javascript">$(function() {
                $("#datetimepicker5").datetimepicker({pickTime: false, showToday: true, language: "es", daysOfWeekDisabled: [0, 7]})
            })</script>
        <script>
            $(function() {
                $("#cmbEspecialidadID").change(function() {
                    $("#myForm").submit()
                })
            });
            $(function() {
                $("#cmbDoctor").change(function() {
                    $("#myForm").submit()
                })
            })
        </script>
        <script type="text/javascript">
            function kk(UUID, nm) {
                document.getElementById('horario').value = UUID;
                document.getElementById('txtnombre').value = nm;
            }
        </script>
        <title>Bienvenido Paciente</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <div class="col-md-2">
                <jsp:include page="leftMenu.jsp"></jsp:include>
                </div>
                <div class="col-md-10">
                    <div class="tab-content">
                    <%
                        HttpSession cmbEspecialidad = request.getSession();
                        cmbEspecialidad.setAttribute("sEspecialidad", request.getParameter("cEspecialidad"));

                        HttpSession cmbDoctor = request.getSession();
                        cmbDoctor.setAttribute("sDoctor", (request.getParameter("cDoctor")));

                    %>
                    <div class="panel panel-default" >
                        <div class="panel panel-body">
                            <form method="GET" action="NuevaCita.jsp" id="myForm">
                                <div class="form-group">
                                    <legend><span class="badge">1</span> Seleccione una especialidad:</legend>
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
                                                out.println("<input type='text' class='form-control well' name='cEspecialidad' value='" + cmbEspecialidad.getAttribute("sEspecialidad") + "' readonly >");

                                            }
                                        } catch (Exception e) {
                                            System.out.print(e.getMessage());
                                        } finally {
                                            connection2.close();
                                            pst2.close();
                                        }


                                    %>
                                </div>
                                <div class="form-group">
                                    <legend><span class="badge">2</span> Seleccione un medico:</legend>
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

                                                out.println("<select class='form-control' name='cDoctor' id='cmbDoctor'>");
                                                out.println("<option></option>");
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
                                <div class="form-group">
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
                                </div>
                                <div class="form-group">
                                    <legend><span class="badge">3</span> Fechas:</legend>
                                    <div class='input-group date' id='datetimepicker5' data-date-format="DD/MM/YYYY">
                                        <input type='text' class="form-control" placeholder="Clic en la imagen" />
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <legend><span class="badge">5</span> Motivo:</legend>
                                    <select class="form-control">
                                        <option>Seguimiento</option>
                                        <option>Primera vez</option>
                                        <option>Consulta General</option>
                                    </select>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="form-control">
                        <input type="hidden" name="horario" class="form-control" value="<% %>">
                        <input type="hidden" name="pacienteID" class="form-control" value="<% %>">
                        <input type="hidden" name="fecha" class="form-control" value="<% %>">
                        <input type="hidden" name="motivo" class="form-control" value="<% %>">
                        <input type="submit" name="setC" class="btn btn-primary btn-lg" value="CrearCita"  POST="SUMIT"/>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
