/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import BEANS.beanCita;
import DAL.cConexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
 * @author Angel
 */
@WebServlet(name = "SnCita", urlPatterns = {"/SnCita"})
public class SnCita extends HttpServlet {

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
        String ac = request.getParameter("codigoC");
        String correo = request.getParameter("txtCorreo");
        String fecha = request.getParameter("txtFecha");
        String motivo = request.getParameter("txtMotivo");
        String horario = request.getParameter("Horio");
        String medico = request.getParameter("cmbDoctors");
        Connection cnn = cConexion.conectar_ds();

        int val = 0;
        int contar;
        try {

            ResultSet rset = null;
            PreparedStatement sta;
            sta = cnn.prepareStatement(beanCita.validar);

            sta.setDate(1, Date.valueOf(fecha));
            sta.setString(2, horario);
            sta.setString(3, medico);
            rset = sta.executeQuery();
            while (rset.next()) {
                val = Integer.parseInt(rset.getString("idCita"));

            }


            if (val == 0) {
                Logger logger = Logger.getLogger("com.microsoft.sqlserver.jdbc.Statement");
                logger.setLevel(Level.FINER);

                PreparedStatement psta0 = cnn.prepareStatement(beanCita.Ccita);
                psta0.setDate(1, Date.valueOf(fecha));
                psta0.setString(2, correo);
                psta0.setString(3, horario);
                psta0.setString(4, medico);
                psta0.setString(5, motivo);
                psta0.setInt(6, Integer.parseInt(ac));
                contar = psta0.executeUpdate();
                System.out.println("UPDATE PROCEDURE RETORNA: " + contar);
                out.println(DisplayEnvio());
            } else {
                out.println(DisplayError("Ya existe una cita reservada para ese dia!...", "/ClinicaNazareth/FrmSecretaria/BusquedaPaciente.jsp"));
            }
            rset.close();
            sta.close();
            cnn.close();


        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }
    }

    private String DisplayError(String mensajeToDisplay, String urlToRedirect) {
        //METODO QUE RETORNA UN ERROR CON FORMATO(BOOTSTRAP)
        String error = "<link href=\"scripts/bootstrap/css/bootstrap.css\" rel=\"stylesheet\"><style> #login{font-size:2em; width: 60%;margin:auto;margin-top:50px; }</style><div id='login' class='alert alert-danger'> ";
        error = error + mensajeToDisplay;
        error = error + "<br><a href='" + urlToRedirect + "'>Regresar</a></div>";
        return error;
    }

    private String DisplayEnvio() {
        //METODO QUE RETORNA UN ERROR CON FORMATO(BOOTSTRAP)
        String error = "<link href=\"scripts/bootstrap/css/bootstrap.css\" rel=\"stylesheet\"><style> #login{font-size:2em; width: 60%;margin:auto;margin-top:50px; }</style><div id='login' class='alert alert-success'>'La Cita esta creada esperadon confirmacion'<br><a href='/ClinicaNazareth/FrmSecretaria/indexSecre.jsp'>Regresar</a></div>";
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
