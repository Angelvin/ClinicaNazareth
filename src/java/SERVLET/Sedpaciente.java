/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import BEANS.bedipaciente;
import DAL.MyDatabase;
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
 * @author daMgeL
 */
@WebServlet(name = "Sedpaciente", urlPatterns = {"/Sedpaciente"})
public class Sedpaciente extends HttpServlet {

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

        String nombre = request.getParameter("txtnombre");
        String nombres = request.getParameter("txtnombres");
        String apellido = request.getParameter("txtapellido");
        String apellidos = request.getParameter("txtapellidos");
        String genero = request.getParameter("txtsexo");
        String iglesia = request.getParameter("txtiglesia");
        String fecha = request.getParameter("txtFecha");
        String codigo = request.getParameter("codigoC");


        Connection bdconeccion = MyDatabase.getConection();
        try {
            PreparedStatement st = bdconeccion.prepareStatement(bedipaciente.Edipaciente);
            st.setString(1, nombre);
            st.setString(2, nombres);
            st.setString(3, apellido);
            st.setString(4, apellidos);
            st.setDate(5, Date.valueOf(fecha));
            st.setString(6, genero);
            st.setString(7, iglesia);
            st.setInt(8, Integer.parseInt(codigo));
            st.executeUpdate();
            out.println(DisplayEnvio());

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    private String DisplayEnvio() {
        //METODO QUE RETORNA UN ERROR CON FORMATO(BOOTSTRAP)
        String error = "<link href=\"scripts/bootstrap/css/bootstrap.css\" rel=\"stylesheet\"><style> #login{font-size:2em; width: 60%;margin:auto;margin-top:50px; }</style><div id='login' class='alert alert-success'>'Datos envidos con exito'<br><a href='/ClinicaNazareth/FrmSecretaria/BusquedaPaciente.jsp'>Regresar</a></div>";
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
