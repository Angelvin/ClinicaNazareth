/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package librebeans;

import DAL.MyDatabase;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Angel
 */
public class departametos extends MyDatabase {
    
      static private  PreparedStatement pst =null;
    public  static ResultSet getdepartamento(){
        
     ResultSet rs=null;
        try{
            
            String sql="select * from departamento";
        pst=getConection().prepareStatement(sql);
        rs=pst.executeQuery();
        }catch(Exception e){
            System.out.print(e.getMessage());
        }
        return rs;
    
    }
}
