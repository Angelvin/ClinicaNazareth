<%-- 
    Document   : validar
    Created on : 03-15-2014, 11:02:37 AM
    Author     : joss
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>validacion</title>
    </head>
    <body>


  <%


   pkgmenu.login p= new pkgmenu.login();


       p.setUsuario(request.getParameter("usuario"));
       p.setpassword(request.getParameter("password"));


       String res=p.insertar3();


if(res.equals("-1")) {
      out.print("entraste clic aqui para entrar");
              %>
<a href="inicio.jsp">entrar ya</a>
<%
      }



       else if (res.equals("1")){
         out.print("fallo la autentificacion ");}


       else{
           out.print("algo pasa ");
           }


                %>
     
    </body>
</html>
