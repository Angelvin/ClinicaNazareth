<%--
    Document   : ListaCitas
    Created on : 02-jul-2014, 13:17:01
    Author     : daMgeL
--%>
<%@include file="../frementop.jspf" %>

<form  id="updateCita" method="GET" action="../PacientePerfil">
    <table>
        <jsp:useBean id="datos" scope="request" class="BAL.getPacienteController" />
        <c:set var="lista" scope="request" value="${datos.getListado(uidLogin)}"/>
        <display:table name="lista" id="fila"  class="table table-condensed" >
            <display:column title="">
                <style> .form-control{font-size:2em;height:auto;padding:5px;padding-left:10px}label{padding:5px;font-size:1.4em}</style>
                <fieldset class="well">
                    <div class="col-md-6">
                        <input type="hidden" name="codigoCita" class="form-control col-sm-1" value="${fila.idPersona}" readonly>
                        <span class="badge">1</span>  <label for="">Primer Nombre</label>
                        <input type="text" class="form-control" name="txtnombre" value="${fila.pnombrePer}" placeholder="" required>
                        <span class="badge">2</span>   <label for="">Segundo Nombre</label>
                        <input type="text" class="form-control" name="txtnombres" value="${fila.snombrePer}" placeholder="" required>
                        <span class="badge">3</span> <label for="">Primer Apellido</label>
                        <input type="text" class="form-control" name="txtapellido" value="${fila.pApellPer}" placeholder="" required>
                    </div>
                    <div class="col-md-6">
                        <span class="badge">4</span> <label for="">Segundo Apellido</label>
                        <input type="text" class="form-control" name="txtapellidos" value="${fila.sApellPer}" placeholder="" required>
                        <span class="badge">5</span> <label for="">Fecha Nacimiento</label>
                        <input type="datepicker" class="form-control" name="txtfecha" value="${fila.fechaNacPer}" placeholder="" required>
                        <span class="badge">6</span>  <label for="">Sexo</label>
                        <select name="txtgenero" id="txtgenero" class="form-control" required>
                            <option value="M">Masculino</option>
                            <option value="F">Femenino</option>
                        </select>
                    </div>
                </fieldset>

                <div class="form-group">
                    <br>
                    <input type="submit" name="cmdguardar" class="btn btn-primary btn-lg" value="Guardar Cambios" POST="SUMIT"/>
                </div>

            </display:column>
        </display:table>
    </table>
</form>