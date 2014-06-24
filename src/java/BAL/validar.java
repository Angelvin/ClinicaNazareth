/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BAL;

import DAL.cConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import librebeans.ingreso;

/**
 *
 * @author Asdeleon
 */
public class validar {
    //CODIGO VALIDANDO USUARIO
    public int getUsuario(String usuario){
    int registros=0;
        try {
            Connection cnn = cConexion.conectar_ds();
            ResultSet rset = null;
            PreparedStatement sta;
            sta = cnn.prepareStatement(ingreso.verificar);
            sta.setString(1, usuario);
            rset = sta.executeQuery();
            
            rset.next();
            registros=rset.getInt("registros");
            rset.close();
            sta.close();
            cnn.close();

        } catch (Exception ex) {
        } finally {
            return registros;
        }
    }
}
