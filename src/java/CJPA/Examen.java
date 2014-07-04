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
@Table(name = "examen", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Examen.findAll", query = "SELECT e FROM Examen e"),
    @NamedQuery(name = "Examen.findByIdExamen", query = "SELECT e FROM Examen e WHERE e.idExamen = :idExamen"),
    @NamedQuery(name = "Examen.findByFechasoliExamen", query = "SELECT e FROM Examen e WHERE e.fechasoliExamen = :fechasoliExamen"),
    @NamedQuery(name = "Examen.findByFechaaplicacionExamen", query = "SELECT e FROM Examen e WHERE e.fechaaplicacionExamen = :fechaaplicacionExamen"),
    @NamedQuery(name = "Examen.findByObservExamen", query = "SELECT e FROM Examen e WHERE e.observExamen = :observExamen"),
    @NamedQuery(name = "Examen.findByFkExpediente", query = "SELECT e FROM Examen e WHERE e.fkExpediente = :fkExpediente")})
public class Examen implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idExamen")
    private Integer idExamen;
    @Column(name = "fechasoliExamen")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechasoliExamen;
    @Column(name = "fechaaplicacionExamen")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaaplicacionExamen;
    @Size(max = 50)
    @Column(name = "observExamen")
    private String observExamen;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fkExpediente")
    private int fkExpediente;
    @JoinColumn(name = "fkConsulta", referencedColumnName = "idConsulta")
    @ManyToOne
    private Consulta fkConsulta;
    @JoinColumn(name = "fkResultado", referencedColumnName = "idResultado")
    @ManyToOne(optional = false)
    private Resultado fkResultado;
    @JoinColumn(name = "fkTipoexamen", referencedColumnName = "idTipoExamen")
    @ManyToOne(optional = false)
    private TipoExamen fkTipoexamen;

    public Examen() {
    }

    public Examen(Integer idExamen) {
        this.idExamen = idExamen;
    }

    public Examen(Integer idExamen, int fkExpediente) {
        this.idExamen = idExamen;
        this.fkExpediente = fkExpediente;
    }

    public Integer getIdExamen() {
        return idExamen;
    }

    public void setIdExamen(Integer idExamen) {
        this.idExamen = idExamen;
    }

    public Date getFechasoliExamen() {
        return fechasoliExamen;
    }

    public void setFechasoliExamen(Date fechasoliExamen) {
        this.fechasoliExamen = fechasoliExamen;
    }

    public Date getFechaaplicacionExamen() {
        return fechaaplicacionExamen;
    }

    public void setFechaaplicacionExamen(Date fechaaplicacionExamen) {
        this.fechaaplicacionExamen = fechaaplicacionExamen;
    }

    public String getObservExamen() {
        return observExamen;
    }

    public void setObservExamen(String observExamen) {
        this.observExamen = observExamen;
    }

    public int getFkExpediente() {
        return fkExpediente;
    }

    public void setFkExpediente(int fkExpediente) {
        this.fkExpediente = fkExpediente;
    }

    public Consulta getFkConsulta() {
        return fkConsulta;
    }

    public void setFkConsulta(Consulta fkConsulta) {
        this.fkConsulta = fkConsulta;
    }

    public Resultado getFkResultado() {
        return fkResultado;
    }

    public void setFkResultado(Resultado fkResultado) {
        this.fkResultado = fkResultado;
    }

    public TipoExamen getFkTipoexamen() {
        return fkTipoexamen;
    }

    public void setFkTipoexamen(TipoExamen fkTipoexamen) {
        this.fkTipoexamen = fkTipoexamen;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idExamen != null ? idExamen.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Examen)) {
            return false;
        }
        Examen other = (Examen) object;
        if ((this.idExamen == null && other.idExamen != null) || (this.idExamen != null && !this.idExamen.equals(other.idExamen))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Examen[ idExamen=" + idExamen + " ]";
    }
}
