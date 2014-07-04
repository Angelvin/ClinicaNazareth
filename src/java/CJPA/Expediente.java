/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CJPA;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author daMgeL
 */
@Entity
@Table(name = "expediente", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Expediente.findAll", query = "SELECT e FROM Expediente e"),
    @NamedQuery(name = "Expediente.findByIdExpedi", query = "SELECT e FROM Expediente e WHERE e.idExpedi = :idExpedi")})
public class Expediente implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idExpedi")
    private Integer idExpedi;
    @JoinColumn(name = "fkDetMedTrata", referencedColumnName = "idDetMedTrata")
    @ManyToOne
    private DetalleMedicina fkDetMedTrata;
    @JoinColumn(name = "fkEmpleado", referencedColumnName = "idEmpleado")
    @ManyToOne(optional = false)
    private Empleado fkEmpleado;
    @JoinColumn(name = "fkpaciente", referencedColumnName = "idPaciente")
    @OneToOne
    private Paciente fkpaciente;
    @OneToMany(mappedBy = "fkExpediente")
    private List<Consulta> consultaList;

    public Expediente() {
    }

    public Expediente(Integer idExpedi) {
        this.idExpedi = idExpedi;
    }

    public Integer getIdExpedi() {
        return idExpedi;
    }

    public void setIdExpedi(Integer idExpedi) {
        this.idExpedi = idExpedi;
    }

    public DetalleMedicina getFkDetMedTrata() {
        return fkDetMedTrata;
    }

    public void setFkDetMedTrata(DetalleMedicina fkDetMedTrata) {
        this.fkDetMedTrata = fkDetMedTrata;
    }

    public Empleado getFkEmpleado() {
        return fkEmpleado;
    }

    public void setFkEmpleado(Empleado fkEmpleado) {
        this.fkEmpleado = fkEmpleado;
    }

    public Paciente getFkpaciente() {
        return fkpaciente;
    }

    public void setFkpaciente(Paciente fkpaciente) {
        this.fkpaciente = fkpaciente;
    }

    @XmlTransient
    public List<Consulta> getConsultaList() {
        return consultaList;
    }

    public void setConsultaList(List<Consulta> consultaList) {
        this.consultaList = consultaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idExpedi != null ? idExpedi.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Expediente)) {
            return false;
        }
        Expediente other = (Expediente) object;
        if ((this.idExpedi == null && other.idExpedi != null) || (this.idExpedi != null && !this.idExpedi.equals(other.idExpedi))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Expediente[ idExpedi=" + idExpedi + " ]";
    }
}
