/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package librebeans;

import DAL.MyDatabase;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Angel
 */
public class Tipopago {
    
    public static String SELECT="select * from tipo_pago";
    private int codigo;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    private String descripcion;
//CODIGO PARA LLENAR OBJETO LISTA
      public List<Tipopago > getListado() {
        List< Tipopago > lista = new ArrayList< Tipopago >(0);
        try {
            Connection cnn = MyDatabase.getConection();
            ResultSet rset = null;
            Statement sta = cnn.createStatement();
            rset = sta.executeQuery(Tipopago.SELECT);

            while (rset.next()) {
           Tipopago current = new  Tipopago ();
            current.setCodigo(rset.getInt("id_tipopago"));
            current.setDescripcion(rset.getString("descrpcion"));
            lista.add(current);
            }
            rset.close();
            sta.close();
            cnn.close();

        } catch (Exception ex) {
        } finally {
            return lista;
        }
    }

}
