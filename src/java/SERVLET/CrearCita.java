/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import BEANS.*;
import DAL.*;
import java.io.*;
import java.sql.Date;
import java.sql.*;
import java.util.*;
import java.util.logging.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author daMgeL
 */
public class CrearCita extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession(true);
        String usuarioName = (String) sesion.getAttribute("userName");

        if (request.getParameter("fecha") == null || request.getParameter("thorario") == null || request.getParameter("motivo") == null || request.getParameter("txtLoginID") == null) {
            out.println(BAL.Assets.DisplayError("No se admiten parametros nulos", "Paciente/NuevaCita.jsp", "100", "2em"));
        } else {
            //para email
            final String username = "ClinicaNazarethES@gmail.com";
            final String password = "clinica1";

            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            Session session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, password);
                        }
                    });

            //termina email
            try {
                PreparedStatement pstm;

                Date date = Date.valueOf(request.getParameter("fecha"));
                int horario = Integer.parseInt(request.getParameter("thorario"));

                Connection cnn = MyDatabase.getConection();
                int val = 0;

                ResultSet rset = null;
                PreparedStatement sta;
                sta = cnn.prepareStatement(beanCita.validaCitapaciente);
                sta.setDate(1, date);
                sta.setInt(2, horario);

                rset = sta.executeQuery();
                while (rset.next()) {
                    val = Integer.parseInt(rset.getString("idCita"));

                }

                if (val == 0) {
                    pstm = cnn.prepareStatement(BEANS.beanCita.CrearCita, Statement.RETURN_GENERATED_KEYS);
                    String fecha = request.getParameter("fecha");
                    pstm.setDate(1, Date.valueOf(request.getParameter("fecha")));
                    pstm.setString(2, "algunCorreo@correo.com");
                    pstm.setInt(3, Integer.parseInt(request.getParameter("thorario")));
                    pstm.setString(4, request.getParameter("motivo"));
                    pstm.setInt(5, Integer.parseInt(request.getParameter("txtLoginID")));

                    pstm.executeUpdate();
                    out.println(BAL.Assets.DisplayExito("Cita creada correctamente :)", "Paciente/Perfil.jsp", "100", "2em"));

                    int idC = -1;
                    rset = pstm.getGeneratedKeys();
                    while (rset.next()) {
                        idC = rset.getInt(1);
                    }
                    out.println(idC);
                    //armando EMAIL
                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress("ClinicaNazarethES@gmail.com"));
                    message.setRecipients(Message.RecipientType.TO,
                            InternetAddress.parse(usuarioName));
                    message.setSubject("Confirmacion Cita");
                    message.setContent(" <body>\n"
                            + "        <h1>Clinica Nazareth</h1>\n"
                            + "        <p>Buen dia estimado usuario: </p>\n"
                            + "        <p>El proposito de este correo, es informarle acerca de que usted a programado una cita para el dia: " + fecha + "</p>\n"
                            + "        <p>Favor confirmar su cita haciendo click sobre  confirmar, en la parte inferior de este mensaje.</p>\n"
                            + "        <p></p>\n"
                            + "   <a href='http://localhost:8080/ClinicaNazareth/srvCambioEstado?idCita=" + idC + "'>Confirma</a> </body>", "text/html; charset=ISO-8859-1");

                    Transport.send(message);

                    out.println("Hecho");
                } else {
                    out.println("nose puede");
                }

                rset.close();
                sta.close();
                cnn.close();
            } catch (Exception ex) {
                System.out.println("El inserte se rompio en: " + ex.getMessage());
            } finally {
                Logger.getLogger(CrearCita.class.getName()).log(Level.FINEST, "Loking for a bug: ");
                out.close();

            }

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CrearCita.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CrearCita.class.getName()).log(Level.SEVERE, null, ex);
        }

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
