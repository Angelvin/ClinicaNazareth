/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package libreservlet;

import DAL.cConexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
@WebServlet(name = "cConsulta", urlPatterns = {"/cConsulta"})
public class cConsulta extends HttpServlet {

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
          try {
     String tipo = request.getParameter("cmdguardar");
            int codigo = Integer.parseInt(request.getParameter("codigoCita"));

            Connection cnn = cConexion.conectar_ds();
            PreparedStatement psta;
           
               if (tipo.equals("Consulta")){
               try {
                    psta = cnn.prepareStatement(beanCita.Consulta);
                    psta.setString(1, "Consulta");
                    psta.setInt(2, codigo);
                    psta.executeUpdate();

                } catch (SQLException ex) {
                    out.println(ex.getMessage());
                }


        
               
               }else if(tipo.equals("Confirmar")){
               try {
                    psta = cnn.prepareStatement(beanCita.Consulta);
                    psta.setString(1, "Confirmar");
                    psta.setInt(2, codigo);
                    psta.executeUpdate();

                } catch (SQLException ex) {
                    out.println(ex.getMessage());
                }
               }else if(tipo.equals("cancelar")){
               try {
                    psta = cnn.prepareStatement(beanCita.Consulta);
                    psta.setString(1, "cancelar");
                    psta.setInt(2, codigo);
                    psta.executeUpdate();

                } catch (SQLException ex) {
                    out.println(ex.getMessage());
                }
               };
               } catch (Exception e){
                     //ENVIO A SERVLETS
                    String route = this.getServletContext().getContextPath() + "../indexSecre.jsp";
                    String url = response.encodeRedirectURL(route);

                    response.sendRedirect(url);
    } finally {
            out.close();
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
