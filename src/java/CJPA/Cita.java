/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CJPA;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author daMgeL
 */
@Entity
@Table(name = "cita", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cita.findAll", query = "SELECT c FROM Cita c"),
    @NamedQuery(name = "Cita.findByIdCita", query = "SELECT c FROM Cita c WHERE c.idCita = :idCita"),
    @NamedQuery(name = "Cita.findByFechaCita", query = "SELECT c FROM Cita c WHERE c.fechaCita = :fechaCita"),
    @NamedQuery(name = "Cita.findByCorreoCita", query = "SELECT c FROM Cita c WHERE c.correoCita = :correoCita"),
    @NamedQuery(name = "Cita.findByMotivo", query = "SELECT c FROM Cita c WHERE c.motivo = :motivo"),
    @NamedQuery(name = "Cita.findByEstadoCita", query = "SELECT c FROM Cita c WHERE c.estadoCita = :estadoCita")})
public class Cita implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idCita")
    private Integer idCita;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaCita")
    @Temporal(TemporalType.DATE)
    private Date fechaCita;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "correoCita")
    private String correoCita;
    @Size(max = 90)
    @Column(name = "motivo")
    private String motivo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "estadoCita")
    private String estadoCita;
    @OneToOne(mappedBy = "fkcita")
    private Consulta consulta;
    @JoinColumn(name = "fkhorario", referencedColumnName = "idhorario")
    @ManyToOne(optional = false)
    private Horario fkhorario;
    @JoinColumn(name = "fkPaciente", referencedColumnName = "idPaciente")
    @ManyToOne(optional = false)
    private Paciente fkPaciente;

    public Cita() {
    }

    public Cita(Integer idCita) {
        this.idCita = idCita;
    }

    public Cita(Integer idCita, Date fechaCita, String correoCita, String estadoCita) {
        this.idCita = idCita;
        this.fechaCita = fechaCita;
        this.correoCita = correoCita;
        this.estadoCita = estadoCita;
    }

    public Integer getIdCita() {
        return idCita;
    }

    public void setIdCita(Integer idCita) {
        this.idCita = idCita;
    }

    public Date getFechaCita() {
        return fechaCita;
    }

    public void setFechaCita(Date fechaCita) {
        this.fechaCita = fechaCita;
    }

    public String getCorreoCita() {
        return correoCita;
    }

    public void setCorreoCita(String correoCita) {
        this.correoCita = correoCita;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getEstadoCita() {
        return estadoCita;
    }

    public void setEstadoCita(String estadoCita) {
        this.estadoCita = estadoCita;
    }

    public Consulta getConsulta() {
        return consulta;
    }

    public void setConsulta(Consulta consulta) {
        this.consulta = consulta;
    }

    public Horario getFkhorario() {
        return fkhorario;
    }

    public void setFkhorario(Horario fkhorario) {
        this.fkhorario = fkhorario;
    }

    public Paciente getFkPaciente() {
        return fkPaciente;
    }

    public void setFkPaciente(Paciente fkPaciente) {
        this.fkPaciente = fkPaciente;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCita != null ? idCita.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cita)) {
            return false;
        }
        Cita other = (Cita) object;
        if ((this.idCita == null && other.idCita != null) || (this.idCita != null && !this.idCita.equals(other.idCita))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Cita[ idCita=" + idCita + " ]";
    }
}
