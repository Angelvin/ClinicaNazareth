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
public class municipio extends MyDatabase {

    static private PreparedStatement pst = null;

    public static ResultSet getmuni() {

        ResultSet rst = null;
        try {

            String sql = "select * from municipio";
            pst = getConection().prepareStatement(sql);
            rst = pst.executeQuery();
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return rst;

    }
}
