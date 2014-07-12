/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import BEANS.beanCita;
import DAL.*;
import java.io.*;
import java.sql.*;
import java.util.Properties;
import java.util.logging.*;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author daMgeL
 */
public class CrearCita extends HttpServlet {

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


        if (request.getParameter("fecha") == null || request.getParameter("thorario") == null || request.getParameter("motivo") == null || request.getParameter("txtLoginID") == null) {
            out.println(BAL.Assets.DisplayError("No se admiten parametros nulos", "Paciente/NuevaCita.jsp", "100", "2em"));
        } else {
            //para email  
            final String username = "redhood7086@gmail.com";
            final String password = "matroshka70";

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

                Connection cnn = cConexion.conectar_ds();
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

                    pstm.setDate(1, Date.valueOf(request.getParameter("fecha")));
                    pstm.setString(2, "algunCorreo@correo.com");
                    pstm.setInt(3, Integer.parseInt(request.getParameter("thorario")));
                    pstm.setString(4, request.getParameter("motivo"));
                    pstm.setInt(5, Integer.parseInt(request.getParameter("txtLoginID")));

                    pstm.executeUpdate();
                    out.println(BAL.Assets.DisplayExito("Cita creada correctamente :)", "Paciente/Perfil.jsp", "100", "2em"));



                    int autoIncKeyFromApi = -1;
                    rset = pstm.getGeneratedKeys();
                    while (rset.next()) {
                        autoIncKeyFromApi = rset.getInt(1);
                    }
                    out.println(autoIncKeyFromApi);
                    //armando EMAIL
                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress("redhood7086@gmail.com"));
                    message.setRecipients(Message.RecipientType.TO,
                            InternetAddress.parse("redhood7086@gmail.com"));
                    message.setSubject("Envio de link");
                    message.setContent("<a href='http://localhost:8089/ClinicaNazareth/srvCambioEstado?idCita=" + autoIncKeyFromApi + "'>Confirma</a>", "text/html; charset=ISO-8859-1");

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
