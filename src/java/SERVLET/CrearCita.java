/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrearCita</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrearCita at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally
        {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        PrintWriter out = response.getWriter();

        try
        {
            PreparedStatement pstm;
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
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
