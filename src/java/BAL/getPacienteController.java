/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BAL;

import static BAL.PacienteController.TodasByIdPaciente;
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
public class getPacienteController {

    private int idPersona;
    private String pnombrePer;
    private String snombrePer;
    private String pApellPer;
    private String sApellPer;
    private String fechaNacPer;
    private String sexo;

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public String getPnombrePer() {
        return pnombrePer;
    }

    public void setPnombrePer(String pnombrePer) {
        this.pnombrePer = pnombrePer;
    }

    public String getSnombrePer() {
        return snombrePer;
    }

    public void setSnombrePer(String snombrePer) {
        this.snombrePer = snombrePer;
    }

    public String getpApellPer() {
        return pApellPer;
    }

    public void setpApellPer(String pApellPer) {
        this.pApellPer = pApellPer;
    }

    public String getsApellPer() {
        return sApellPer;
    }

    public void setsApellPer(String sApellPer) {
        this.sApellPer = sApellPer;
    }

    public String getFechaNacPer() {
        return fechaNacPer;
    }

    public void setFechaNacPer(String fechaNacPer) {
        this.fechaNacPer = fechaNacPer;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public List<getPacienteController> getListado(Integer queryParam) {
        String query = TodasByIdPaciente + Integer.toString(queryParam);
        List<getPacienteController> lista = new ArrayList<getPacienteController>(0);
        try {
            Connection cnn = cConexion.conectar_ds();
            ResultSet rs = null;
            Statement sta = cnn.createStatement();
            rs = sta.executeQuery(query);

            while (rs.next()) {
                getPacienteController pc = new getPacienteController();
//                pc.setIdCita(rs.getInt("idCita"));
//                pc.setMotivo(rs.getString("motivo"));
//                pc.setEstadoCita(rs.getString("estadoCita"));
                lista.add(pc);
            }
            rs.close();
            sta.close();
            cnn.close();

        } catch (NullPointerException ex) {
            System.out.println("Truena el Controlador: " + ex.getMessage());
        } finally {
            return lista;
        }
    }
}
