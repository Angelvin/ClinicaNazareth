/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package librebeans;

import BAL.cbusqueda;
import DAL.cConexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Angel
 */
public class bbucap {

   

    private int codigo;
    private String nombre;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    private String apellido;
  
     public static  List<bbucap> getListado() {
        List< bbucap> list = new ArrayList<  bbucap>(0);
        Connection bdconeccion = cConexion.conectar_ds();
        String query = "{call buspacientedocu(?)}";
        CallableStatement buscador = null;
        ResultSet rs = null;
    String id="123";
        Statement stmt = null;
        try {
            stmt=bdconeccion.createStatement();
           buscador = bdconeccion.prepareCall(query);
           buscador.setString(1, id);

             String pr = "{call buspacientedocu("+id+")}"; 
            rs = stmt.executeQuery(pr);

            while (rs.next()) {
                bbucap cu = new  bbucap();
               cu.setCodigo(rs.getInt("codigo"));
               cu.setNombre(rs.getString("nombre"));
               cu.setApellido(rs.getString("apellido"));

                list.add(cu);
            }
            rs.close();
            stmt.close();
            bdconeccion.close();

        } catch (Exception ex) {
        } finally {
            return list;
        }
    }
   

}
