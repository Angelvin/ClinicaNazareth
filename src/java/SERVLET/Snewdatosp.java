/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import clases.creadas.Persona;
import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Angel
 */
@WebServlet(name = "Snewdatosp", urlPatterns = {"/Snewdatosp"})
public class Snewdatosp extends HttpServlet {

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
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        String numero = request.getParameter("txtnumero");
        String tipo = request.getParameter("txttipo");
        String accion = request.getParameter("cmbvalor");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("primerejemploPU");
        EntityManager em = emf.createEntityManager();

        if (accion.equals("d")) {

//esta parte es la encargada de modificar
            try {
                clases.creadas.Documento ob = new clases.creadas.Documento();
                ob.setNumero(numero);
                ob.setTipo(tipo);
                ob.setFkpersona(em.find(Persona.class, codigo));
                em.getTransaction().begin();
                em.persist(ob);
                em.getTransaction().commit();
            } catch (Exception e) {
                System.out.print("erroe" + e.getMessage());
            }
        } else if (accion.equals("c")) {
            //esta parate es la encargada de insertar...
            try {
                clases.creadas.Correo ob = new clases.creadas.Correo();
                ob.setCorreo(numero);
                ob.setTipo(tipo);
                ob.setFkPersona(em.find(Persona.class, codigo));
                em.getTransaction().begin();
                em.merge(ob);
                em.getTransaction().commit();

            } catch (Exception e) {
                System.out.print("erroe" + e.getMessage());
            }
        } else if (accion.equals("T")) {
            clases.creadas.Telefono ob = new clases.creadas.Telefono();
            ob.setNumero(numero);
            ob.setTipo(tipo);
            ob.setIdPerson(em.find(Persona.class, codigo));
            em.getTransaction().begin();
            em.merge(ob);
            em.getTransaction().commit();

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
