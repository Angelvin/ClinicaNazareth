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
@Table(name = "tipo_empleado", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoEmpleado.findAll", query = "SELECT t FROM TipoEmpleado t"),
    @NamedQuery(name = "TipoEmpleado.findByIdTipoEmpleado", query = "SELECT t FROM TipoEmpleado t WHERE t.idTipoEmpleado = :idTipoEmpleado"),
    @NamedQuery(name = "TipoEmpleado.findByNombreTipoEmp", query = "SELECT t FROM TipoEmpleado t WHERE t.nombreTipoEmp = :nombreTipoEmp"),
    @NamedQuery(name = "TipoEmpleado.findByDescripcionTipoEmp", query = "SELECT t FROM TipoEmpleado t WHERE t.descripcionTipoEmp = :descripcionTipoEmp")})
public class TipoEmpleado implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idTipoEmpleado")
    private Integer idTipoEmpleado;
    @Size(max = 50)
    @Column(name = "nombreTipoEmp")
    private String nombreTipoEmp;
    @Size(max = 80)
    @Column(name = "descripcionTipoEmp")
    private String descripcionTipoEmp;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkTipoemple")
    private List<Empleado> empleadoList;

    public TipoEmpleado() {
    }

    public TipoEmpleado(Integer idTipoEmpleado) {
        this.idTipoEmpleado = idTipoEmpleado;
    }

    public Integer getIdTipoEmpleado() {
        return idTipoEmpleado;
    }

    public void setIdTipoEmpleado(Integer idTipoEmpleado) {
        this.idTipoEmpleado = idTipoEmpleado;
    }

    public String getNombreTipoEmp() {
        return nombreTipoEmp;
    }

    public void setNombreTipoEmp(String nombreTipoEmp) {
        this.nombreTipoEmp = nombreTipoEmp;
    }

    public String getDescripcionTipoEmp() {
        return descripcionTipoEmp;
    }

    public void setDescripcionTipoEmp(String descripcionTipoEmp) {
        this.descripcionTipoEmp = descripcionTipoEmp;
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
        hash += (idTipoEmpleado != null ? idTipoEmpleado.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoEmpleado)) {
            return false;
        }
        TipoEmpleado other = (TipoEmpleado) object;
        if ((this.idTipoEmpleado == null && other.idTipoEmpleado != null) || (this.idTipoEmpleado != null && !this.idTipoEmpleado.equals(other.idTipoEmpleado))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.TipoEmpleado[ idTipoEmpleado=" + idTipoEmpleado + " ]";
    }
}
