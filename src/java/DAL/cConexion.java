/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.*;

/**
 *
 * @author Angel
 */
public class cConexion {

    private static final String SQLSERVER_URL = "jdbc:sqlserver://localhost:49759;databaseName=clinica";
    private static final String MYSQL_USER = "sa";
    private static final String MYSQL_PASSWD = "destiny";

    public static Connection conectar_ds() {
        Connection cnn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            cnn = DriverManager.getConnection(SQLSERVER_URL, MYSQL_USER, MYSQL_PASSWD);
            System.out.println("Conectado a :" + SQLSERVER_URL);
        } catch (SQLException ex) {
            System.out.println("Error al conectarse a la base de datos: " + ex.getMessage());
        } finally {
            return cnn;
        }
    }

    public static void main(String args[]) {
        conectar_ds();
    }
}
