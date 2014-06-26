/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package BAL;

import DAL.cConexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Angel
 */
public class cbusqueda {
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
     
     
    public static void main(String[] args) {
        Connection bdconeccion = cConexion.conectar_ds();
        CallableStatement buscador = null;
        ResultSet rs = null;
        String query = "{call pacienteConfirmado}";
        Statement stmt = null;

        try {
            stmt = bdconeccion.createStatement();
            buscador = bdconeccion.prepareCall(query);

           /*  String pr = "{call pacienteConfirmado}"; */
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                System.out.println(rs.getString("nombre"));
            }



        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public List< cbusqueda> getListado() {
        List<  cbusqueda> list = new ArrayList<  cbusqueda>(0);
        Connection bdconeccion = cConexion.conectar_ds();
        CallableStatement buscador = null;
        ResultSet rs = null;
        String query = "{call buspaciente}";
        Statement stmt = null;
        try {
            stmt = bdconeccion.createStatement();
            buscador = bdconeccion.prepareCall(query);

            /* String pr = "{call pacienteConfirmado}"; */
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                cbusqueda cu = new  cbusqueda();
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
