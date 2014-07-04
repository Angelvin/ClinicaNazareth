/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import BAL.Assets;
import BAL.registrarusuario;
import DAL.cConexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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

        String tipo = request.getParameter("cmdguardar");


        Connection bdconeccion = cConexion.conectar_ds();

        if (tipo.equals("Guardar")) {

            try {

                PreparedStatement pst = bdconeccion.prepareStatement(registrarusuario.query);
                pst.setString(1, usuario);
                pst.setString(2, contra);
                pst.setString(3, nombre);
                pst.setString(4, nombres);
                pst.setString(5, apellido);
                pst.setString(6, apellidos);
                pst.setDate(7, Date.valueOf(fecha));
                pst.setString(8, genero);
                pst.setString(9, igle);
                pst.setString(10, docu);
                pst.setString(11, tipodocu);
                pst.setString(12, tele);
                pst.setString(13, tipotele);
                pst.setString(14, calle);
                pst.setString(15, casa);
                pst.setInt(16, muni);
                pst.setString(17, correo);
                pst.setString(18, tipocorreo);
                pst.executeUpdate();


                out.println(DisplayEnvio());


            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        } else if (tipo.equals("Registrar Paciente")) {
            try {

                PreparedStatement pst = bdconeccion.prepareStatement(registrarusuario.query);
                pst.setString(1, usuario);
                pst.setString(2, contra);
                pst.setString(3, nombre);
                pst.setString(4, nombres);
                pst.setString(5, apellido);
                pst.setString(6, apellidos);
                pst.setDate(7, Date.valueOf(fecha));
                pst.setString(8, genero);
                pst.setString(9, igle);
                pst.setString(10, docu);
                pst.setString(11, tipodocu);
                pst.setString(12, tele);
                pst.setString(13, tipotele);
                pst.setString(14, calle);
                pst.setString(15, casa);
                pst.setInt(16, muni);
                pst.setString(17, correo);
                pst.setString(18, tipocorreo);
                pst.executeUpdate();


                out.println(Assets.DisplayExito("Proceso Completo", "/ClinicaNazareth/Acceso.jsp", "80", "1em"));


            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }



        }




    }

    private String DisplayEnvio() {
        //METODO QUE RETORNA UN ERROR CON FORMATO(BOOTSTRAP)
        String error = "<link href=\"scripts/bootstrap/css/bootstrap.css\" rel=\"stylesheet\"><style> #login{font-size:2em; width: 60%;margin:auto;margin-top:50px; }</style><div id='login' class='alert alert-success'>'Se creo un nuevo paciente '<br><a href='/ClinicaNazareth/FrmSecretaria/RegistroP.jsp'>Regresar</a></div>";
        return error;
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
