/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package libreservlet;

import librebeans.ingreso;
import DAL.cConexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Angel
 */
@WebServlet(name = "srvSession", urlPatterns = {"/srvSession"})
public class srvSession extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession();


        int id_rol = 0;


        try {
            Connection cnn = cConexion.conectar_ds();
            ResultSet rset = null;
            PreparedStatement sta;
            sta = cnn.prepareStatement(ingreso.session);

            sta.setString(1, request.getParameter("txtuser"));
            sta.setString(2, request.getParameter("txtpass"));
            rset = sta.executeQuery();
            while (rset.next()) {
                id_rol = Integer.parseInt(rset.getString("id_rol"));

            }
            rset.close();
            sta.close();
            cnn.close();
            if (id_rol == 1) {

                String route = this.getServletContext().getContextPath() + "/sistema/adminis.html";
                String url = response.encodeRedirectURL(route);

                response.sendRedirect(url);
            } else {

                out.println("<script>alert(\"Verificar usuario o contraseña.\"); window.location=\"http://localhost:8085/web/sistema/login.jsp\";</script>");
            }
        } catch (Exception e) {
            out.println(e);
        } finally {

            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
