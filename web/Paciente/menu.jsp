<%--
    Document   : menu
    Created on : 02-jul-2014, 11:19:50
    Author     : daMgeL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>

</div>
<div class="navbar navbar-default navbar-static-top">
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
            <li><a href="panel.php">Citas</a></li>
            <li><a href="ofertas.php">Historial Medico</a></li>
            <li><a href="contactar.php">Enviar Notificacion</a></li>
        </ul>

        <form class="navbar-form navbar-right" role="search">
            <a class="btn btn-info btn-large" href="acceso.php" role="button">Entrar</a>
        </form>
    </div>
</div>
