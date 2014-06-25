/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package libreservlet;

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
@WebServlet(name = "creapaciente", urlPatterns = {"/creapaciente"})
public class creapaciente extends HttpServlet {

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
        String nombre = request.getParameter("txtnombrep");
        String nombres = request.getParameter("txtnombres");
        String apellido = request.getParameter("txtapellido");
        String apellidos = request.getParameter("txtapellidos");
        String fecha = request.getParameter("2014-02-12");
        String genero = request.getParameter("m");
        String docu = request.getParameter("txtdocu");
        String tipodocu = request.getParameter("txttipodocu");
        String tele = request.getParameter("txtele");
        String tipotele = request.getParameter("txttipotele");
        String calle = request.getParameter("txtcalle");
        String casa = request.getParameter("txtcasa");
        int muni = Integer.parseInt(request.getParameter("1"));
        String usuario = request.getParameter("txtusuario");
        String contra = request.getParameter("txtcontra");
        String correo = request.getParameter("correo");
        String tipocorreo = request.getParameter("tipocorreo");

        
        try {
            Connection bdconeccion = cConexion.conectar_ds();
            CallableStatement buscador = null;

            String query = "{call registroUsuario(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            Statement stmt = null;
            PreparedStatement pst = bdconeccion.prepareStatement(query);
            pst.setString(1, usuario);
            pst.setString(2, contra);
            pst.setString(3, nombre);
            pst.setString(4, nombres);
            pst.setString(5, apellido);
            pst.setString(6, apellidos);
            pst.setDate(7, Date.valueOf(fecha));
            pst.setString(8, genero);
            pst.setString(9, docu);
            pst.setString(10, tipodocu);
            pst.setString(11, tele);
            pst.setString(12, tipotele);
            pst.setString(13, calle);
            pst.setString(14, casa);
            pst.setInt(15, muni);
            pst.setString(16, correo);
            pst.setString(17, tipocorreo);
           
        
            ResultSet rs = pst.executeQuery();
String route = this.getServletContext().getContextPath() + "/CreacionPaciente.jsp";
                    String url = response.encodeRedirectURL(route);

                    response.sendRedirect(url);
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
