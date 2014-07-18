/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BAL;

import DAL.MyDatabase;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Angel
 */
public class cita {

      Connection bdconeccion=MyDatabase.getConection();
    CallableStatement buscador=null;

    
    
    

    public static DatoCita getDatos(int id) {
        DatoCita list = new DatoCita();
        try {
            Connection cnn = MyDatabase.getConection();
            String SQL = "select c.idCita, (c.fechaCita) as fecha ,(h.horaini) as Horario,(c.correoCita) as  correo,(c.estadoCita) as Estado,(n.pnombrePer) as Nombre,(n.pApellPer)AS Apellido ,(p.pApellPer )as Medico  from Cita as c inner join horario as h on c.fkhorario=h.idhorario inner join empleado as e  on h.fkempleado=e.idEmpleado inner join persona as p on p.idPersona=e.fkpersona inner join paciente as  m on c.fkPaciente=m.idPaciente inner join persona as n on n.idPersona=m.fkpersona where idCita=" + id;
            Statement stmt = cnn.createStatement();
            ResultSet rs = stmt.executeQuery(SQL);
            while (rs.next()) {
                list.setIdcita(rs.getInt(1));
                list.setFecha(rs.getDate(2));
                list.setHorario(rs.getString(3));
                list.setCorreo(rs.getString(4));
                list.setEstado(rs.getString(5));
                list.setNombre(rs.getString(6));
                list.setApellido(rs.getString(7));
                list.setMedico(rs.getString(8));
            }
            cnn.close();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return list;
    }
}
