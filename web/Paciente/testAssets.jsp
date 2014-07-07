<%--
    Document   : testAssets
    Created on : 07-jul-2014, 11:52:40
    Author     : daMgeL
--%>

<%@page import="BAL.Assets"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Testing /BAL/Assets.DisplayError()</title>
        <style>
            body{background-color: #eee6ff;padding: 10px;}
            .container{background-color: #ffffff;border: solid 2px darkgrey;display: block;margin:auto;padding: 20px;width: 90%;}
        </style>
    </head>
    <body>
        <div class="container">
            <h3>Fuente a 2em</h3>
            <% out.println(Assets.DisplayExito("A friendly Succes message WITH 20%", "/Acceso.jsp", "80", "1em"));%>
            <% out.println(Assets.DisplayError("A friendly error message WITH 20%", "/Acceso.jsp", "20", "2em"));%>
            <% out.println(Assets.DisplayError("A friendly error message WITH 40%", "/Acceso.jsp", "40", "2em"));%>
            <% out.println(Assets.DisplayError("A friendly error message WITH 60%", "/Acceso.jsp", "60", "2em"));%>
            <% out.println(Assets.DisplayError("A friendly error message WITH 80%", "/Acceso.jsp", "80", "2em"));%>
            <% out.println(Assets.DisplayError("A friendly error message WITH 100%", "/Acceso.jsp", "100", "2em"));%>
            <h3>Fuente a 1.2em</h3>
            <% out.println(Assets.DisplayError("A friendly error message WITH 20%", "/Acceso.jsp", "20", "1.2em"));%>
            <% out.println(Assets.DisplayError("A friendly error message WITH 40%", "/Acceso.jsp", "40", "1.2em"));%>
            <% out.println(Assets.DisplayError("A friendly error message WITH 60%", "/Acceso.jsp", "60", "1.2em"));%>
            <% out.println(Assets.DisplayError("A friendly error message WITH 80%", "/Acceso.jsp", "80", "1.2em"));%>
            <% out.println(Assets.DisplayError("A friendly error message WITH 100%", "/Acceso.jsp", "100", "1.2em"));%>

        </div>
    </body>
</html>
