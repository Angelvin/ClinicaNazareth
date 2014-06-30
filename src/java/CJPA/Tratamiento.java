/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package clases.creadas;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Angel
 */
@Entity
@Table(name = "tratamiento", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tratamiento.findAll", query = "SELECT t FROM Tratamiento t"),
    @NamedQuery(name = "Tratamiento.findByIdTratamiento", query = "SELECT t FROM Tratamiento t WHERE t.idTratamiento = :idTratamiento"),
    @NamedQuery(name = "Tratamiento.findByFechainiTrata", query = "SELECT t FROM Tratamiento t WHERE t.fechainiTrata = :fechainiTrata"),
    @NamedQuery(name = "Tratamiento.findByFechasoliTrata", query = "SELECT t FROM Tratamiento t WHERE t.fechasoliTrata = :fechasoliTrata"),
    @NamedQuery(name = "Tratamiento.findByObservaTrata", query = "SELECT t FROM Tratamiento t WHERE t.observaTrata = :observaTrata"),
    @NamedQuery(name = "Tratamiento.findByFechafinalTrata", query = "SELECT t FROM Tratamiento t WHERE t.fechafinalTrata = :fechafinalTrata")})
public class Tratamiento implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idTratamiento")
    private Integer idTratamiento;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechainiTrata")
    @Temporal(TemporalType.DATE)
    private Date fechainiTrata;
    @Column(name = "fechasoliTrata")
    @Temporal(TemporalType.DATE)
    private Date fechasoliTrata;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 150)
    @Column(name = "observaTrata")
    private String observaTrata;
    @Column(name = "fechafinalTrata")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechafinalTrata;
    @JoinColumn(name = "fkConsulta", referencedColumnName = "idConsulta")
    @ManyToOne
    private Consulta fkConsulta;
    @JoinColumn(name = "fkTipoTrata", referencedColumnName = "idTipoTratamient")
    @ManyToOne
    private TipoTratamiento fkTipoTrata;
    @OneToMany(mappedBy = "fkTratamiento")
    private List<DetalleMedicina> detalleMedicinaList;

    public Tratamiento() {
    }

    public Tratamiento(Integer idTratamiento) {
        this.idTratamiento = idTratamiento;
    }

    public Tratamiento(Integer idTratamiento, Date fechainiTrata, String observaTrata) {
        this.idTratamiento = idTratamiento;
        this.fechainiTrata = fechainiTrata;
        this.observaTrata = observaTrata;
    }

    public Integer getIdTratamiento() {
        return idTratamiento;
    }

    public void setIdTratamiento(Integer idTratamiento) {
        this.idTratamiento = idTratamiento;
    }

    public Date getFechainiTrata() {
        return fechainiTrata;
    }

    public void setFechainiTrata(Date fechainiTrata) {
        this.fechainiTrata = fechainiTrata;
    }

    public Date getFechasoliTrata() {
        return fechasoliTrata;
    }

    public void setFechasoliTrata(Date fechasoliTrata) {
        this.fechasoliTrata = fechasoliTrata;
    }

    public String getObservaTrata() {
        return observaTrata;
    }

    public void setObservaTrata(String observaTrata) {
        this.observaTrata = observaTrata;
    }

    public Date getFechafinalTrata() {
        return fechafinalTrata;
    }

    public void setFechafinalTrata(Date fechafinalTrata) {
        this.fechafinalTrata = fechafinalTrata;
    }

    public Consulta getFkConsulta() {
        return fkConsulta;
    }

    public void setFkConsulta(Consulta fkConsulta) {
        this.fkConsulta = fkConsulta;
    }

    public TipoTratamiento getFkTipoTrata() {
        return fkTipoTrata;
    }

    public void setFkTipoTrata(TipoTratamiento fkTipoTrata) {
        this.fkTipoTrata = fkTipoTrata;
    }

    @XmlTransient
    public List<DetalleMedicina> getDetalleMedicinaList() {
        return detalleMedicinaList;
    }

    public void setDetalleMedicinaList(List<DetalleMedicina> detalleMedicinaList) {
        this.detalleMedicinaList = detalleMedicinaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTratamiento != null ? idTratamiento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tratamiento)) {
            return false;
        }
        Tratamiento other = (Tratamiento) object;
        if ((this.idTratamiento == null && other.idTratamiento != null) || (this.idTratamiento != null && !this.idTratamiento.equals(other.idTratamiento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "clases.creadas.Tratamiento[ idTratamiento=" + idTratamiento + " ]";
    }
    
}
