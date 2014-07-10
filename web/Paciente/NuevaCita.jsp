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
                    $("input[type=date]").datepicker({dateFormat: "yy-mm-dd"});
                }});
        </script>
        <script>
            $(function() {
                $("#cmbEspecialidadID").change(function() {
                    $("#myForm").submit();
                });
            });
            $(function() {
                $("#cmbDoctor").change(function() {
                    $("#myForm").submit();
                });
            });

            $(function() {
                $("#idHorario").change(function() {
                    $("#myForm").submit();
                });
            });
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
                    <%                        HttpSession cmbEspecialidad = request.getSession();
                        cmbEspecialidad.setAttribute("sEspecialidad", request.getParameter("cEspecialidad"));

                        HttpSession cmbDoctor = request.getSession();
                        cmbDoctor.setAttribute("sDoctor", (request.getParameter("cDoctor")));

                    %>
                    <div class="panel panel-success" >
                        <div class="panel panel-heading"><b>Creacion de Cita</b></div>
                        <div class="panel panel-body">
                            <form method="GET" action="NuevaCita.jsp" id="myForm">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <legend><span class="badge">1</span> Eliga una especialidad:</legend>
                                        <%                                            Connection connection2 = cConexion.conectar_ds();
                                            Statement pst2 = connection2.createStatement();
                                            String query2 = "select te.idTipoEmpleado as ID, te.nombreTipoEmp as Nombre from tipo_empleado AS te where te.idTipoEmpleado between 4 and 8";
                                            ResultSet rs2 = null;
                                            try
                                            {
                                                if (cmbEspecialidad.getAttribute("sEspecialidad") == null || cmbEspecialidad.getAttribute("sEspecialidad").equals(""))
                                                {
                                                    rs2 = pst2.executeQuery(query2);
                                                    out.println("<select class='form-control' name='cEspecialidad' id='cmbEspecialidadID'>");
                                                    out.println("<option>Seleccione:</option>");
                                                    while (rs2.next())
                                                    {
                                                        out.println("<option value='" + rs2.getInt("ID") + "'>" + rs2.getString("Nombre") + "</option>");
                                                    }
                                                    out.println("</select>");
                                                } else
                                                {
                                                    out.println("<input type='text' class='form-control well' name='cEspecialidad' value='" + cmbEspecialidad.getAttribute("sEspecialidad") + "' readonly >");
                                                }
                                            } catch (Exception e)
                                            {
                                                System.out.print(e.getMessage());
                                            } finally
                                            {
                                                connection2.close();
                                                pst2.close();
                                            }


                                        %>
                                    </div>
                                    <div class="form-group">
                                        <legend><span class="badge">2</span> Seleccione un medico:</legend>
                                        <%                                            if (cmbEspecialidad.getAttribute("sEspecialidad") == null || cmbEspecialidad.getAttribute("sEspecialidad").equals(""))
                                            {
                                                out.println(BAL.Assets.DisplayError("Primero seleccione una especialidad", "Perfil.jsp", "100", "1.2em"));
                                            } else if (cmbDoctor.getAttribute("sDoctor") != null)
                                            {
                                                out.println("<input type='text' class='form-control well' name='cDoctor' value='" + cmbDoctor.getAttribute("sDoctor") + "' readonly >");
                                            } else
                                            {
                                                Connection connection3 = cConexion.conectar_ds();
                                                Statement pst3 = connection3.createStatement();
                                                String query3 = "SELECT e.idEmpleado as iD,CONCAT( p.pnombrePer,'  ', p.snombrePer, ' ',p.pApellPer ) as Nombre FROM empleado as e, persona as p WHERE e.fkpersona=p.idPersona  and e.fkTipoemple=" + cmbEspecialidad.getAttribute("sEspecialidad");
                                                ResultSet rs3 = null;
                                                try
                                                {
                                                    rs3 = pst3.executeQuery(query3);
                                                    out.println("<select class='form-control' name='cDoctor' id='cmbDoctor'>");
                                                    out.println("<option></option>");
                                                    while (rs3.next())
                                                    {
                                                        out.println("<option value='" + rs3.getInt("ID") + "'> Dr " + rs3.getString("Nombre") + "</option>");
                                                    }
                                                    out.println("</select>");
                                                } catch (Exception e)
                                                {
                                                    System.out.print(e.getMessage());
                                                } finally
                                                {
                                                    connection3.close();
                                                    pst3.close();
                                                }
                                            }
                                        %>
                                    </div>
                                    <div class="form-group">
                                        <legend><span class="badge">3</span> Fechas:</legend>
                                        <input type="date" id="fechaC" name="fecha" class="form-control" min="01-01-2014" value="2014-07-10" onchange="kk();" >
                                    </div>

                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <legend><span class="badge">4</span> Horarios Disponibles:</legend>
                                        <%
                                            if (cmbDoctor.getAttribute("sDoctor") == null || cmbDoctor.getAttribute("sDoctor").equals(""))
                                            {
                                                out.println(BAL.Assets.DisplayError("Seleccione un Dr valido", "/Acceso.jsp", "100", "1.2em"));
                                            } else if (request.getParameter("Horario") != null)
                                            {
                                                out.println("<input type='text' class='form-control well' name='txtiDHorario' value='" + request.getParameter("Horario") + "' readonly >");
                                            } else
                                            {
                                                Connection connection = cConexion.conectar_ds();
                                                Statement pst = connection.createStatement();
                                                String query = "select DISTINCT(h.horaini) as HorasDisponibles, h.idhorario from  horario as h inner join cita as c on h.idhorario=c.fkhorario where h.fkempleado='2' order by HorasDisponibles asc";
                                                ResultSet rs = null;
                                                try
                                                {
                                                    rs = pst.executeQuery(query);
                                                    out.println("<select class='form-control' id='idHorario' name='Horario'");
                                                    out.println("<option></option>");
                                                    while (rs.next())
                                                    {
                                                        out.println("<option value='" + rs.getString("idhorario") + "'>" + rs.getString("HorasDisponibles") + "</option>");
                                                    }
                                                    out.println("</select>");

                                                } catch (Exception e)
                                                {
                                                    System.out.print(e.getMessage());
                                                } finally
                                                {
                                                }

                                            }

                                        %>
                                    </div>
                                    <div class="form-group">
                                        <legend><span class="badge">5</span> Motivo:</legend>
                                        <select class="form-control" id="txtMotivo" onchange="kk2();">
                                            <option value="Primera vez">Primera vez</option>
                                            <option value="Consulta General">Consulta General</option>
                                            <option value="Seguimiento">Seguimiento</option>
                                            <option value="Emergencia">Emergencia</option>
                                            <option value="Otros">Otros</option>
                                        </select>
                                    </div>
                                </div>
                                <script>
                                    function kk() {
                                        document.getElementById('txtfecha').value = document.getElementById("fechaC").value;

                                    }
                                    function kk2() {
                                        document.getElementById('txtSMotivo').value = document.getElementById("txtMotivo").value;

                                    }
                                </script>
                            </form>
                            <div class="col-md-4 well">
                                <form method="POST" action="../CrearCita">
                                    <legend>Los datos de la cita:</legend>
                                    <fieldset>
                                        UIDLOGIN: <input type="text" class="form-control" name="txtLoginID" value="${uidLogin}" readonly>
                                        Dr: <input type="text" name="doctorID" class="form-control" value="<% out.println(request.getParameter("cDoctor"));%>" readonly>
                                        Horario: <input type="text" name="thorario" class="form-control" value="<% out.println(request.getParameter("Horario"));%>" readonly>
                                        Fecha: <input type="text" id="txtfecha" name="fecha" class="form-control" value="<% request.getParameter("fecha");%>" readonly>
                                        Motivo: <input type="text" id="txtSMotivo" name="motivo" class="form-control" value="<% request.getParameter("cMotivo");%>" readonly>
                                        <br><br><br>
                                        <input type="submit" name="setC" class="btn btn-primary btn-lg" value="CrearCita"  POST="SUMIT"/>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
