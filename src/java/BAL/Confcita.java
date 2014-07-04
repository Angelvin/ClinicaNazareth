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

    public String getCitas() {
        return Citas;
    }

    public void setCitas(String Citas) {
        this.Citas = Citas;
    }
    public static String Citas = "select concat(f.pnombrePer,' ',f.snombrePer,' ',f.pApellPer,' ',f.sApellPer) as paciente, c.motivo as Motivo,ca.nombreCargo as Especialidad,per.pApellPer as Medico, h.horaini as Hora, c.fechaCita as Fecha   from cita as c inner join horario as h on h.idhorario=c.fkhorario inner join empleado as e on h.fkempleado=e.idEmpleado inner join persona as per on e.fkpersona=per.idPersona inner join cargo as ca on ca.idCargo=e.fkCargo inner join paciente as pe on c.fkPaciente=pe.idPaciente inner join persona as f on f.idPersona=pe.fkpersona where c.fechaCita=CONVERT (date, GETDATE())";

    public List<Confcita> getListado() {
        List<Confcita> list = new ArrayList<Confcita>(0);
        try {
            Connection cnn = cConexion.conectar_ds();
            CallableStatement buscador = null;
            ResultSet rs = null;
            String query = "{call ConsolaCita}";
            Statement stmt = null;
            buscador = cnn.prepareCall(query);

            /* String pr = "{call pacienteConfirmado}"; */
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                Confcita cu = new Confcita();

                cu.setPaciente(rs.getString("paciente"));
                cu.setMotivo(rs.getString("Motivo"));
                cu.setEspecialidad(rs.getString("Especialidad"));
                cu.setMedico(rs.getString("Medico"));
                cu.setHora(rs.getString("Hora"));
                cu.setFecha(rs.getDate("fecha"));
                list.add(cu);
            }
            rs.close();

            cnn.close();
            stmt.close();
        } catch (Exception ex) {
        } finally {
            return list;
        }
    }
}
