/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import static DAL.MyDatabase.getConection;
import static DAL.utilidades.Logs;
import java.sql.*;
import java.util.regex.*;

/**
 *
 * @author daMgeL
 */
public class MyDb {

    private static final String ClassName = MyDb.class.getSimpleName();
    private static final String NullQuery = "Error:Joder tio! No se puede pasar un query NULL";

    /**
     * Metodo que ejecuta un insert raw, es decir el query no va parametrizado,
     * posibles SQLi.
     * @param RawQueryString
     * @throws java.sql.SQLException
     */
    public static void Insert(String RawQueryString) throws SQLException {
        if ("".equals(RawQueryString)) {
            Logs(ClassName + NullQuery);
        } else {
            Connection cnn = getConection();
            Statement pst = cnn.createStatement();
            try {
                pst.executeUpdate(RawQueryString);
                Logs(ClassName + " SQLQuery Processed: " + RawQueryString);
                Logs(ClassName + " SQLQuery Successfully!");
            } catch (SQLException ex) {
                Logs(ClassName + " SQLQuery Processed: " + RawQueryString);
                Logs(ClassName + " SQLQuery Failed Because: " + ex.getMessage());
            } finally {
                cnn.close();
            }
        }

    }

    public static void Update(String RawQueryString) throws SQLException {
        if ("".equals(RawQueryString)) {
            Logs(ClassName + NullQuery);
        } else if (Pattern.compile(Pattern.quote("ins"), Pattern.CASE_INSENSITIVE).matcher(RawQueryString).find()) {
            Logs(ClassName + ": SubQuery's no admitidas en UPDATE.");
        } else {
            Insert(RawQueryString);
        }
    }

    /**
     * Metodo que ejecuta un insert parametrizado, garantiza correcta
     * construccion del Query, evitando posibles SQLi.
     * @param ParameterizedQuery
     * @throws java.sql.SQLException
     */
    public static void InsertOverPreparedStatement(PreparedStatement ParameterizedQuery) throws SQLException {
        if (ParameterizedQuery == null) {
            Logs(ClassName + NullQuery);
        } else {
            Connection cnn = getConection();
            PreparedStatement pst = ParameterizedQuery;
            try {
                pst.executeUpdate();
                Logs(ClassName + " SQLQuery Processed: " + ParameterizedQuery.toString());
                Logs(ClassName + " SQLQuery Successfully!");
            } catch (SQLException ex) {
                Logs(ClassName + " SQLQuery Processed: " + ParameterizedQuery.toString());
                Logs(ClassName + " SQLQuery Failed Because: " + ex.getMessage());
            } finally {
                cnn.close();
            }

        }
    }
}
