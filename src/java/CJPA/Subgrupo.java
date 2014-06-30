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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "subgrupo", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Subgrupo.findAll", query = "SELECT s FROM Subgrupo s"),
    @NamedQuery(name = "Subgrupo.findByIdSubGrupo", query = "SELECT s FROM Subgrupo s WHERE s.idSubGrupo = :idSubGrupo"),
    @NamedQuery(name = "Subgrupo.findByNombreSubGrupo", query = "SELECT s FROM Subgrupo s WHERE s.nombreSubGrupo = :nombreSubGrupo")})
public class Subgrupo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idSubGrupo")
    private Integer idSubGrupo;
    @Size(max = 50)
    @Column(name = "nombreSubGrupo")
    private String nombreSubGrupo;
    @JoinColumn(name = "fkGrupo", referencedColumnName = "idGrupo")
    @ManyToOne
    private Grupo fkGrupo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkSubGrupo")
    private List<Medicamento> medicamentoList;

    public Subgrupo() {
    }

    public Subgrupo(Integer idSubGrupo) {
        this.idSubGrupo = idSubGrupo;
    }

    public Integer getIdSubGrupo() {
        return idSubGrupo;
    }

    public void setIdSubGrupo(Integer idSubGrupo) {
        this.idSubGrupo = idSubGrupo;
    }

    public String getNombreSubGrupo() {
        return nombreSubGrupo;
    }

    public void setNombreSubGrupo(String nombreSubGrupo) {
        this.nombreSubGrupo = nombreSubGrupo;
    }

    public Grupo getFkGrupo() {
        return fkGrupo;
    }

    public void setFkGrupo(Grupo fkGrupo) {
        this.fkGrupo = fkGrupo;
    }

    @XmlTransient
    public List<Medicamento> getMedicamentoList() {
        return medicamentoList;
    }

    public void setMedicamentoList(List<Medicamento> medicamentoList) {
        this.medicamentoList = medicamentoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSubGrupo != null ? idSubGrupo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Subgrupo)) {
            return false;
        }
        Subgrupo other = (Subgrupo) object;
        if ((this.idSubGrupo == null && other.idSubGrupo != null) || (this.idSubGrupo != null && !this.idSubGrupo.equals(other.idSubGrupo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "clases.creadas.Subgrupo[ idSubGrupo=" + idSubGrupo + " ]";
    }
    
}
