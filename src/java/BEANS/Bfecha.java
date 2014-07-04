/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BEANS;

import DAL.cConexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

/**
 *
 * @author Angel
 */
public class Bfecha {

    private Date fechalo;

    public Date getFechalo() {
        return fechalo;
    }

    public void setFechalo(Date fechalo) {
        this.fechalo = fechalo;
    }

    public static Bfecha getFecha() {

        Connection bdconeccion = cConexion.conectar_ds();
        CallableStatement buscador = null;
        ResultSet rs = null;
        Bfecha f = new Bfecha();
        Statement stmt = null;

        try {
            stmt = bdconeccion.createStatement();


            rs = stmt.executeQuery("select CONVERT (date, GETDATE())");
            while (rs.next()) {
                f.setFechalo(rs.getDate(1));
            }



        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return f;
    }
}
