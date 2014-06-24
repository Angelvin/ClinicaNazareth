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
public class confimado {

    private int codigo;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
    private String hora;
    private String medico;

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }
    private String nombre;

    public String getMedico() {
        return medico;
    }

    public void setMedico(String medico) {
        this.medico = medico;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    private String motivo;
    private String especialidad;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

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

    public List<confimado> getListado() {
        List< confimado> list = new ArrayList< confimado>(0);
        Connection bdconeccion = cConexion.conectar_ds();
        CallableStatement buscador = null;
        ResultSet rs = null;
        String query = "{call pacienteConfirmado}";
        Statement stmt = null;
        try {
            stmt = bdconeccion.createStatement();
            buscador = bdconeccion.prepareCall(query);

            /* String pr = "{call pacienteConfirmado}"; */
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                confimado cu = new confimado();
                cu.setNombre(rs.getString("nombre"));
                cu.setMotivo(rs.getString("Motivo"));
                cu.setEspecialidad(rs.getString("Especialidad"));
                cu.setMedico(rs.getString("Medico"));
                cu.setHora(rs.getString("Hora"));
                cu.setCodigo(rs.getInt("Codigo"));

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
