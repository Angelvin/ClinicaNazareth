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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author daMgeL
 */
@Entity
@Table(name = "tipo_tratamiento", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoTratamiento.findAll", query = "SELECT t FROM TipoTratamiento t"),
    @NamedQuery(name = "TipoTratamiento.findByIdTipoTratamient", query = "SELECT t FROM TipoTratamiento t WHERE t.idTipoTratamient = :idTipoTratamient"),
    @NamedQuery(name = "TipoTratamiento.findByNombreTipoTrata", query = "SELECT t FROM TipoTratamiento t WHERE t.nombreTipoTrata = :nombreTipoTrata"),
    @NamedQuery(name = "TipoTratamiento.findByDescripcionTipoTrata", query = "SELECT t FROM TipoTratamiento t WHERE t.descripcionTipoTrata = :descripcionTipoTrata")})
public class TipoTratamiento implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idTipoTratamient")
    private Integer idTipoTratamient;
    @Size(max = 50)
    @Column(name = "nombreTipoTrata")
    private String nombreTipoTrata;
    @Size(max = 50)
    @Column(name = "descripcionTipoTrata")
    private String descripcionTipoTrata;
    @OneToMany(mappedBy = "fkTipoTrata")
    private List<Tratamiento> tratamientoList;

    public TipoTratamiento() {
    }

    public TipoTratamiento(Integer idTipoTratamient) {
        this.idTipoTratamient = idTipoTratamient;
    }

    public Integer getIdTipoTratamient() {
        return idTipoTratamient;
    }

    public void setIdTipoTratamient(Integer idTipoTratamient) {
        this.idTipoTratamient = idTipoTratamient;
    }

    public String getNombreTipoTrata() {
        return nombreTipoTrata;
    }

    public void setNombreTipoTrata(String nombreTipoTrata) {
        this.nombreTipoTrata = nombreTipoTrata;
    }

    public String getDescripcionTipoTrata() {
        return descripcionTipoTrata;
    }

    public void setDescripcionTipoTrata(String descripcionTipoTrata) {
        this.descripcionTipoTrata = descripcionTipoTrata;
    }

    @XmlTransient
    public List<Tratamiento> getTratamientoList() {
        return tratamientoList;
    }

    public void setTratamientoList(List<Tratamiento> tratamientoList) {
        this.tratamientoList = tratamientoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoTratamient != null ? idTipoTratamient.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoTratamiento)) {
            return false;
        }
        TipoTratamiento other = (TipoTratamiento) object;
        if ((this.idTipoTratamient == null && other.idTipoTratamient != null) || (this.idTipoTratamient != null && !this.idTipoTratamient.equals(other.idTipoTratamient))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.TipoTratamiento[ idTipoTratamient=" + idTipoTratamient + " ]";
    }
}
