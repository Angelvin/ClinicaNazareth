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
 * @author Angel
 */
public class bCargo extends MyDatabase {

    static private PreparedStatement pst = null;

    public static ResultSet getCargo() {
        ResultSet rs = null;
        try {
            String sql = "select * from cargo";
            pst = getConection().prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return rs;
    }
}
