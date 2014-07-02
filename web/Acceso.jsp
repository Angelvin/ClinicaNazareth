<%--
    Document   : primer
    Created on : 31-jul-2013, 20:24:01
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acceso a CLinica Nazareth</title>
        <link href="scripts/bootstrap/css/bootstrap.css" rel="stylesheet">
        <link href="scripts/bootstrap/css/contenido.css" rel="stylesheet">
        <script src="scripts/jquery.min.js" type="text/javascript"></script>
        <script src="scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container" style="margin-top:30px">
            <br>
            <br>
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading"><h3 class="panel-title"><strong>Acceso </strong></h3></div>
                    <div class="panel-body">
                        <form name="session" method="post" action="srvSession">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Ususario</label>
                                <input class="form-control" style="border-radius:0px" name="txtuser" style="width: 250px" type="text" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Contrasenia</label>
                                <input  class="form-control" style="border-radius:0px" name="txtpass" style="width: 150px" type="password" required>
                            </div>
                            <button type="submit" class="btn btn-sm btn-default">Entrar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
