/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAL.cConexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daMgeL
 */
@WebServlet(name = "PacientePerfil", urlPatterns = {"/PacientePerfil"})
public class PacientePerfil extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String nombre = request.getParameter("txtnombre");
        String nombres = request.getParameter("txtnombres");
        String apellido = request.getParameter("txtapellido");
        String apellidos = request.getParameter("txtapellidos");
        String fecha = request.getParameter("txtfecha");
        String genero = request.getParameter("txtgenero");

        int idpaciente = Integer.parseInt(request.getParameter("codigoCita"));

        String updatepersona = "  update persona set pnombrePer='" + nombre + "', snombrePer='" + nombres + "', pApellPer='" + apellido + "', sApellPer='" + apellidos + "',fechaNacPer='" + fecha + "', sexo='" + genero + "' where idPersona=" + idpaciente;
        PreparedStatement pstm;
        Connection cnn = cConexion.conectar_ds();
        int returnVal;
        try {
            pstm = cnn.prepareStatement(updatepersona);
            returnVal = pstm.executeUpdate();
            out.println(BAL.Assets.DisplayExito("Datos modificados correctamente :)", "Paciente/Perfil.jsp", "100", "2em"));
        } catch (SQLException ex) {
            Logger.getLogger(Paciente.class.getName()).log(Level.SEVERE, null, ex);
        }
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
    }

    protected void doUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
