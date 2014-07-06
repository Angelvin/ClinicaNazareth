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
            String usu = request.getParameter("txtUsu");
            String contra = request.getParameter("txtContra");


            if (usu.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else if (contra.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else {
                lg.setUsuLogin(usu);
                lg.setPassLogin(contra);
                lg.setFkRol(em.find(Rol.class, 2));

                em.getTransaction().begin();
                em.persist(lg);
                em.getTransaction().commit();
            }

            //para insertar persona
            String nombre = request.getParameter("txtPNombre");
            String snombre = request.getParameter("txtSNombre");
            String apellido = request.getParameter("txtPApe");
            String sapellido = request.getParameter("txtSApe");
            String fechan = request.getParameter("txtfecha");
            String genero = request.getParameter("comboSex");
            if (nombre.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else if (snombre.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else if (apellido.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else if (sapellido.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else if (fechan.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else if (genero.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else {


                pr.setPnombrePer(nombre);
                pr.setSnombrePer(snombre);
                pr.setPApellPer(apellido);
                pr.setSApellPer(sapellido);
                pr.setFechaNacPer(Date.valueOf(fechan));
                pr.setSexo(genero);
                pr.setIglesia("");
                pr.setFkLogin(em.find(Login.class, lg.getIdLogin()));

                em.getTransaction().begin();
                em.persist(pr);
                em.getTransaction().commit();
            }
            //insertando correo
            String correo = request.getParameter("txtCorreo");
            String tipoc = request.getParameter("comboTipoCorreo");
            if (correo.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else if (tipoc.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else {

                cr.setCorreo(correo);
                cr.setTipo(tipoc);
                cr.setFkPersona(em.find(Persona.class, pr.getIdPersona()));


                em.getTransaction().begin();
                em.persist(cr);
                em.getTransaction().commit();
            }
            String cel = request.getParameter("txtCel");
            String tipocel = request.getParameter("comboTipoCel");
            //Insertando telefono
            if (cel.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else if (tipocel.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else {
                tl.setNumero(cel);
                tl.setTipo(tipocel);
                tl.setIdPerson(em.find(Persona.class, pr.getIdPersona()));

                em.getTransaction().begin();
                em.persist(tl);
                em.getTransaction().commit();
            }
            //insertando empleado
            String cargo = request.getParameter("comboCargo");
            String tiemp = request.getParameter("comboTipoE");
            if (cargo.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else if (tiemp.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else {
                if (cargo.equals("1")) {
                    emple.setFkpersona(em.find(Persona.class, pr.getIdPersona()));
                    emple.setFkCargo(em.find(Cargo.class, Integer.parseInt(cargo)));
                    emple.setFkTipoemple(em.find(TipoEmpleado.class, Integer.parseInt(tiemp)));

                    em.getTransaction().begin();
                    em.persist(emple);
                    em.getTransaction().commit();

                } else {
                    emple.setFkpersona(em.find(Persona.class, pr.getIdPersona()));
                    emple.setFkCargo(em.find(Cargo.class, Integer.parseInt(cargo)));
                    em.getTransaction().begin();
                    em.persist(emple);
                    em.getTransaction().commit();
                }

            }
            //insertando Documento
            String docum = request.getParameter("txtDocu");
            String tipoDocu = request.getParameter("comboDocu");
            if (docu.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else if (tipoDocu.equals("")) {
                out.println(Assets.DisplayExito("Debe de llenar todos los Cambos", "/ClinicaNazareth/FrmSecretaria/RegistroP.jsp", "80", "1em"));
            } else {
                docu.setNumero(docum);
                docu.setTipo(tipoDocu);
                docu.setFkpersona(em.find(Persona.class, pr.getIdPersona()));

                em.getTransaction().begin();
                em.persist(docu);
                em.getTransaction().commit();
            }

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
