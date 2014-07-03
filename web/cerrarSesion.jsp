<%--
    Document   : cerraSesion
    Created on : 02-jul-2014, 17:13:30
    Author     : daMgeL
--%>

<%


    if (session != null) {
        session.invalidate();
        String route = this.getServletContext().getContextPath() + "/Acceso.jsp";
        String url = response.encodeRedirectURL(route);
        response.sendRedirect(url);
    }

%>
