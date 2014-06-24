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
import java.util.List;

/**
 *
 * @author Angel
 */
public class encargado {
    private int codigo;
    private String pnombre;
    private String snombre;
    private String papellido;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getPnombre() {
        return pnombre;
    }

    public void setPnombre(String pnombre) {
        this.pnombre = pnombre;
    }

    public String getSnombre() {
        return snombre;
    }

    public void setSnombre(String snombre) {
        this.snombre = snombre;
    }

    public String getPapellido() {
        return papellido;
    }

    public void setPapellido(String papellido) {
        this.papellido = papellido;
    }

    public String getSapellido() {
        return sapellido;
    }

    public void setSapellido(String sapellido) {
        this.sapellido = sapellido;
    }
    private String sapellido;
    
     public List<encargado> getListado() {
        List< encargado> lista = new ArrayList< encargado>(0);
        Connection bdconeccion = cConexion.conectar_ds();
        CallableStatement buscador = null;
        ResultSet rs = null;
        String query = "{call responsable}";
        Statement stmt = null;

        try {
            stmt = bdconeccion.createStatement();
            buscador = bdconeccion.prepareCall(query);
           /* String pr = "{call PacienteEspera}"; */
            rs = stmt.executeQuery(query);
            while (rs.next()) {
               encargado cu = new encargado();
               cu.setCodigo(rs.getInt("idpaciente"));
               cu.setPnombre(rs.getString("pnombrePer"));
               cu.setSnombre(rs.getString("snombrePer"));
               cu.setPapellido(rs.getString("pnombrePer"));
               cu.setSapellido(rs.getString("sApellPer"));
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
