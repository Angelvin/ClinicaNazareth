/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAL.*;
import java.io.*;
import java.sql.*;
import java.util.logging.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author daMgeL
 */
public class CrearCita extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

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

        PrintWriter out = response.getWriter();
        PreparedStatement pstm;

        try
        {
            Date date = Date.valueOf(request.getParameter("fecha"));
            String motivo = request.getParameter("motivo");

            Connection cnn = cConexion.conectar_ds();
            pstm = cnn.prepareStatement(BEANS.beanCita.CrearCita);

            pstm.setDate(1, Date.valueOf(request.getParameter("fecha")));
            pstm.setString(2, "algunCorreo@correo.com");
            pstm.setInt(3, Integer.parseInt(request.getParameter("thorario")));
            pstm.setString(4, request.getParameter("motivo"));
            pstm.setInt(5, Integer.parseInt(request.getParameter("txtLoginID")));
            pstm.executeUpdate();
            out.println(BAL.Assets.DisplayExito("Cita creada correctamente :)", "Paciente/Perfil.jsp", "100", "2em"));
        } catch (SQLException ex)
        {
            System.out.println("El inserte se rompio en: " + ex.getMessage());
        } finally
        {
            Logger.getLogger(CrearCita.class.getName()).log(Level.FINEST, "Loking for a bug: ");
            out.close();

        }

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
        try
        {
            processRequest(request, response);
        } catch (SQLException ex)
        {
            Logger.getLogger(CrearCita.class.getName()).log(Level.SEVERE, null, ex);
        }
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
