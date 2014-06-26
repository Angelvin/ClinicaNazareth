/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package libreservlet;

import BAL.registrarusuario;
import DAL.cConexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Angel
 */
@WebServlet(name = "sEmpleado", urlPatterns = {"/sEmpleado"})
public class sEmpleado extends HttpServlet {

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
        int rol = Integer.parseInt(request.getParameter("txtrol"));
        String usuario = request.getParameter("txtusuario");
        String contra = request.getParameter("txtcontra");
        String nombre = request.getParameter("txtnombrep");
        String nombres = request.getParameter("txtnombres");
        String apellido = request.getParameter("txtapellido");
        String apellidos = request.getParameter("txtapellidos");
        String fecha = request.getParameter("txtfecha");
        String genero = request.getParameter("txtgenero");
        String igle = request.getParameter("txtigle");
        String docu = request.getParameter("txtdocu");
        String tipodocu = request.getParameter("txttipodocu");
        String tele = request.getParameter("txtele");
        String tipotele = request.getParameter("txttipotele");
        String calle = request.getParameter("txtcalle");
        String casa = request.getParameter("txtcasa");
        int muni = Integer.parseInt(request.getParameter("txtmuni"));
        String correo = request.getParameter("correo");
        String tipocorreo = request.getParameter("tipocorreo");
        int tipoempleado = Integer.parseInt(request.getParameter("txttipempleado"));
        int cargo = Integer.parseInt(request.getParameter("txtcargo"));
       
      
        request.getParameter("cmdguardar");

        Connection bdconeccion = cConexion.conectar_ds();

        /*if (tipo.equals("Guardar")){*/
        try {

            PreparedStatement pst = bdconeccion.prepareStatement(registrarusuario.empleado);
            pst.setInt(1, rol);
            pst.setString(2, usuario);
            pst.setString(3, contra);
            pst.setString(4, nombre);
            pst.setString(5, nombres);
            pst.setString(6, apellido);
            pst.setString(7, apellidos);
            pst.setDate(8, Date.valueOf(fecha));
            pst.setString(9, genero);
            pst.setString(10, igle);
            pst.setString(11, docu);
            pst.setString(12, tipodocu);
            pst.setString(13, tele);
            pst.setString(14, tipotele);
            pst.setString(15, calle);
            pst.setString(16, casa);
            pst.setInt(17, muni);
            pst.setString(18, correo);
            pst.setString(19, tipocorreo);
            pst.setInt(20, cargo);
            pst.setInt(21, tipoempleado);
            pst.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
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
