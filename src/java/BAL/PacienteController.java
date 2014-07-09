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
import javax.servlet.http.HttpServletRequest;

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
    /**
     *
     * @param
     */
    public static String TodasByIdPaciente = "select idCita, motivo, estadoCita from cita as c inner join paciente as paci on paci.idPaciente=c.fkPaciente inner join persona as p on p.idPersona=paci.fkpersona inner join login as lo on lo.idLogin=p.fkLogin where c.estadoCita='espera' and lo.idLogin=";

    public List<PacienteController> getListado(Integer queryParam) {
        String query = TodasByIdPaciente + Integer.toString(queryParam);
        List<PacienteController> lista = new ArrayList<PacienteController>(0);
        try {
            Connection cnn = cConexion.conectar_ds();
            ResultSet rs = null;
            Statement sta = cnn.createStatement();
            rs = sta.executeQuery(query);

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

        } catch (NullPointerException ex) {
            System.out.println("Truena el Controlador: " + ex.getMessage());
        } finally {
            return lista;
        }
    }

    public void setMyObject(HttpServletRequest request) {
        Integer uidPaciente = (Integer) request.getSession().getAttribute("uidPaciente");
        System.out.println("Nasty query says:" + Integer.toString(uidPaciente));
        getListado(uidPaciente);
        //HttpSession session = request.getSession();

        //session.setAttribute("attr", "Value set in session by javabean");
    }
}
