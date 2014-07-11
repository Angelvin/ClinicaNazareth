/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package BEANS;

import java.sql.Date;

/**
 *
 * @author KDSoul
 */
public class beanDespacho {
public static String update = "UPDATE factura SET estado = 'Despachado' WHERE idFactura=?"; 
public static String salida = "INSERT INTO salida (fechaSalida,fktiposalida) VALUES (GETDATE(),1)\n" +
"INSERT INTO detalle_salida(fkmedicina,cantidad,fksalida) SELECT detalle_factura.fkmedicina, detalle_factura.cantidad,\n" +
"(Select MAX(salida.idsalida) from salida)\n" +
"FROM detalle_factura INNER JOIN factura ON detalle_factura.fkfactura = factura.idFactura\n" +
" where detalle_factura.fkfactura=?";
 private String paciente;
    private String medicamento;
    private int cantidad;
    private Date fecha;
    private int codigo;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
    public String getPaciente() {
        return paciente;
    }

    public void setPaciente(String paciente) {
        this.paciente = paciente;
    }

    public String getMedicamento() {
        return medicamento;
    }

    public void setMedicamento(String medicamento) {
        this.medicamento = medicamento;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    
}
