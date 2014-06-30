/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package clases.creadas;

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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Angel
 */
@Entity
@Table(name = "detalle_medicina", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DetalleMedicina.findAll", query = "SELECT d FROM DetalleMedicina d"),
    @NamedQuery(name = "DetalleMedicina.findByIdDetMedTrata", query = "SELECT d FROM DetalleMedicina d WHERE d.idDetMedTrata = :idDetMedTrata"),
    @NamedQuery(name = "DetalleMedicina.findByFkSalidaPro", query = "SELECT d FROM DetalleMedicina d WHERE d.fkSalidaPro = :fkSalidaPro")})
public class DetalleMedicina implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idDetMedTrata")
    private Integer idDetMedTrata;
    @Column(name = "fkSalidaPro")
    private Integer fkSalidaPro;
    @OneToMany(mappedBy = "fkDetMedTrata")
    private List<Expediente> expedienteList;
    @JoinColumn(name = "fkTratamiento", referencedColumnName = "idTratamiento")
    @ManyToOne
    private Tratamiento fkTratamiento;

    public DetalleMedicina() {
    }

    public DetalleMedicina(Integer idDetMedTrata) {
        this.idDetMedTrata = idDetMedTrata;
    }

    public Integer getIdDetMedTrata() {
        return idDetMedTrata;
    }

    public void setIdDetMedTrata(Integer idDetMedTrata) {
        this.idDetMedTrata = idDetMedTrata;
    }

    public Integer getFkSalidaPro() {
        return fkSalidaPro;
    }

    public void setFkSalidaPro(Integer fkSalidaPro) {
        this.fkSalidaPro = fkSalidaPro;
    }

    @XmlTransient
    public List<Expediente> getExpedienteList() {
        return expedienteList;
    }

    public void setExpedienteList(List<Expediente> expedienteList) {
        this.expedienteList = expedienteList;
    }

    public Tratamiento getFkTratamiento() {
        return fkTratamiento;
    }

    public void setFkTratamiento(Tratamiento fkTratamiento) {
        this.fkTratamiento = fkTratamiento;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDetMedTrata != null ? idDetMedTrata.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetalleMedicina)) {
            return false;
        }
        DetalleMedicina other = (DetalleMedicina) object;
        if ((this.idDetMedTrata == null && other.idDetMedTrata != null) || (this.idDetMedTrata != null && !this.idDetMedTrata.equals(other.idDetMedTrata))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "clases.creadas.DetalleMedicina[ idDetMedTrata=" + idDetMedTrata + " ]";
    }
    
}
