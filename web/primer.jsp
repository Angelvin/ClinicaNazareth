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
        <title>JSP Page</title>
    </head>
    <body>

        <form name="session" method="post" action="srvSession">
            <table  class="inicial" >
                <tr>
                    <td style="height: 30px">USUARIO</td>
                    <td style="height: 30px">
                        <input name="txtuser" style="width: 250px" type="text"></td>
                    <td class="frminicial" style="height: 30px">CLAVE</td>
                    <td style="height: 30px">
                        <input name="txtpass" style="width: 150px" type="password">
                    </td>
                    <td style="height: 30px">
                        <input class="bot" name="cmbentrar" style="width: 111px" type="submit" value="ENTRAR">
                        <br>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
