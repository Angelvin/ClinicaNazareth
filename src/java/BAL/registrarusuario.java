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

    
   
      Connection bdconeccion=cConexion.conectar_ds();
    CallableStatement buscador=null;
   
  public static  String query="{call registroUsuario(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
  public static  String empleado="{call registroempleado(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
  
  /*  Statement stmt = null;
  PreparedStatement pst= bdconeccion.prepareStatement(query);
  pst.setString(1, "miercoles");
  pst.setString(2, "angel2");
  pst.setString(3, "Angel");
  pst.setString(4, "miercoles");
  pst.setString(5, "angel");
  pst.setString(6, "angel");
  pst.setDate(7, Date.valueOf("1991-02-22"));
  pst.setString(8, "f");
  pst.setString(9, "jsm");
  pst.setString(10, "angel");
  pst.setString(11, "angel");
  pst.setString(12, "angel");
  pst.setString(13, "angel");
  pst.setString(14, "angel");
  pst.setString(15, "angel");
  pst.setInt(16, 1);
  
  pst.setString(17, "angel");
  pst.setString(18, "angel");
 
           ResultSet rs =pst.executeQuery();
                      while (rs.next()){
               System.out.println(rs.getString(1).toString());
           }*/

   
            
 

    
    
    
    
    
    
    
}
