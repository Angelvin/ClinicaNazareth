/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BEANS;

/**
 *
 * @author Angel
 */
public class ingreso {

    public static String verificar = "SELECT count(*) as registros FROM login where usuario=?";
    /*public static String session = "SELECT fkRol, idLogin, usuLogin FROM login where usuLogin=? and passLogin=?";*/
    public static String Ingreso = "insert into entrada(cantidadentrada,presentacionEntrada,precioEntrada,fkPreducto)values(?,?,?,?)";
    public static String session = "{call session(?,?)}";
}
