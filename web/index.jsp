<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@page import="java.util.*" %>
<html>
    <head>
        <title>AJAX DEMO</title>
        <Script src="AJAX/ajax_producto.js"></Script>
        <Script src="AJAX/ajax_masDetalle.js"></Script>
    </head>
    <body>
        <table border="0" align="center">
            <tr>
                <td>PRODUCTOS: </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>DETALLE PRODUCTO: </td>
                <td id="result_detalle">
                    <select name="detalle_producto" id="uno">
                    </select>
                </td>
            </tr>

            <tr>
                <td>MAS DETALLE PRODUCTO: </td>
                <td id="result_mas_detalle">
                    <select name="mas_detalle_producto">
                    </select>
                </td>
            </tr>
        </table>
    </body>
</html>
