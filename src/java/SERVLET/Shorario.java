/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import BAL.Assets;
import BAL.registrarusuario;
import BEANS.beanCita;
import DAL.cConexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
@WebServlet(name = "Shorario", urlPatterns = {"/Shorario"})
public class Shorario extends HttpServlet {

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
        String medico = request.getParameter("codigo");
        Connection cnn = cConexion.conectar_ds();
        try {
            int val = 0;
            ResultSet rset = null;
            PreparedStatement sta;
            sta = cnn.prepareStatement(beanCita.validarhorario);

            sta.setInt(1, Integer.parseInt(medico));

            rset = sta.executeQuery();
            while (rset.next()) {
                val = Integer.parseInt(rset.getString("idhorario"));

            }





            if (val == 0) {
                PreparedStatement pst = cnn.prepareStatement(registrarusuario.horario);
                pst.setInt(1, Integer.parseInt(medico));
                pst.executeUpdate();
                out.println(DisplayEnvio());

            } else {
                out.println(Assets.DisplayError(" Ya cuenta con Horario creado ", "/ClinicaNazareth/FrmSecretaria/BusquedaMedico.jsp", "100", "2em"));

            }




        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }
    }

    private String DisplayEnvio() {
        //METODO QUE RETORNA UN ERROR CON FORMATO(BOOTSTRAP)
        String error = "<link href=\"scripts/bootstrap/css/bootstrap.css\" rel=\"stylesheet\"><style> #login{font-size:2em; width: 60%;margin:auto;margin-top:50px; }</style><div id='login' class='alert alert-success'>'Horarios Creados Con exito'<br><a href='/ClinicaNazareth/FrmSecretaria/indexSecre.jsp'>Regresar</a></div>";
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
