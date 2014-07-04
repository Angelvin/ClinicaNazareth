<%-- 
    Document   : Bienvenida
    Created on : Jul 9, 2014, 9:04:52 AM
    Author     : Cesar
--%>
<%@include file="../frementop.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <div class="navbar-form navbar-right" role="search">
            Bienvenido Dr.:<b> <c:out  value="${userName}"></c:out>
                <a class="btn btn-link" href="../cerrarSesion.jsp">Cerra Sesion</a></b>
        </div>
    </div>
</div>

