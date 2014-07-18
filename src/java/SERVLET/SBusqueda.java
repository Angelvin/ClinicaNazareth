/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import BAL.ccbusqueda;
import DAL.MyDatabase;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Angel
 */
@WebServlet(name = "SBusqueda", urlPatterns = {"/SBusqueda"})
public class SBusqueda extends HttpServlet {

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
        String dato;
        dato = request.getParameter("txtdato");
        Connection cnn = MyDatabase.getConection();
        PreparedStatement psta;
        /*el valor debe ser estring*/

        /*List<ccbusqueda> list = new ArrayList<ccbusqueda>(0);
         ResultSet rs = null;*/
        try {
            // String qbusqueda="select (e.idPaciente) as codigo, concat(p.pnombrePer,' ',p.snombrePer) as nombre,concat(p.pApellPer,' ',p.sApellPer) as apellido  from persona as p inner join paciente as e on e.fkpersona=p.idPersona inner join documento as do on p.idPersona=do.fkpersona where do.numero= '123213' ;";
            psta = cnn.prepareStatement(ccbusqueda.busq2);
            psta.setString(1, "123");
            psta.executeUpdate();


            /*  while (rs.next()) {
             ccbusqueda cu = new ccbusqueda();
             cu.setCodigo(rs.getInt("codigo"));
             cu.setNombre(rs.getString("nombre"));
             cu.setApellido(rs.getString("apellido"));

             list.add(cu); }*/

        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }
        HttpSession sesion = request.getSession();
        sesion.setAttribute("datos", dato);
        String route = this.getServletContext().getContextPath() + "/FrmSecretaria/BusquedaPaciente.jsp";
        String url = response.encodeRedirectURL(route);
        response.sendRedirect(url);
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
