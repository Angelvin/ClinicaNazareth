/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CJPA;

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
 * @author daMgeL
 */
@Entity
@Table(name = "cargo", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cargo.findAll", query = "SELECT c FROM Cargo c"),
    @NamedQuery(name = "Cargo.findByIdCargo", query = "SELECT c FROM Cargo c WHERE c.idCargo = :idCargo"),
    @NamedQuery(name = "Cargo.findByNombreCargo", query = "SELECT c FROM Cargo c WHERE c.nombreCargo = :nombreCargo"),
    @NamedQuery(name = "Cargo.findByDescripcionCargo", query = "SELECT c FROM Cargo c WHERE c.descripcionCargo = :descripcionCargo")})
public class Cargo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idCargo")
    private Integer idCargo;
    @Size(max = 50)
    @Column(name = "nombreCargo")
    private String nombreCargo;
    @Size(max = 50)
    @Column(name = "descripcionCargo")
    private String descripcionCargo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkCargo")
    private List<Empleado> empleadoList;

    public Cargo() {
    }

    public Cargo(Integer idCargo) {
        this.idCargo = idCargo;
    }

    public Integer getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(Integer idCargo) {
        this.idCargo = idCargo;
    }

    public String getNombreCargo() {
        return nombreCargo;
    }

    public void setNombreCargo(String nombreCargo) {
        this.nombreCargo = nombreCargo;
    }

    public String getDescripcionCargo() {
        return descripcionCargo;
    }

    public void setDescripcionCargo(String descripcionCargo) {
        this.descripcionCargo = descripcionCargo;
    }

    @XmlTransient
    public List<Empleado> getEmpleadoList() {
        return empleadoList;
    }

    public void setEmpleadoList(List<Empleado> empleadoList) {
        this.empleadoList = empleadoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCargo != null ? idCargo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cargo)) {
            return false;
        }
        Cargo other = (Cargo) object;
        if ((this.idCargo == null && other.idCargo != null) || (this.idCargo != null && !this.idCargo.equals(other.idCargo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Cargo[ idCargo=" + idCargo + " ]";
    }
}
