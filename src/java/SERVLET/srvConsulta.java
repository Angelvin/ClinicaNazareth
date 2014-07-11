/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import CJPA.*;
import java.io.*;
import javax.persistence.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Marlon
 */
public class srvConsulta extends HttpServlet {

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
        //VARIABLES DE SESION QUE TRAEN VALORES DESDE datosPre.jsp
        HttpSession session = request.getSession(true);
        int idcita = (Integer) session.getAttribute("sCitaID");
        int idPaciente = (Integer) session.getAttribute("sPacienteID");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("primerejemploPU");
        EntityManager em = emf.createEntityManager();
        try
        {
            Consulta consul = new Consulta();
            Cita cta = new Cita();
            consul.setPeso(request.getParameter("txtpeso"));
            consul.setTemperatura(request.getParameter("txttemperatura"));
            consul.setTensionalterial(request.getParameter("txttensionarterial"));
            consul.setConsultaPor(request.getParameter("txtconsultapor"));
            consul.setPulso(request.getParameter("txtpulso"));
            consul.setTipoConsulta(request.getParameter("txttipoconsulta"));
            consul.setExamenes(request.getParameter("txtexamen"));
            consul.setSintomasConsulta(request.getParameter("txtsintomas"));
            consul.setFkcita(em.find(Cita.class, Integer.parseInt(request.getParameter(""))));
            consul.setFkDetMedTrata(DetalleMedicina.class, Integer.parseInt(request.getParameter()));

            //agrega consulta
            em.getTransaction().begin();
            em.persist(consul);
            em.getTransaction().commit();
            //actualiza cita
            cta = em.find(Cita.class, Integer.parseInt(request.getParameter("txtIDCita")));
            cta.setEstadoCita("Finalizado");
            em.getTransaction().begin();
            em.merge(cta);
            em.getTransaction().commit();

        } catch (Exception e)
        {
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
