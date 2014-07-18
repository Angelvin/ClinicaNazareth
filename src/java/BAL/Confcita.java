/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BAL;

import DAL.MyDatabase;
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
public class Confcita {

    private String paciente;
    private String motivo;
    private String especialidad;
    private String medico;
    private String hora;
    private Date fecha;

    public String getPaciente() {
        return paciente;
    }

    public void setPaciente(String paciente) {
        this.paciente = paciente;
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

    public String getMedico() {
        return medico;
    }

    public void setMedico(String medico) {
        this.medico = medico;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public List<Confcita> getListado() {
        List<Confcita> list = new ArrayList<Confcita>(0);
        Connection cnn = MyDatabase.getConection();
        CallableStatement buscar = null;
        ResultSet rs = null;
        String query = "{call ConsolaCita}";
        Statement stmt = null;
        try {
            stmt = cnn.createStatement();
            buscar = cnn.prepareCall(query);
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                Confcita cu = new Confcita();
                cu.setPaciente(rs.getString("Paciente"));
                cu.setMotivo(rs.getString("Motivo"));
                cu.setEspecialidad(rs.getString("Especialidad"));
                cu.setMedico(rs.getString("Medico"));
                cu.setHora(rs.getString("Hora"));
                cu.setFecha(rs.getDate("Fecha"));
                list.add(cu);

            }
            rs.close();
            stmt.close();
            cnn.close();
        } catch (Exception ex) {

            System.out.println(ex.getMessage());
        } finally {
            return list;

        }
    }
}
