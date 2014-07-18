/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BEANS;

import DAL.MyDatabase;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Angel
 */
public class bRol extends MyDatabase {

    static private PreparedStatement pst = null;

    public static ResultSet getRol() {
        ResultSet rs = null;
        try {
            String sql = "select * from rol where idRol>1";
            pst = getConection().prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return rs;
    }
}
