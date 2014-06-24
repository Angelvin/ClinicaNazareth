/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package clases.creadas;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
 * @author Angel
 */
@Entity
@Table(name = "tipo_examen", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoExamen.findAll", query = "SELECT t FROM TipoExamen t"),
    @NamedQuery(name = "TipoExamen.findByIdTipoExamen", query = "SELECT t FROM TipoExamen t WHERE t.idTipoExamen = :idTipoExamen"),
    @NamedQuery(name = "TipoExamen.findByNombreTipoExa", query = "SELECT t FROM TipoExamen t WHERE t.nombreTipoExa = :nombreTipoExa"),
    @NamedQuery(name = "TipoExamen.findByDescripcionTipoExa", query = "SELECT t FROM TipoExamen t WHERE t.descripcionTipoExa = :descripcionTipoExa")})
public class TipoExamen implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idTipoExamen")
    private Integer idTipoExamen;
    @Size(max = 50)
    @Column(name = "nombreTipoExa")
    private String nombreTipoExa;
    @Size(max = 90)
    @Column(name = "descripcionTipoExa")
    private String descripcionTipoExa;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkTipoexamen")
    private List<Examen> examenList;

    public TipoExamen() {
    }

    public TipoExamen(Integer idTipoExamen) {
        this.idTipoExamen = idTipoExamen;
    }

    public Integer getIdTipoExamen() {
        return idTipoExamen;
    }

    public void setIdTipoExamen(Integer idTipoExamen) {
        this.idTipoExamen = idTipoExamen;
    }

    public String getNombreTipoExa() {
        return nombreTipoExa;
    }

    public void setNombreTipoExa(String nombreTipoExa) {
        this.nombreTipoExa = nombreTipoExa;
    }

    public String getDescripcionTipoExa() {
        return descripcionTipoExa;
    }

    public void setDescripcionTipoExa(String descripcionTipoExa) {
        this.descripcionTipoExa = descripcionTipoExa;
    }

    @XmlTransient
    public List<Examen> getExamenList() {
        return examenList;
    }

    public void setExamenList(List<Examen> examenList) {
        this.examenList = examenList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoExamen != null ? idTipoExamen.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoExamen)) {
            return false;
        }
        TipoExamen other = (TipoExamen) object;
        if ((this.idTipoExamen == null && other.idTipoExamen != null) || (this.idTipoExamen != null && !this.idTipoExamen.equals(other.idTipoExamen))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "clases.creadas.TipoExamen[ idTipoExamen=" + idTipoExamen + " ]";
    }
    
}
