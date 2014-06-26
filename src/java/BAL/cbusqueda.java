/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BAL;

import DAL.cConexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Angel
 */
public class cbusqueda {

    public static String busq = "select (e.idPaciente) as codigo, concat(p.pnombrePer,' ',p.snombrePer) as nombre,concat(p.pApellPer,' ',p.sApellPer) as apellido  from persona as p inner join paciente as e on e.fkpersona=p.idPersona inner join documento as do on p.idPersona=do.fkpersona;";
    public static String busq2 = "select (e.idPaciente) as codigo, concat(p.pnombrePer,' ',p.snombrePer) as nombre,concat(p.pApellPer,' ',p.sApellPer) as apellido  "
            + "from persona as p inner join paciente as e on e.fkpersona=p.idPersona inner join documento as do on p.idPersona=do.fkpersona where do.numero= ?;";
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

    public List<cbusqueda> getListado() {
        List<cbusqueda> list = new ArrayList<cbusqueda>(0);
        try {
            Connection cnn = cConexion.conectar_ds();
            ResultSet rs = null;
            Statement sta = cnn.createStatement();
            rs = sta.executeQuery(cbusqueda.busq);

            while (rs.next()) {
                cbusqueda cu = new cbusqueda();
                cu.setCodigo(rs.getInt("codigo"));
                System.out.println(rs.getString("nombre"));
                cu.setNombre(rs.getString("nombre"));
                System.out.println(rs.getString("apellido"));
                cu.setApellido(rs.getString("apellido"));

                list.add(cu);
            }
            rs.close();
            sta.close();
            cnn.close();

        } catch (Exception ex) {
        } finally {
            return list;
        }
    }
    public List<cbusqueda> getListado2() {
        List<cbusqueda> list = new ArrayList<cbusqueda>(0);
        try {
            Connection cnn = cConexion.conectar_ds();
            ResultSet rs = null;
            Statement sta = cnn.createStatement();
            rs = sta.executeQuery(cbusqueda.busq2);

            while (rs.next()) {
                cbusqueda cu = new cbusqueda();
                cu.setCodigo(rs.getInt("codigo"));
                System.out.println(rs.getString("nombre"));
                cu.setNombre(rs.getString("nombre"));
                System.out.println(rs.getString("apellido"));
                cu.setApellido(rs.getString("apellido"));

                list.add(cu);
            }
            rs.close();
            sta.close();
            cnn.close();

        } catch (Exception ex) {
        } finally {
            return list;
        }
    }
}
