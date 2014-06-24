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
public class registrarusuario {
        public static void main(String[] args) {
    
   try {
      Connection bdconeccion=cConexion.conectar_ds();
    CallableStatement buscador=null;
   
    String query="{call registroUsuario(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
    Statement stmt = null;
  PreparedStatement pst= bdconeccion.prepareStatement(query);
  pst.setString(1, "angel");
  pst.setString(2, "angel2");
  pst.setString(3, "Angel");
  pst.setString(4, "saber");
  pst.setString(5, "angel");
  pst.setString(6, "angel");
  pst.setDate(7, Date.valueOf("1991-02-22"));
  pst.setString(8, "m");
  pst.setString(9, "angel");
  pst.setString(10, "angel");
  pst.setString(11, "angel");
  pst.setString(12, "angel");
  pst.setString(13, "angel");
  pst.setInt(14, 1);
  pst.setString(15, "angel");
  pst.setString(16, "angel");
  pst.setString(17, "angel");
  pst.setInt(18, 1);
           ResultSet rs =pst.executeQuery();
                      while (rs.next()){
               System.out.println(rs.getString(1).toString());
           }

          
   } catch (SQLException e){
       System.out.println(e.getMessage());
   }
            
 }

    
    
    
    
    
    
    
}
