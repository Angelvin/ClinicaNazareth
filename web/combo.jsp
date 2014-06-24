<%-- 
    Document   : combo
    Created on : 22-jun-2014, 16:29:19
    Author     : Angel
--%>

<%@page import="librebeans.municipio"%>
<%@page import="librebeans.departametos"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <div>

            <select name="cdcombo">
                <option>seleccionar opcion</option>
                <%
                    ResultSet rs = departametos.getdepartamento();
                    while (rs.next()) {


                %>
                <option value="<%= rs.getString("idDep")%>"><%= rs.getString("nombreDepa")%></option>
                <%
                    }

                %>
            </select>
            <div>
                <select name="cmcombo">
                    <option>seleccionar opcion</option>
                    <%
                        ResultSet rst = municipio.getmuni();
                        while (rst.next()) {


                    %>
                    <option value="<%= rst.getString("idmuni")%>"><%= rst.getString("nombreMui")%></option>
                    <%
                        }

                    %>
                </select>


            </div>
        </div>
    </body>
</html>
