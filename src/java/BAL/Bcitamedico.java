/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BAL;

import DAL.*;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Angel
 */
public class Bcitamedico {

    private int idcita;
    private String motivo;
    private String horario;
    private String paciente;
    private int codipaciente;

    public int getCodipaciente() {
        return codipaciente;
    }

    public void setCodipaciente(int codipaciente) {
        this.codipaciente = codipaciente;
    }

    public int getIdcita() {
        return idcita;
    }

    public void setIdcita(int idcita) {
        this.idcita = idcita;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getPaciente() {
        return paciente;
    }

    public void setPaciente(String paciente) {
        this.paciente = paciente;
    }

    public String getMedico() {
        return medico;
    }

    public void setMedico(String medico) {
        this.medico = medico;
    }

    public static String getCMedico() {
        return CMedico;
    }

    public static void setCMedico(String CMedico) {
        Bcitamedico.CMedico = CMedico;
    }
    private String medico;
    public static String CMedico = "select top 1 (c.idCita) as idcita,(c.motivo) as motivo,(paci.idPaciente) as codipaciente,(h.horaini) as horario,concat(per.pnombrePer, ' ',per.pApellPer) as  paciente, concat('Dr. ',per2.pnombrePer, ' ',per2.pApellPer) as medico  from cita as c inner join horario as h on c.fkhorario=h.idhorario inner join paciente as paci on c.fkPaciente=paci.idPaciente inner join persona as per on per.idPersona=paci.fkpersona inner join empleado as emp on emp.idEmpleado=h.fkempleado inner join persona as per2 on per2.idPersona=emp.fkpersona where (estadoCita='Consulta') and emp.idEmpleado=(select idEmpleado  from persona as p inner join login as l on l.idLogin=p.fkLogin inner join empleado as e on e.fkpersona=p.idPersona where l.idLogin=";

    public List< Bcitamedico> getlistado(Integer valor) {
        String query = CMedico + valor + ")";
        List< Bcitamedico> lista = new ArrayList< Bcitamedico>(0);
        Connection cnn = cConexion.conectar_ds();
        Statement ts;
        ResultSet rs;

        try {
            ts = cnn.createStatement();
            rs = ts.executeQuery(query);
            while (rs.next()) {
                Bcitamedico Cm = new Bcitamedico();
                Cm.setIdcita(rs.getInt("idcita"));
                Cm.setCodipaciente(rs.getInt("codipaciente"));
                Cm.setMotivo(rs.getString("motivo"));
                Cm.setHorario(rs.getString("horario"));
                Cm.setPaciente(rs.getString("paciente"));
                Cm.setMedico(rs.getString("medico"));
                lista.add(Cm);

            }
            cnn.close();
            ts.close();
            rs.close();

        } catch (NullPointerException ex) {
            System.out.println("Truena el Controlador: " + ex.getMessage());
        } finally {
            return lista;
        }

    }
    /*
     * public static void main(String[] args) { Connection bdconeccion =
     * cConexion.conectar_ds(); CallableStatement buscador = null; ResultSet rs
     * = null; Bfecha f = new Bfecha(); Statement stmt = null;
     *
     * try { stmt = bdconeccion.createStatement();
     *
     *
     * rs = stmt.executeQuery("select top 1 (c.idCita) as idcita,(c.motivo) as
     * motivo,(h.horaini) as horario,concat(per.pnombrePer, ' ',per.pApellPer)
     * as paciente, concat(per2.pnombrePer, ' ',per2.pApellPer) as medico from
     * cita as c inner join horario as h on c.fkhorario=h.idhorario inner join
     * paciente as paci on c.fkPaciente=paci.idPaciente inner join persona as
     * per on per.idPersona=paci.fkpersona inner join empleado as emp on
     * emp.idEmpleado=h.fkempleado inner join persona as per2 on
     * per2.idPersona=emp.fkpersona where (estadoCita='Consulta') and
     * (fechaCita=CAST(CURRENT_TIMESTAMP AS DATE)) and emp.idEmpleado=(select
     * idEmpleado from persona as p inner join login as l on l.idLogin=p.fkLogin
     * inner join empleado as e on e.fkpersona=p.idPersona where l.idLogin=" + 2
     * + ")");
     *
     *
     * while (rs.next()) { System.out.println(rs.getInt("idcita"));
     * System.out.println(rs.getString("motivo"));
     * System.out.println(rs.getString("horario"));
     * System.out.println(rs.getString("paciente"));
     * System.out.println(rs.getString("medico")); }
     *
     *
     *
     * } catch (SQLException e) { System.out.println(e.getMessage()); }
     *
     * }
     */
}
