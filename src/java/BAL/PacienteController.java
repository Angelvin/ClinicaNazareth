/*
 * To change this template, choose Tools | Templates
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
 * @author daMgeL
 */
public class PacienteController {

    private int idCita;
    private String motivo;
    private String estadoCita;

    public int getIdCita() {
        return idCita;
    }

    public void setIdCita(int idCita) {
        this.idCita = idCita;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getEstadoCita() {
        return estadoCita;
    }

    public void setEstadoCita(String estadoCita) {
        this.estadoCita = estadoCita;
    }
    public static String TodasByIdPaciente = "SELECT top 10 idCita, motivo, estadoCita FROM cita where cita.estadoCita='espera'";

    public List<PacienteController> getListado() {
        List<PacienteController> lista = new ArrayList<PacienteController>(0);
        try {
            Connection cnn = cConexion.conectar_ds();
            ResultSet rs = null;
            Statement sta = cnn.createStatement();
            rs = sta.executeQuery(PacienteController.TodasByIdPaciente);

            while (rs.next()) {
                PacienteController pc = new PacienteController();
                pc.setIdCita(rs.getInt("idCita"));
                pc.setMotivo(rs.getString("motivo"));
                pc.setEstadoCita(rs.getString("estadoCita"));
                lista.add(pc);
            }
            rs.close();
            sta.close();
            cnn.close();

        } catch (Exception ex) {
        } finally {
            return lista;
        }
    }
}
