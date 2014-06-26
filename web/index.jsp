<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@page import="java.util.*" %>
<%@page import="ajax.logic.productoBo" %>
<%@page import="ajax.bean.productoBean" %>
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
                <select name="productos" onchange="getDetalleProducto(this.value)">
                <%
                    int id_pro;
                    String desc_pro = null;
                    ArrayList lst_pro = new ArrayList();
                    productoBo pro_bo = new productoBo();
                    lst_pro = pro_bo.getProductos();
                    if(lst_pro.size() > 0){
                        for(int i = 0; i<lst_pro.size(); i++){
                            id_pro = ((productoBean)lst_pro.get(i)).getId_pro();
                            desc_pro = ((productoBean)lst_pro.get(i)).getDesc_pro();
                            out.write("<option value=" + id_pro + ">" + desc_pro + "</option>");
                        }
                    }                    
                %>
                </select>
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
