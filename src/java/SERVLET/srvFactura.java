/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SERVLET;

import BEANS.beanFactura;
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
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
/**
 *
 * @author KDSoul
 */
@WebServlet(name = "srvFactura", urlPatterns = {"/srvFactura"})
public class srvFactura extends HttpServlet {
   
    
    

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
            sta = cnn.prepareStatement(beanFactura.update);
            sta.setInt(1,value);
            sta.executeQuery();
            sta.close();
    }catch(Exception e){
    }
    }
    
    
    private void efectivo(int value){
        try{    
        Connection cnn = MyDatabase.getConection();
            PreparedStatement sta;
            sta = cnn.prepareStatement(beanFactura.efectivo);
            sta.setInt(1,value);
            sta.executeQuery();
            sta.close();
    }catch(Exception e){
    }
    }
    private void credito(int value){
        try{    
        Connection cnn = MyDatabase.getConection();
            PreparedStatement sta;
            sta = cnn.prepareStatement(beanFactura.credito);
            sta.executeQuery();
            sta.close();
    }catch(Exception e){
    }
    }
    private void gratis(){
        try{    
        Connection cnn = MyDatabase.getConection();
            PreparedStatement sta = cnn.prepareStatement(beanFactura.gratis);
            sta.executeQuery();
            sta.close();
    }catch(Exception e){
    }
    }
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String pago=request.getParameter("cmbpago");
        int codigo = Integer.parseInt(request.getParameter("txtcodigo"));
        try {
            Connection cnn = MyDatabase.getConection();
            if(pago.equals("Gratis")){
                this.gratis();
                this.update(codigo);
                cnn.close();
            }else if(pago.equals("Efectivo")){
                this.efectivo(codigo);
                this.update(codigo);
                cnn.close();
            }else if(pago.equals("Credito")){
                this.credito(codigo);
                this.update(codigo);
                cnn.close();
            }else{
            response.sendRedirect(this.getServletContext().getContextPath() + "/FrmSecretaria/factura.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect(this.getServletContext().getContextPath() + "/FrmSecretaria/factura.jsp");
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
