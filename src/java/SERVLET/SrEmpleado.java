/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import BAL.Assets;
import CJPA.Cargo;
import CJPA.Correo;
import CJPA.Documento;
import CJPA.Empleado;
import CJPA.Login;
import CJPA.Persona;
import CJPA.Rol;
import CJPA.Telefono;
import CJPA.TipoEmpleado;
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
public class SrEmpleado extends HttpServlet {

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
            Login lg = new Login();
            Persona pr = new Persona();
            Correo cr = new Correo();
            Telefono tl = new Telefono();
            Empleado emple = new Empleado();
            Documento docu = new Documento();
            //para rol

            //insertando Login

            lg.setUsuLogin(request.getParameter("txtUsu"));
            lg.setPassLogin(request.getParameter("txtContra"));
            lg.setFkRol(em.find(Rol.class, 2));

            em.getTransaction().begin();
            em.persist(lg);
            em.getTransaction().commit();


            //para insertar persona

            pr.setPnombrePer(request.getParameter("txtPNombre"));
            pr.setSnombrePer(request.getParameter("txtSNombre"));
            pr.setPApellPer(request.getParameter("txtPApe"));
            pr.setSApellPer(request.getParameter("txtSApe"));
            pr.setFechaNacPer(Date.valueOf(request.getParameter("txtfecha")));
            pr.setSexo(request.getParameter("comboSex"));
            pr.setIglesia("");
            pr.setFkLogin(em.find(Login.class, lg.getIdLogin()));

            em.getTransaction().begin();
            em.persist(pr);
            em.getTransaction().commit();

            //insertando correo

            cr.setCorreo(request.getParameter("txtCorreo"));
            cr.setTipo(request.getParameter("comboTipoCorreo"));
            cr.setFkPersona(em.find(Persona.class, pr.getIdPersona()));


            em.getTransaction().begin();
            em.persist(cr);
            em.getTransaction().commit();

            //Insertando telefono
            tl.setNumero(request.getParameter("txtCel"));
            tl.setTipo(request.getParameter("comboTipoCel"));
            tl.setIdPerson(em.find(Persona.class, pr.getIdPersona()));

            em.getTransaction().begin();
            em.persist(tl);
            em.getTransaction().commit();

            //insertando empleado
            emple.setFkpersona(em.find(Persona.class, pr.getIdPersona()));
            emple.setFkCargo(em.find(Cargo.class, Integer.parseInt(request.getParameter("comboCargo"))));
            emple.setFkTipoemple(em.find(TipoEmpleado.class, Integer.parseInt(request.getParameter("comboTipoE"))));

            em.getTransaction().begin();
            em.persist(emple);
            em.getTransaction().commit();

            //insertando Documento

            docu.setNumero(request.getParameter("txtDocu"));
            docu.setTipo(request.getParameter("comboDocu"));
            docu.setFkpersona(em.find(Persona.class, pr.getIdPersona()));

            em.getTransaction().begin();
            em.persist(docu);
            em.getTransaction().commit();


        } finally {
            out.close();
        }
        out.println(Assets.DisplayExito("Nuevo empleado creado", "/FrmSecretaria/RegistroP.jsp", "80", "1em"));
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
