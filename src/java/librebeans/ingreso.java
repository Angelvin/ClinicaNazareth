/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package librebeans;

/**
 *
 * @author Angel
 */
public class ingreso {
    public static String verificar = "SELECT count(*) as registros FROM login where usuario=?";
    public static String session = "SELECT id_rol FROM login where usuario=? and password=?";
    public static String Ingreso="insert into entrada(cantidadentrada,presentacionEntrada,precioEntrada,fkPreducto)values(?,?,?,?)";
}
