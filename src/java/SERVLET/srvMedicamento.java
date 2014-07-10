/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import CJPA.Medicamento;
import CJPA.Subgrupo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Marlon
 */
public class srvMedicamento extends HttpServlet {

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
        EntityManagerFactory emf=Persistence.createEntityManagerFactory("primerejemploPU");
        EntityManager em=emf.createEntityManager();
        String ac=request.getParameter("accion");
        try {
            
           Medicamento md= new Medicamento();
           if (ac.equals("1")){
           md.setNombreMedica(request.getParameter("txtNombreMedica"));
           md.setPresentaMedica(request.getParameter("txtPresen"));
           md.setViaAdmonMedica(request.getParameter("txtViaAdmon"));
           md.setExistenciaMedica(Integer.parseInt(request.getParameter("txtExis")));
           md.setEstadoMedica(request.getParameter("txtEstado"));
           md.setFkSubGrupo(em.find(Subgrupo.class, Integer.parseInt(request.getParameter("cdcombo"))));
           em.getTransaction().begin();
           em.persist(md);
           em.getTransaction().commit();
           out.print("<script>alert('se registro la operacion'); location.href='FrmSecretaria/Ingreso.jsp'</script>");
           } else if(ac.equals("2")){
               md=em.find(Medicamento.class,Integer.parseInt(request.getParameter("codigoMed")));
               em.getTransaction().begin();
               em.remove(md);
               em.getTransaction().commit();
             out.print("<script>alert('Registro Borrado'); location.href='FrmSecretaria/Ingreso.jsp'</script>");  
           } else if (ac.equals("3")){
               md=em.find(Medicamento.class,Integer.parseInt(request.getParameter("codigoMed")));
               em.getTransaction().begin();
               em.merge(md);
               em.getTransaction().commit();
           }
           
        } catch (Exception ex){
            
            out.println("Error"+ ex.getMessage());
            
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
