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
import java.util.List;

/**
 *
 * @author Angel
 */
public class tarde {
    private int codigo;
    private String nombre;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMedico() {
        return medico;
    }

    public void setMedico(String medico) {
        this.medico = medico;
    }
    private String medico;
    
    public List<tarde > getListado() {
        List<tarde > lis = new ArrayList<tarde>(0);
    Connection bdconeccion=MyDatabase.getConection();
    CallableStatement buscador=null;
    ResultSet rs =null;
    String query="{call PacienteTarde}";
    Statement stmt = null;
  
   try {
           stmt=bdconeccion.createStatement();
           buscador = bdconeccion.prepareCall(query);
           String pr = "{call PacienteTarde}";
           rs=stmt.executeQuery(pr);
           while (rs.next()){
                tarde cu= new  tarde();
                cu.setCodigo(rs.getInt("Codigo"));
                cu.setMedico(rs.getString("Medico"));
                cu.setNombre(rs.getString("nombre"));
               lis.add(cu);
           }
         rs.close();
            stmt.close();
           bdconeccion.close();
           
     } catch (Exception ex) {
        } finally {
            return lis;
        }
    }
}
