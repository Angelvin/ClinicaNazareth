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
public class beanFactura {
    
    
public static String credito="INSERT INTO pago (fkTipopago,valorPago) SELECT tipo_pago.idTipopago,(\n" +
"SELECT SUM(detalle_factura.cantidad*entrada.precioEntrada*(1+grupo.porganancia))\n" +
"FROM medicamento INNER JOIN\n" +
"detalle_entrada INNER JOIN\n" +
"entrada ON detalle_entrada.fkentrada = entrada.idEntr ON medicamento.idMedica = detalle_entrada.fkmedicina INNER JOIN\n" +
"factura INNER JOIN detalle_factura ON factura.idFactura = detalle_factura.fkfactura ON medicamento.idMedica = detalle_factura.fkmedicina INNER JOIN\n" +
"subgrupo ON medicamento.fkSubGrupo = subgrupo.idsubgrupo INNER JOIN\n" +
"grupo ON subgrupo.fkGrupo = grupo.idgrupo\n" +
"where factura.idFactura=?)FROM tipo_pago where tipo_pago.descripcionTipoPago='credito'";

public static String efectivo="INSERT INTO pago (fkTipopago,valorPago) SELECT tipo_pago.idTipopago,(\n" +
"SELECT SUM(detalle_factura.cantidad*entrada.precioEntrada*(1+grupo.porganancia))\n" +
"FROM medicamento INNER JOIN\n" +
"detalle_entrada INNER JOIN\n" +
"entrada ON detalle_entrada.fkentrada = entrada.idEntr ON medicamento.idMedica = detalle_entrada.fkmedicina INNER JOIN\n" +
"factura INNER JOIN detalle_factura ON factura.idFactura = detalle_factura.fkfactura ON medicamento.idMedica = detalle_factura.fkmedicina INNER JOIN\n" +
"subgrupo ON medicamento.fkSubGrupo = subgrupo.idsubgrupo INNER JOIN\n" +
"grupo ON subgrupo.fkGrupo = grupo.idgrupo\n" +
"where factura.idFactura=?)FROM tipo_pago where tipo_pago.descripcionTipoPago='efectivo'"; 
    
    
    
public static String gratis="INSERT INTO pago (fkTipopago,valorPago) \n" +
"SELECT tipo_pago.idTipopago,(0)FROM tipo_pago \n" +
"where tipo_pago.descripcionTipoPago='gratis'";

public static String update="UPDATE factura SET \n" +
"factura.fkPago = (Select MAX(pago.idPago) FROM pago),factura.estado='Cancelado' \n" +
"WHERE factura.idFactura=?";
    
    
    
    
    
    
    
    
    
    
    
    
    
    private String paciente;
    private String medicamento;
    private int cantidad;
    private float precio;
    private int codigo;
    private Date fecha;
    private float subtotal;

    public float getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(float subtotal) {
        this.subtotal = subtotal;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

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

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }
}
