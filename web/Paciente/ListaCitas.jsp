<%--
    Document   : ListaCitas
    Created on : 02-jul-2014, 13:17:01
    Author     : daMgeL
--%>
<%@include file="../frementop.jspf" %>

<table>
    <jsp:useBean id="pacientes" scope="request" class="BAL.PacienteController" />

    <c:set var="lista" scope="request" value="${pacientes.getListado(uidPaciente)}"/>
    <display:table name="lista" export="true" id="fila"  class="table table-condensed"  >
        <display:setProperty name="export.rtf.filename" value="example.rtf" />
        <display:column property="idCita" title="Codigo" />
        <display:column property="motivo" title="Motivo" />
        <display:column property="estadoCita" title="Estado cita" />
        <display:setProperty name="export.pdf" value="true" />
        <display:column title="Editar">
            <form  id="updateCita" method="POST" action="../Paciente">
                <input type="hidden" name="codigoCita" class="form-control col-sm-1" value="${fila.idCita}" readonly>
                <input type="submit" name="cmdguardar" class="btn btn-link btn-lg" value="Confirmar" POST="SUMIT"/>
            </form>
        </display:column>
    </display:table>
</table>