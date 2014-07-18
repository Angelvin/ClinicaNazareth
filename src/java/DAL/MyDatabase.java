/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.*;

/**
 *
 * @author daMgel
 */
public class MyDatabase {

    private static final String SQLSERVER_URL = "jdbc:sqlserver://localhost:1433;databaseName=clinica";
    private static final String SQL_USER = "sa";
    private static final String SQL_PASSWD = "destiny";
    private static final String CLASSNAME = MyDatabase.class.getSimpleName();

    public static Connection getConection() {
        Connection cnn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            cnn = DriverManager.getConnection(SQLSERVER_URL, SQL_USER, SQL_PASSWD);
            utilidades.Logs(CLASSNAME + "> Coneccion exitosa a :" + SQLSERVER_URL);

        } catch (SQLException ex) {
            utilidades.Logs(CLASSNAME + "> Error al conectarse a la base de datos: \n" + ex.getMessage());
        } finally {
            return cnn;
        }
    }

    public static void main(String args[]) throws SQLException {

        // MyDb.Insert("INSERT INTO cargo(nombreCargo, descripcionCargo)values('BigBossss22','ENCARGADO DE TODOS')");
        // MyDb.Update("UPDATE cargo set nombreCargo='UPDATING' where idCargo>=1");
        MyDb.Update("INSERT");
        MyDb.Update("insert into");
        MyDb.Update("INS");
        MyDb.Update("algo lalalal");

    }
}
