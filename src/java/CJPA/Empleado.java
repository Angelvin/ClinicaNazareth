/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CJPA;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author daMgeL
 */
@Entity
@Table(name = "empleado", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Empleado.findAll", query = "SELECT e FROM Empleado e"),
    @NamedQuery(name = "Empleado.findByIdEmpleado", query = "SELECT e FROM Empleado e WHERE e.idEmpleado = :idEmpleado")})
public class Empleado implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idEmpleado", nullable = false)
    private Integer idEmpleado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkempleado")
    private List<Horario> horarioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkEmpleado")
    private List<Expediente> expedienteList;
    @JoinColumn(name = "fkCargo", referencedColumnName = "idCargo")
    @ManyToOne(optional = false)
    private Cargo fkCargo;
    @JoinColumn(name = "fkpersona", referencedColumnName = "idPersona")
    @OneToOne(optional = false)
    private Persona fkpersona;
    @JoinColumn(name = "fkTipoemple", referencedColumnName = "idTipoEmpleado")
    @ManyToOne(optional = false)
    private TipoEmpleado fkTipoemple;
    @OneToMany(mappedBy = "fkEmpleado")
    private List<Entrada> entradaList;
    @OneToMany(mappedBy = "fkMedico")
    private List<Junta> juntaList;

    public Empleado() {
    }

    public Empleado(Integer idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public Integer getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(Integer idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    @XmlTransient
    public List<Horario> getHorarioList() {
        return horarioList;
    }

    public void setHorarioList(List<Horario> horarioList) {
        this.horarioList = horarioList;
    }

    @XmlTransient
    public List<Expediente> getExpedienteList() {
        return expedienteList;
    }

    public void setExpedienteList(List<Expediente> expedienteList) {
        this.expedienteList = expedienteList;
    }

    public Cargo getFkCargo() {
        return fkCargo;
    }

    public void setFkCargo(Cargo fkCargo) {
        this.fkCargo = fkCargo;
    }

    public Persona getFkpersona() {
        return fkpersona;
    }

    public void setFkpersona(Persona fkpersona) {
        this.fkpersona = fkpersona;
    }

    public TipoEmpleado getFkTipoemple() {
        return fkTipoemple;
    }

    public void setFkTipoemple(TipoEmpleado fkTipoemple) {
        this.fkTipoemple = fkTipoemple;
    }

    @XmlTransient
    public List<Entrada> getEntradaList() {
        return entradaList;
    }

    public void setEntradaList(List<Entrada> entradaList) {
        this.entradaList = entradaList;
    }

    @XmlTransient
    public List<Junta> getJuntaList() {
        return juntaList;
    }

    public void setJuntaList(List<Junta> juntaList) {
        this.juntaList = juntaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEmpleado != null ? idEmpleado.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Empleado)) {
            return false;
        }
        Empleado other = (Empleado) object;
        if ((this.idEmpleado == null && other.idEmpleado != null) || (this.idEmpleado != null && !this.idEmpleado.equals(other.idEmpleado))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Empleado[ idEmpleado=" + idEmpleado + " ]";
    }
}
