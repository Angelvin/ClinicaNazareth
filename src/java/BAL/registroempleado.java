/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package BAL;

import DAL.cConexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Angel
 */
public class registroempleado {
   public static void main(String[] args) {
    
   try {
      Connection bdconeccion=cConexion.conectar_ds();
    CallableStatement buscador=null;
   
    String query="{call registroempleado(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
    Statement stmt = null;
  PreparedStatement pst= bdconeccion.prepareStatement(query);
  pst.setInt(1, 2);
  pst.setString(2, "angel");
  pst.setString(3, "anngelll");
  pst.setString(4, "Angelll");
  pst.setString(5, "saberll");
  pst.setString(6, "angel");
  pst.setString(7, "angel");
  pst.setDate(8, Date.valueOf("1991-02-22"));
  pst.setString(9, "m");
  pst.setString(10, "angel");
  pst.setString(11, "angel");
  pst.setString(12, "angel");
  pst.setString(13, "angel");
  pst.setString(14, "angel");
  pst.setString(15, "angel");
  pst.setInt(16, 1);
  pst.setString(17, "angel");
  pst.setString(18, "angel");
  pst.setInt(19,1);
  pst.setInt(20,1);
  pst.setInt(21,1);
           ResultSet rs =pst.executeQuery();
                  
          
   } catch (SQLException e){
       System.out.println(e.getMessage());
   }
            
 }

    
    
    
    
    
    
    
}
