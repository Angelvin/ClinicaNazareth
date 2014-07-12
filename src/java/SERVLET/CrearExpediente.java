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
public class CrearExpediente extends HttpServlet {

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
        HttpSession session = request.getSession(true);

        int PacienteID = (Integer) session.getAttribute("sPacienteID");
        int EmpleadoID = (Integer) session.getAttribute("sEmpleado");

        String InsertExpediente = "INSERT INTO expediente(fkEmpleado, fkpaciente)values(";
        InsertExpediente = InsertExpediente + EmpleadoID + "," + PacienteID + ")";

        PreparedStatement pstm;
        Connection cnn = cConexion.conectar_ds();
        int returnVal;
        try
        {
            pstm = cnn.prepareStatement(InsertExpediente);
            returnVal = pstm.executeUpdate();
            out.println(BAL.Assets.DisplayExito("Expediente Creado correctamente :)", "medico/CitaMedico.jsp", "100", "2em"));
        } catch (SQLException ex)
        {
            out.println(BAL.Assets.DisplayError("Error al crear expediente :{", "medico/CitaMedico.jsp", "100", "2em"));
            Logger.getLogger(Paciente.class.getName()).log(Level.SEVERE, null, ex);
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
