/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAL.MyDatabase;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daMgeL
 */
public class Paciente extends HttpServlet {

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
        try {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Paciente</title>");
//            out.println("</head>");
//            out.println("<body>");
            out.println("<link href=\"scripts/bootstrap/css/bootstrap.css\" rel=\"stylesheet\"><style> #login{font-size:2em; width: 60%;margin:auto;margin-top:50px; }</style><div id='login' class='alert alert-success'><h1>Cita Aprobada Exitosamente!</h1><br><a href='/ClinicaNazareth/Paciente/Paciente.jsp'>Regresar</a></div>");
//            out.println("</body>");
//            out.println("</html>");
        } finally {
//            out.close();
        }
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

        String UpdateCita = "UPDATE cita SET estadoCita = 'confirmado' WHERE idCita=";
        String codigoCita = request.getParameter("codigoCita");
        UpdateCita = UpdateCita + codigoCita;
        System.out.println("LA QUERY ES: " + UpdateCita);

        int returnVal;
        PreparedStatement pstm;
        Connection cnn = MyDatabase.getConection();
        try {
            pstm = cnn.prepareStatement(UpdateCita);
            returnVal = pstm.executeUpdate();
//            String route = this.getServletContext().getContextPath() + "/Paciente/Paciente.jsp";
//            String url = response.encodeRedirectURL(route);
//            response.sendRedirect(url);
        } catch (SQLException ex) {
            Logger.getLogger(Paciente.class.getName()).log(Level.SEVERE, null, ex);
        }

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
