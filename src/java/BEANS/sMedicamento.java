/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BEANS;

import DAL.MyDatabase;
import static DAL.MyDatabase.getConection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Marlon
 */
public class sMedicamento extends MyDatabase {
        static private  PreparedStatement pst =null;
    public  static ResultSet getMedicamento(){
        
     ResultSet rs=null;
        try{
            
            String sql="select * from medicamento";
        pst=getConection().prepareStatement(sql);
        rs=pst.executeQuery();
        }catch(Exception e){
            System.out.print(e.getMessage());
        }
        return rs;
    
    }
}
