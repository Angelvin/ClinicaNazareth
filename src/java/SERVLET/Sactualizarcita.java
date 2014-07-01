/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAL.cConexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import BEANS.beanCita;

/**
 *
 * @author Angel
 */
@WebServlet(name = "Sactualizarcita", urlPatterns = {"/Sactualizarcita"})
public class Sactualizarcita extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
        String ac = request.getParameter("codigoC");

        String fecha = request.getParameter("txtFecha");
        String horario = request.getParameter("txtHorario");
        String medico = request.getParameter("txtNomMedico");
        Connection cnn = cConexion.conectar_ds();

        int val = 0;
        int contar;
        try {

            ResultSet rset = null;
            PreparedStatement sta;
            sta = cnn.prepareStatement(beanCita.validar);

            sta.setDate(1, Date.valueOf(fecha));
            sta.setString(2, horario);
            sta.setString(3, medico);
            rset = sta.executeQuery();
          while (rset.next()) {
               val = Integer.parseInt(rset.getString("idCita"));

            }
            
            rset.close();
            sta.close();
            cnn.close();
            if (val== 0) {
                Logger logger = Logger.getLogger("com.microsoft.sqlserver.jdbc.Statement");
                logger.setLevel(Level.FINER);

                PreparedStatement psta0 = cnn.prepareStatement(beanCita.Actlizar);
                psta0.setDate(1, Date.valueOf(fecha));
                psta0.setString(2, horario);
                psta0.setString(3, medico);
                psta0.setInt(4, Integer.parseInt(ac));
                contar = psta0.executeUpdate();
                System.out.println("UPDATE PROCEDURE RETORNA: " + contar);
            } else {
                String route = this.getServletContext().getContextPath() + "/FrmSecretaria/reprogramar.jsp";
                String url = response.encodeRedirectURL(route);

                response.sendRedirect(url);
                out.println("<script>alert(\"Ya existe cita para ese dia.\"); window.location=\"http://localhost:8080/FrmSecretaria/reprogramar.jsp\";</script>");
            }
            
        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
