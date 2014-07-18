/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SERVLET;
import DAL.MyDatabase;
import BEANS.beanDespacho;
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
import javax.servlet.http.HttpSession;

import javax.servlet.annotation.WebServlet;
/**
 *
 * @author KDSoul
 */
@WebServlet(name = "srvDespacho", urlPatterns = {"/srvDespacho"})
public class srvDespacho extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private void update(int value){
        
        try{    
        Connection cnn = MyDatabase.getConection();
            PreparedStatement sta;
            sta = cnn.prepareStatement(beanDespacho.update);
            sta.setInt(1,value);
            sta.executeQuery();
            sta.close();
    }catch(Exception e){
    }
    }
    
        
        
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        int codigo = Integer.parseInt(request.getParameter("txtcodigo"));
        try {
            Connection cnn = MyDatabase.getConection();
            PreparedStatement sta;
            this.update(codigo);
            sta = cnn.prepareStatement(beanDespacho.salida);
            sta.setInt(1,codigo);
            sta.executeQuery();
            sta.close();
            
            cnn.close();
            
            
            response.sendRedirect(this.getServletContext().getContextPath() + "/FrmSecretaria/Despacho.jsp");
            
        } catch (Exception e) {
            response.sendRedirect(this.getServletContext().getContextPath() + "/FrmSecretaria/Despacho.jsp");
        } finally {

            out.close();
        }
    }

    private String DisplayError() {
        //METODO QUE RETORNA UN ERROR CON FORMATO(BOOTSTRAP)
        String error = "<link href=\"scripts/bootstrap/css/bootstrap.css\" rel=\"stylesheet\"><style> #login{font-size:2em; width: 60%;margin:auto;margin-top:50px; }</style><div id='login' class='alert alert-danger'>'Por favor rerifique su usuario y/o contrasenia'<br><a href='/ClinicaNazareth/Acceso.jsp'>Regresar</a></div>";
        return error;
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
