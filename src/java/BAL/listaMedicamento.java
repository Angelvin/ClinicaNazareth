/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BAL;

import DAL.MyDatabase;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Marlon
 */
public class listaMedicamento {
    public static String listaM="Select idMedica as id,nombreMedica as nombre,viaAdmonMedica as admon, presentaMedica as presen,existenciaMedica as exis, EstadoMedica as estado,fkSubGrupo as sub from medicamento";
    private int idMedica;
    private String nombreMe;
    private String viAdmon;
    private String presen;
    private int existencia;
    private String Estado;
    private int subgrupo;

    public String getNombreMe() {
        return nombreMe;
    }

    public void setNombreMe(String nombreMe) {
        this.nombreMe = nombreMe;
    }

    
    public int getIdMedica() {
        return idMedica;
    }

    public void setIdMedica(int idMedica) {
        this.idMedica = idMedica;
    }

    public String getViAdmon() {
        return viAdmon;
    }

    public void setViAdmon(String viAdmon) {
        this.viAdmon = viAdmon;
    }

    public String getPresen() {
        return presen;
    }

    public void setPresen(String presen) {
        this.presen = presen;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public int getSubgrupo() {
        return subgrupo;
    }

    public void setSubgrupo(int subgrupo) {
        this.subgrupo = subgrupo;
    }
    
     public List<listaMedicamento> getListado() {
        List<listaMedicamento> list = new ArrayList<listaMedicamento>(0);
        try {
            Connection cnn = MyDatabase.getConection();
            ResultSet rs = null;
            Statement sta = cnn.createStatement();
            rs = sta.executeQuery(listaMedicamento.listaM);

            while (rs.next()) {
                listaMedicamento lt = new listaMedicamento();
                lt.setIdMedica(rs.getInt("id"));
                lt.setNombreMe(rs.getString("nombre"));
                lt.setPresen(rs.getString("presen"));
                lt.setExistencia(rs.getInt("exis"));
                lt.setViAdmon(rs.getString("admon"));
                lt.setSubgrupo(rs.getInt("sub"));
                lt.setEstado("estado");
                list.add(lt);
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
