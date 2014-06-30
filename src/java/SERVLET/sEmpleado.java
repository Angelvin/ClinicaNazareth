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
        String usuario = request.getParameter("txtUsu");
        String contra = request.getParameter("txtContra");
        String nombre = request.getParameter("txtPNombre");
        String sNombre = request.getParameter("txtSNombre");
        String pApe = request.getParameter("txtPApe");
        String sApe = request.getParameter("txtSApe");
        String fecha = request.getParameter("txtfecha");
        String docu = request.getParameter("txtDocu");
        String TipoDocu = request.getParameter("comboDocu");
        String sexo = request.getParameter("comboSex");
        String cel = request.getParameter("txtCel");
        String tipoCel = request.getParameter("comboTipoCel");
        String correo = request.getParameter("txtCorreo");
        String TipoCorreo = request.getParameter("comboTipoCorreo");
        int cargo = Integer.parseInt(request.getParameter("comboCargo"));
        int tipoEmp = Integer.parseInt(request.getParameter("comboTipoE"));
        String calle = request.getParameter("txtcalle");
        String casa = request.getParameter("txtcasa");
        String muni = request.getParameter("comboMunicipio");
        

        /*   String tipo ="Consulta"; request.getParameter("cmdguardar");*/
        Connection cnn = cConexion.conectar_ds();

        /*if (tipo.equals("Guardar")){*/
        try {

           CallableStatement pst = cnn.prepareCall(registrarusuario.registroEmpleado);
            pst.setInt(1,rol);
             pst.setString(2, usuario);
             pst.setString(3, contra);
             pst.setString(4, nombre);
             pst.setString(5,sNombre);
             pst.setString(6, pApe);
             pst.setString(7,sApe);
             pst.setDate(8, Date.valueOf(fecha));
             pst.setString(9,sexo);
             pst.setString(10,docu);
             pst.setString(11, TipoDocu);
             pst.setString(12, cel);
             pst.setString(13, tipoCel);
             pst.setString(14, calle);
             pst.setString(15, casa);
             pst.setInt(16, Integer.parseInt(muni));
             pst.setString(17, correo);
             pst.setString(18, TipoCorreo);
             pst.setInt(19, cargo);
             pst.setInt(20, tipoEmp);
             pst.executeUpdate();

           /* pst.setInt(1, 2);
            pst.setString(2, "jose");
            pst.setString(3, "angel");
            pst.setString(4, "linares");
            pst.setString(5, "escalante");
            pst.setString(6, "escalante");
            pst.setString(7, "escalante");
            pst.setDate(8, Date.valueOf("2014-04-05"));
            pst.setString(9, "m");
            pst.setString(10, "123245");
            pst.setString(11, "person");
            pst.setString(12, "345678");
            pst.setString(13, "jajsj");
            pst.setString(14, "niidea");
            pst.setString(15, "jdkja");
            pst.setInt(16, Integer.parseInt("1"));
            pst.setString(17, "ghjkl");
            pst.setString(18, "ghjk");
            pst.setInt(19, 2);
            pst.setInt(20, 5);
            pst.executeUpdate();*/

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
