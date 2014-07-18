/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BEANS;

import DAL.MyDatabase;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

/**
 *
 * @author Angel
 */
public class bedipaciente {

    public static String Edipaciente = "update persona set pnombrePer=?,snombrePer=?,pApellPer=?,sApellper=?,fechaNacPer=?,sexo=?,iglesia=? where idPersona=?";
    public static String docu = " INSERT INTO  documento(numero,tipo ) values (?,?) where fkpersona=?";
    public static String tele = " INSERT INTO  telefono(numero,tipo,idPerson) values(??)where fkpersona=?";
    public static String direcc = "INSERT INTO Direccion(calleDireccion,casaDireccion,fkMunicipio)values(?,?,?) where fkpersona=?";
    public static String correo = "INSERT INTO  correo(Correo,tipo) values(?,?)where fkpersona=?";
    private int idpaciente;
    private String nombre;
    private String snombre;

    public int getIdpaciente() {
        return idpaciente;
    }

    public void setIdpaciente(int idpaciente) {
        this.idpaciente = idpaciente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSnombre() {
        return snombre;
    }

    public void setSnombre(String snombre) {
        this.snombre = snombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getSapellido() {
        return sapellido;
    }

    public void setSapellido(String sapellido) {
        this.sapellido = sapellido;
    }
    private String apellido;
    private String sapellido;
    private Date fecha;
    private String sexo;

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getIglesia() {
        return iglesia;
    }

    public void setIglesia(String iglesia) {
        this.iglesia = iglesia;
    }
    private String iglesia;

    public static bedipaciente getDatos(int id) {
        bedipaciente list = new bedipaciente();
        try {
            Connection cnn = MyDatabase.getConection();
            String SQL = "select p.idPersona, pnombrePer,snombrePer,pApellPer,sApellper,fechaNacPer,sexo,iglesia from persona as p inner join paciente as pa on pa.fkpersona=p.idPersona where pa.idPaciente=" + id;
            Statement stmt = cnn.createStatement();
            ResultSet rs = stmt.executeQuery(SQL);
            while (rs.next()) {
                list.setIdpaciente(rs.getInt(1));
                list.setNombre(rs.getString(2));
                list.setSnombre(rs.getString(3));
                list.setApellido(rs.getString(4));
                list.setSapellido(rs.getString(5));
                list.setFecha(rs.getDate(6));
                list.setSexo(rs.getString(7));
                list.setIglesia(rs.getString(8));
            }
            cnn.close();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return list;
    }
}
