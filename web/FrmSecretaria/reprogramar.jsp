<%@page import="BEANS.Bfecha"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DAL.cConexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="BAL.DatoCita"%>
<%@page import="BAL.Ccita"%>
<!DOCTYPE HTML>
<%@include file="/WEB-INF/jspf/validar.jspf" %>
<%@page language="java" session="true" errorPage="../WEB-INF/jspf/ErrorPage.jsp"   %>
<html>
    <head>
        <meta charset="utf-8">
        <title>Clínica Nazareth</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Zaid Archila">
        <link href="../scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../styles/custom.css" rel="stylesheet" type="text/css" />
        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script>
            $(function() {
                $('#cmbDoctorid').change(function() {
                    $('#myform').submit();
                });
            });
        </script>
    </head>
    <body>
        <br><br>
        <div class="container">
            <div class="divPanel notop nobottom">
                <div class="row-fluid">
                    <div class="span12">
                        <div id="divLogo">
                            <a href="index.html" id="divSiteTitle">Clínica Nazareth</a><br />
                            <a href="index.html" id="divTagLine">¡<span class="camera_full_width">Gestión de Administración</span>!</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <jsp:include page="menu.jsp"></jsp:include>
                    <form  id="updateCita" method="post" action="../Sactualizarcita">
                        <div class="panel panel-primary">
                            <div class="panel-heading"> </div>
                            <div class="panel-body">
                                <h1>
                                <% int algo = Integer.parseInt(request.getParameter("codigoCita"));
                                    DatoCita list = Ccita.getPersona(algo);
                                    Bfecha f = Bfecha.getFecha();
                                %>
                            </h1>

                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">Datos Medico</div>
                                        <%
                                            HttpSession cmbDoctor = request.getSession();
                                            cmbDoctor.setAttribute("sDoctor", request.getParameter("cmbDoctors"));
                                        %>
                                        <div class="panel-body">
                                            <label name="lblNombre" > Medico</label>
                                            <%
                                                Connection connection3 = cConexion.conectar_ds();
                                                Statement pst3 = connection3.createStatement();
                                                String query3 = "select (p.pApellPer) as idEmpleado, concat(p.pnombrePer,' ',p.snombrePer,' ',p.pApellPer,' ',p.sApellPer ) as Nombre from empleado as e inner join persona as p on p.idPersona=e.fkpersona inner join cargo as c on c.idCargo=e.fkCargo where c.nombreCargo=" + "'medico'";
                                                ResultSet rs3 = null;
                                                try {
                                                    rs3 = pst3.executeQuery(query3);
                                                    out.println("<select class='form-control' name='cmbDoctors' id='cmbDoctorid'>");
                                                    while (rs3.next()) {
                                                        out.println("<option value='" + rs3.getString("idEmpleado") + "'> Dr " + rs3.getString("Nombre") + "</option>");
                                                    }
                                                    out.println("</select>");
                                                } catch (Exception e) {
                                                    System.out.print(e.getMessage());
                                                } finally {
                                                    connection3.close();
                                                    pst3.close();
                                                }
                                            %>
                                            <label name="lblNombre" > horario </label>
                                            <%
                                                Connection connection = cConexion.conectar_ds();
                                                Statement pst = connection.createStatement();
                                                String query = "select (horaini) as idHora ,(horaini)as hora from horario where fkempleado=" + 2;
                                                ResultSet rs = null;

                                                try {
                                                    rs = pst.executeQuery(query);
                                                    out.println("<p>" + "Los medicos disponibles para:  " + cmbDoctor.getAttribute("sDoctor") + " son" + "</p>");
                                                    out.println("<select class='form-control' name='Horio'>");
                                                    while (rs.next()) {
                                                        out.println("<option value='" + rs.getString("idHora") + "'> " + rs.getString("hora") + "</option>");
                                                    }
                                                    out.println("</select>");
                                                } catch (Exception e) {
                                                    System.out.print(e.getMessage());
                                                } finally {
                                                    connection.close();
                                                    pst.close();
                                                }

                                            %>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">Datos Paciente</div>
                                        <div class="panel-body">
                                            <label name="lblApellido" > nombre </label><input name="txtNombre" value="<%=list.getNombre()%>" class="form-control well-sm"  size="20" readonly />
                                            <label name="lblNombre" >apellido </label><input name="txtApellido" value="<%=list.getApellido()%>"  class="form-control well-sm" size="20" readonly/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">Fecha  y Estado</div>
                                        <div class="panel-body">
                                            <label name="lblNombre" >fecha </label><input type="date" min="<%=f.getFechalo()%>" name="txtFecha" class="form-control" value="<%=list.getFecha()%>" size="20" />
                                            <label name="lblNombre" > estado</label><input name="txtEstado" value="<%=list.getEstado()%>" size="20" class="form-control well-sm"  readonly />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">Correo de paciente</div>
                                        <div class="panel-body">
                                            <input  name="codigoC"  type="hidden" id="codigoC" value="<%=list.getIdcita()%>">
                                            <label name="lblApellido" > correo </label><input name="txtCorreo" value="<%=list.getCorreo()%>" size="20" class="form-control well-sm"  readonly />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <br>
                                <input type="submit" name="cmdguardar" class="btn btn-primary btn-block" value="Reprogramar" POST="SUMIT"/>
                                <br>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div id="footerOuterSeparator"></div>
        <div id="divFooter" class="footerArea shadow">
            <div class="divPanel"><br /><br />
                <div class="row-fluid">
                    <div class="span12">
                        <p class="copyright">
                            Copyright 2014 Clínica Nazareth. All Rights Reserved.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <br /><br />
    </body>
</html>