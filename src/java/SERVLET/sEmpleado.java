/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import BAL.registrarusuario;
import DAL.cConexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Angel
 */
@WebServlet(name = "sEmpleado", urlPatterns = {"/sEmpleado"})
public class sEmpleado extends HttpServlet {

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
        String rol = request.getParameter("txtrol");
        String usuario = request.getParameter("txtUsu");
        String contra = request.getParameter("txtContra");
        String nombre = request.getParameter("txtPNombre");
        String sNombre = request.getParameter("txtSNombre");
        String pApe = request.getParameter("txtPApe");
        String sApe = request.getParameter("txtSApe");
        String fecha = request.getParameter("txtfecha");
        String sexo = request.getParameter("comboSex");
        String docu = request.getParameter("txtDocu");
        String TipoDocu = request.getParameter("comboDocu");
        String cel = request.getParameter("txtCel");
        String tipoCel = request.getParameter("comboTipoCel");
        String calle = request.getParameter("txtcalle");
        String casa = request.getParameter("txtcasa");
        String muni = request.getParameter("comboMunicipio");
        String correo = request.getParameter("txtCorreo");
        String TipoCorreo = request.getParameter("comboTipoCorreo");
        String cargo = request.getParameter("comboCargo");
        String tipoEmp = request.getParameter("comboTipoE");

        /*   String tipo ="Consulta"; request.getParameter("cmdguardar");*/


        /*if (tipo.equals("Guardar")){*/
        
        try {
            if (rol.equals("3")) {
                
                Connection cnn = cConexion.conectar_ds();
                CallableStatement pst = cnn.prepareCall(registrarusuario.empleado);
                
                if (cargo.equals("1")) {
                    out.print("se se perimiete inserta medico en rol administrativa");
                } else {
                    pst.setInt(1, Integer.parseInt(rol));
                    pst.setString(2, usuario);
                    pst.setString(3, contra);
                    pst.setString(4, nombre);
                    pst.setString(5, sNombre);
                    pst.setString(6, pApe);
                    pst.setString(7, sApe);
                    pst.setDate(8, Date.valueOf(fecha));
                    pst.setString(9, sexo);
                    pst.setString(10, docu);
                    pst.setString(11, TipoDocu);
                    pst.setString(12, cel);
                    pst.setString(13, tipoCel);
                    pst.setString(14, calle);
                    pst.setString(15, casa);
                    pst.setInt(16, Integer.parseInt(muni));
                    pst.setString(17, correo);
                    pst.setString(18, TipoCorreo);
                    pst.setInt(19, Integer.parseInt(cargo));
                    pst.executeUpdate();
                    out.println(DisplayEnvio());
                }
            } else if (rol.equals("2")) {
                
                
                Connection cnn = cConexion.conectar_ds();
                CallableStatement pst = cnn.prepareCall(registrarusuario.registroEmpleado);
                
                
                pst.setInt(1, Integer.parseInt(rol));
                pst.setString(2, usuario);
                pst.setString(3, contra);
                pst.setString(4, nombre);
                pst.setString(5, sNombre);
                pst.setString(6, pApe);
                pst.setString(7, sApe);
                pst.setDate(8, Date.valueOf(fecha));
                pst.setString(9, sexo);
                pst.setString(10, docu);
                pst.setString(11, TipoDocu);
                pst.setString(12, cel);
                pst.setString(13, tipoCel);
                pst.setString(14, calle);
                pst.setString(15, casa);
                pst.setInt(16, Integer.parseInt(muni));
                pst.setString(17, correo);
                pst.setString(18, TipoCorreo);
                pst.setInt(19, Integer.parseInt(cargo));
                pst.setInt(20, Integer.parseInt(tipoEmp));
                pst.executeUpdate();
                out.println(DisplayEnvio());
                
                
                
                
                
            }
            
            
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        
        
    }
    
    private String DisplayEnvio() {
        //METODO QUE RETORNA UN ERROR CON FORMATO(BOOTSTRAP)
        String error = "<link href=\"scripts/bootstrap/css/bootstrap.css\" rel=\"stylesheet\"><style> #login{font-size:2em; width: 60%;margin:auto;margin-top:50px; }</style><div id='login' class='alert alert-success'>'Se creo un nuevo empleado'<br><a href='/ClinicaNazareth/FrmSecretaria/RegistroP.jsp'>Regresar</a></div>";
        return error;
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
