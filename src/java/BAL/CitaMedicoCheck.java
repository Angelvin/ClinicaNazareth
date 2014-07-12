/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BAL;

import BEANS.*;
import DAL.*;
import java.sql.*;

/**
 *
 * @author daMgeL
 */
public class CitaMedicoCheck {

    public static int getExpediente(int valor) {
        int num = 0;
        try
        {
            // String valor = request.getParameter("idpaciente");
            Connection cnn = cConexion.conectar_ds();
            ResultSet rset = null;
            PreparedStatement sta;
            sta = cnn.prepareStatement(beanCita.expediente);
            sta.setInt(1, valor);
            rset = sta.executeQuery();
            while (rset.next())
            {
                //CitaMedicoCheck cmc = new CitaMedicoCheck();
                num = Integer.parseInt(rset.getString("expediente"));
            }
        } catch (SQLException ex)
        {
            // out.println(ex.getMessage());
        }

        return num;
    }

    public static int getEmpleadoID(int valor) {
        int num = 0;
        try
        {
            // String valor = request.getParameter("idpaciente");
            Connection cnn = cConexion.conectar_ds();
            ResultSet rset = null;
            PreparedStatement sta;
            sta = cnn.prepareStatement(beanCita.getEmpleadoID);
            sta.setInt(1, valor);
            rset = sta.executeQuery();
            while (rset.next())
            {
                //  CitaMedicoCheck cmc = new CitaMedicoCheck();
                num = Integer.parseInt(rset.getString("EmpleadoID"));
            }
        } catch (SQLException ex)
        {
            // out.println(ex.getMessage());
        }

        return num;
    }
}
