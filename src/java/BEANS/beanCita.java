/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BEANS;

/**
 *
 * @author Angel
 */
public class beanCita {

    public static String validaCitapaciente = "select count(idCita) as idCita from cita where fechaCita=? and fkhorario=?";
    public static String CrearCita = "INSERT INTO cita (fechaCita,correoCita,fkhorario,motivo,fkpaciente)VALUES(?,?,?,?,(SELECT  pa.idPaciente FROM  LOGIN AS l INNER JOIN persona AS p ON l.idLogin=p.fkLogin INNER JOIN paciente AS pa ON p.idPersona=pa.fkpersona WHERE l.idLogin=?))";
    public static String validar = "select count(idCita) as idCita from cita where fechaCita=? and fkhorario=(select h.idhorario from horario  as h where h.horaini=? and h.fkempleado=(select e.idEmpleado from empleado as e inner join persona as p on p.idPersona=e.fkpersona where p.pApellPer =?) ) ";
    public static String Actlizar = "update cita set fechaCita=? , fkhorario=(select h.idhorario from horario  as h where h.horaini=? and h.fkempleado=(select e.idEmpleado from empleado as e inner join persona as p on p.idPersona=e.fkpersona where p.pApellPer =?) ) where idCita=?";
    public static String Ccita = "insert into cita (fechaCita,correoCita,fkhorario,motivo,fkPaciente) values(?,?,(select h.idhorario from horario  as h where h.horaini=? and h.fkempleado=(select e.idEmpleado from empleado as e inner join persona as p on p.idPersona=e.fkpersona where p.pApellPer =?)),?,(select pp.idPaciente from paciente as pp where fkpersona=?) )";
    public static String confirmado = "UPDATE Cita estadoCita=? where idcita=?";
    public static String Consulta = "UPDATE Cita set estadoCita=? where idcita=?";
    public static String cancelado = "UPDATE Cita estadoCita=? where idcita=?";
    public static String validarhorario = "select count(idhorario)as idhorario from horario where fkempleado=?";
    public static String expediente = "select idExpedi as expediente from expediente where fkpaciente=?";
    public static String inserexpe = "insert into expediente(fkempleado,fkpaciente)values((select (e.idEmpleado) as empleado  from persona as p inner join empleado as e on e.fkpersona=p.idPersona inner join login as l on l.idLogin=p.fkLogin where l.idLogin=?),?)";
    public static String getEmpleadoID = "SELECT empleado.idEmpleado FROM empleado INNER JOIN persona ON empleado.fkpersona = persona.idPersona INNER JOIN login ON persona.fkLogin = login.idLogin INNER JOIN rol ON login.fkRol = rol.idRol WHERE (rol.idRol = 2) AND (login.idLogin = ?)";

}
