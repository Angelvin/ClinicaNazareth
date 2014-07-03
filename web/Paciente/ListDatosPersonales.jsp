<%--
    Document   : ListaCitas
    Created on : 02-jul-2014, 13:17:01
    Author     : daMgeL
--%>
<%@include file="../frementop.jspf" %>

<table>
    <jsp:useBean id="datos" scope="request" class="BAL.getPacienteController" />

    <c:set var="lista2" scope="request" value="${datos.getListado(uidLogin)}"/>
    <display:table name="lista2" export="true" id="fila"  class="table table-condensed"  >
        <display:setProperty name="export.rtf.filename" value="example.rtf" />
        <display:column property="idPersona" title="idPersona" />
        <display:column property="pnombrePer" title="PrimerNombre" />
        <display:column property="pApellPer" title="PrimerApellido" />
        <display:setProperty name="export.pdf" value="true" />
        <display:column title="Editar">
            <form  id="updateCita" method="POST" action="../Paciente">
                <input type="text" name="codigoCita" class="form-control col-sm-1" value="${fila.idPersona}" readonly>
                <input type="submit" name="cmdguardar" class="btn btn-link btn-lg" value="Confirmar" POST="SUMIT"/>
            </form>
        </display:column>
    </display:table>
</table>