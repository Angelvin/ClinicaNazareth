/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package libreservlet;

import BAL.cita;
import DAL.cConexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import librebeans.beanCita;

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
        String ac = request.getParameter("accion");
        if (ac.equals("1")) {

        }
        /*String codigo = request.getParameter("codigoCita");
         String fecha = request.getParameter("txtFecha");
         String horario = request.getParameter("txtHorario");
         String correo = request.getParameter("txtCorreo");
         String estado = request.getParameter("txtEstado");
         String nombre= request.getParameter("txtNombre");
         String medico= request.getParameter("txt");*/
        Connection cnn = cConexion.conectar_ds();
      ;
        try {
            /*  PreparedStatement psta = cnn.prepareStatement(beanCita.Actlizar);
            psta.setDate(1, Date.valueOf("2014-06-28"));
            psta.setString(2, "19:00");
            psta.setString(2, "navarrete");
            psta.setInt(3, Integer.parseInt("25"));

            psta.executeUpdate();*/
            
            CallableStatement psta = cnn.prepareCall("{call Actualizarcita(?,?,?,?)}");
       psta.setDate(1, Date.valueOf("2014-06-28"));
            psta.setString(2, "19:00:00");
            psta.setString(3, "navarrete");
            psta.setInt(4, 25);
            
      psta.execute();
    
      psta.close();
            
            

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
