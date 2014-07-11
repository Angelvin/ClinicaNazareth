/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BEANS;

import BAL.Assets;
import DAL.cConexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Angel
 */
@WebServlet(name = "srvSession", urlPatterns = {"/srvSession"})
public class srvSession extends HttpServlet {

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
    private void setSession(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        HttpSession uidPaciente = request.getSession();
        HttpSession uidLogin = request.getSession();
        HttpSession errorCredentialsInvalid = request.getSession();

        String nombreU = null;
        int id_rol = 0;
        int uidPacientev = 0;
        int valLogin = 0;
        try {
            if (request.getParameter("txtuser") == null || request.getParameter("txtpass") == null) {
                //si los valores llegan vacios, meanwhile, do nothing...
            } else {
                Connection cnn = cConexion.conectar_ds();
                ResultSet rset = null;
                PreparedStatement sta;
                sta = cnn.prepareStatement(ingreso.session);
                sta.setString(1, request.getParameter("txtuser"));
                sta.setString(2, request.getParameter("txtpass"));
                rset = sta.executeQuery();

                while (rset.next()) {
                    id_rol = rset.getInt("fkRol");
                    nombreU = rset.getString("usuLogin");
                    uidPacientev = rset.getInt("idLogin");
                    valLogin = rset.getInt("idLogin");

                    session.setAttribute("userName", nombreU);
                    uidPaciente.setAttribute("uidPaciente", uidPacientev);
                    uidLogin.setAttribute("uidLogin", valLogin);
                }
                rset.close();
                sta.close();
                cnn.close();
                if (id_rol == 1) {
                    //ROL ASIGNADO A PACIENTE
                    Assets.RedirectToUrl("/Paciente/Perfil.jsp", response);
                } else if (id_rol == 2) {
                    //ROL ASGINADO A MEDICO
                    Assets.RedirectToUrl("/medico/indexmedico.jsp", response);
                } else if (id_rol == 3) {
                    //ROL ASIGNADO A SECRETARIA
                    Assets.RedirectToUrl("/FrmSecretaria/indexSecre.jsp", response);

                } else {
                    errorCredentialsInvalid.setAttribute("errorCredentialsInvalid", DisplayError());
                    Assets.RedirectToUrl("/Acceso.jsp", response);
                }
            }

        } catch (Exception e) {
            out.println(e);
        } finally {

            out.close();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //Invocando al metodo que procesa la sesion
        setSession(request, response);


    }

    private String DisplayError() {
        //METODO QUE RETORNA UN ERROR CON FORMATO(BOOTSTRAP)
        String error = "<link href=\"scripts/bootstrap/css/bootstrap.css\" rel=\"stylesheet\"><style> #login{font-size:2em; width: 60%;margin:auto;margin-top:50px; }</style><div id='login' class='alert alert-danger'>'Por favor rerifique su usuario y/o contrasenia'<br><a href='/ClinicaNazareth/Acceso.jsp'>Regresar</a></div>";
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
