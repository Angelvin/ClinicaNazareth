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
@Table(name = "municipio", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Municipio.findAll", query = "SELECT m FROM Municipio m"),
    @NamedQuery(name = "Municipio.findByIdmuni", query = "SELECT m FROM Municipio m WHERE m.idmuni = :idmuni"),
    @NamedQuery(name = "Municipio.findByNombreMui", query = "SELECT m FROM Municipio m WHERE m.nombreMui = :nombreMui")})
public class Municipio implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idmuni")
    private Integer idmuni;
    @Size(max = 255)
    @Column(name = "nombreMui")
    private String nombreMui;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkMunicipio")
    private List<Direccion> direccionList;
    @JoinColumn(name = "fkDepa", referencedColumnName = "idDep")
    @ManyToOne
    private Departamento fkDepa;

    public Municipio() {
    }

    public Municipio(Integer idmuni) {
        this.idmuni = idmuni;
    }

    public Integer getIdmuni() {
        return idmuni;
    }

    public void setIdmuni(Integer idmuni) {
        this.idmuni = idmuni;
    }

    public String getNombreMui() {
        return nombreMui;
    }

    public void setNombreMui(String nombreMui) {
        this.nombreMui = nombreMui;
    }

    @XmlTransient
    public List<Direccion> getDireccionList() {
        return direccionList;
    }

    public void setDireccionList(List<Direccion> direccionList) {
        this.direccionList = direccionList;
    }

    public Departamento getFkDepa() {
        return fkDepa;
    }

    public void setFkDepa(Departamento fkDepa) {
        this.fkDepa = fkDepa;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmuni != null ? idmuni.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Municipio)) {
            return false;
        }
        Municipio other = (Municipio) object;
        if ((this.idmuni == null && other.idmuni != null) || (this.idmuni != null && !this.idmuni.equals(other.idmuni))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "clases.creadas.Municipio[ idmuni=" + idmuni + " ]";
    }
    
}
