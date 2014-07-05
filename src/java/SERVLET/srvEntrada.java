/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import CJPA.Empleado;
import CJPA.Entrada;
import CJPA.Medicamento;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Angel
 */
public class srvEntrada extends HttpServlet {

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
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("primerejemploPU");
        EntityManager em = emf.createEntityManager();
        try {
            Entrada en = new Entrada();
            en.setCantidadEntrada(Integer.parseInt(request.getParameter("txtCanti")));
            en.setPrecioEntrada(Long.parseLong(request.getParameter("txtPrecio")));
            en.setFechaCaducidad(Date.valueOf(request.getParameter("txtFecha")));
            en.setPresentacionEntrada(request.getParameter("txtpresen"));
            en.setFkmedicamento(em.find(Medicamento.class, Integer.parseInt(request.getParameter("txtaccion"))));
            en.setFkEmpleado(em.find(Empleado.class, 2));
            en.setFechain(Date.valueOf(request.getParameter("txtFechaIni")));
            em.getTransaction().begin();
            em.persist(en);
            em.getTransaction().commit();
            out.print("<script>alert('se registro la operacion'); location.href='FrmSecretaria/Ingreso.jsp'</script>");
        } catch (Exception ex) {

            out.println("Error" + ex.getMessage());

        } finally {
            em.close();
            emf.close();
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
