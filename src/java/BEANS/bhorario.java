/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BEANS;

import DAL.MyDatabase;
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
public class bhorario {

    private int idempleado;
    private String medico;

    public int getIdempleado() {
        return idempleado;
    }

    public void setIdempleado(int idempleado) {
        this.idempleado = idempleado;
    }

    public String getMedico() {
        return medico;
    }

    public void setMedico(String medico) {
        this.medico = medico;
    }

    public List<bhorario> getListado() {
        List<bhorario> list = new ArrayList<bhorario>(0);
        CallableStatement buscador = null;
        ResultSet rs = null;
        String query = "{call busmedico}";
        Statement stmt = null;
        try {
            Connection bdconeccion = MyDatabase.getConection();

            stmt = bdconeccion.createStatement();
            buscador = bdconeccion.prepareCall(query);
            String pr = "{call busmedico}";
            rs = stmt.executeQuery(pr);
            while (rs.next()) {
                bhorario cu = new bhorario();
                cu.setIdempleado(rs.getInt(1));
                cu.setMedico(rs.getString(2));


                list.add(cu);
            }
            rs.close();
            stmt.close();
            bdconeccion.close();

        } catch (Exception ex) {
        } finally {
            return list;
        }
    }
}
