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
        String query = "select idPersona, pnombrePer, snombrePer, pApellPer, sApellPer, fechaNacPer, sexo from persona as p inner join login as lo on lo.idLogin=p.fkLogin where lo.idLogin=";
        query = query + Integer.toString(queryParam);

        List<getPacienteController> lista = new ArrayList<getPacienteController>(0);
        try {
            Connection cnn = cConexion.conectar_ds();
            ResultSet rs = null;
            Statement sta = cnn.createStatement();
            rs = sta.executeQuery(query);

            while (rs.next()) {
                getPacienteController pac = new getPacienteController();
                pac.setIdPersona(rs.getInt("idPersona"));
                pac.setPnombrePer(rs.getString("pnombrePer"));
                pac.setSnombrePer(rs.getString("snombrePer"));
                pac.setpApellPer(rs.getString("pApellPer"));
                pac.setsApellPer(rs.getString("sApellPer"));
                pac.setFechaNacPer(rs.getString("fechaNacPer"));
                pac.setSexo(rs.getString("sexo"));
                lista.add(pac);
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
