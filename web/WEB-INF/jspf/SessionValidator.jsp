<%-- any content can be specified here e.g.: --%>
<%@ page pageEncoding="UTF-8" %>
<%
    String route = this.getServletContext().getContextPath() + "/Acceso.jsp";
    String url = response.encodeRedirectURL(route);


    //asigning values to variables in order to avoid nullPointerExceptions
    String userName = (String) session.getAttribute("userName");
    //(String) request.getSession().getAttribute("userName");
    //int uidPaciente = (Integer) request.getSession().getAttribute("uidPaciente");
    //int uidLogin = (Integer) request.getSession().getAttribute("uidLogin");

    if (session.getAttribute("userName") == null) {
        //si no hay session, redirecciona a login
        response.sendRedirect(url);
    } /*else if (userName.equals("") || uidPaciente == 0 || uidLogin == 0) {
     //si existen sessiiones y hay alguna vacia, redireccionar a login
     response.sendRedirect(url);
     }*/ else {
        // response.sendRedirect(url);
    }



    /*  try {

     } catch (java.lang.NullPointerException ex) {
     response.sendRedirect(url);
     } finally {
     response.sendRedirect(url);
     } */
%>
