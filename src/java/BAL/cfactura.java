/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package BAL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import DAL.MyDatabase;
import BEANS.beanFactura;
/**
 *
 * @author KDSoul
 */
public class cfactura {
    
public static String select = "SELECT factura.idfactura as Codigo, concat(persona.pApellPer,' ',persona.sApellPer,',',persona.pnombrePer,' ',persona.snombrePer) as Paciente,\n" +
"consulta.fechaConsulta as Fecha,\n" +
"medicamento.nombreMedica as Medicamento,\n" +
"detalle_factura.cantidad as Cantidad,\n" +
"entrada.precioEntrada*(1+grupo.porganancia) as precio,\n" +
"detalle_factura.cantidad*entrada.precioEntrada*(1+grupo.porganancia) as Subtotal\n" +
"FROM consulta INNER JOIN\n" +
"factura ON consulta.idConsulta = factura.fkconsulta INNER JOIN\n" +
"detalle_factura ON factura.idFactura = detalle_factura.fkfactura INNER JOIN\n" +
"medicamento ON detalle_factura.fkmedicina = medicamento.idMedica INNER JOIN\n" +
"paciente ON factura.fkPaciente = paciente.idPaciente INNER JOIN\n" +
"persona ON paciente.fkpersona = persona.idPersona INNER JOIN\n" +
"subgrupo ON medicamento.fkSubGrupo = subgrupo.idsubgrupo INNER JOIN\n" +
"grupo ON subgrupo.fkGrupo = grupo.idgrupo INNER JOIN\n" +
"detalle_entrada ON medicamento.idMedica = detalle_entrada.fkmedicina INNER JOIN\n" +
"entrada ON medicamento.idMedica = entrada.fkmedicamento AND detalle_entrada.fkentrada = entrada.idEntr \n" +
"where factura.estado='Pendiente'";







public List<beanFactura> getlistado() {
        List<beanFactura> lista = new ArrayList<beanFactura>(0);
        Connection cnn = MyDatabase.getConection();
        
        try {   
           Statement sta = cnn.createStatement();
           ResultSet rs = sta.executeQuery(cfactura.select);
        
        
            /* String pr = "{call pacienteConfirmado}"; */
       
            while (rs.next()) {
                 beanFactura cu = new beanFactura();
                cu.setCodigo(rs.getInt("Codigo"));
                 cu.setPaciente(rs.getString("Paciente"));
                 cu.setFecha(rs.getDate("Fecha"));
                 cu.setMedicamento(rs.getString("Medicamento"));
                 cu.setCantidad(rs.getInt("Cantidad"));
                 cu.setPrecio(rs.getFloat("precio"));
                 cu.setSubtotal(rs.getFloat("Subtotal"));
      
                 
                 lista.add(cu);
            }
            rs.close();
            sta.close();
            cnn.close();

        } catch (Exception ex) {
        } finally {
            return lista;
        }
}
}