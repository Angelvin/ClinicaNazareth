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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Angel
 */
public class Espera {

    private int codigo;
    private String correocita;
    private String nombre;
    private String estado;
    private String hora;
    private Date fechasoli;

    public Date getFechasoli() {
        return fechasoli;
    }

    public void setFechasoli(Date fechasoli) {
        this.fechasoli = fechasoli;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    private Date fecha;

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getCorreocita() {
        return correocita;
    }

    public void setCorreocita(String correocita) {
        this.correocita = correocita;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<Espera> getListado() {
        List< Espera> lista = new ArrayList< Espera>(0);
        Connection bdconeccion = cConexion.conectar_ds();
        CallableStatement buscador = null;
        ResultSet rs = null;
        String query = "{call PacienteEspera}";
        Statement stmt = null;

        try {
            stmt = bdconeccion.createStatement();
            buscador = bdconeccion.prepareCall(query);
           /* String pr = "{call PacienteEspera}"; */
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                Espera cu = new Espera();
                cu.setNombre(rs.getString("Nombre"));
                cu.setCorreocita(rs.getString("correoCita"));
                cu.setEstado(rs.getString("Estado"));
                cu.setCodigo(rs.getInt("Codigo"));
                cu.setHora(rs.getString("Hora"));
                cu.setFechasoli(rs.getDate("FechaSolicitud"));
                cu.setFecha(rs.getDate("Fecha"));
                lista.add(cu);
            }
            rs.close();
            stmt.close();
            bdconeccion.close();

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            return lista;
        }

    }
}
