/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CJPA;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author daMgeL
 */
@Entity
@Table(name = "detalle_salida", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DetalleSalida.findAll", query = "SELECT d FROM DetalleSalida d"),
    @NamedQuery(name = "DetalleSalida.findById", query = "SELECT d FROM DetalleSalida d WHERE d.id = :id"),
    @NamedQuery(name = "DetalleSalida.findByCantidad", query = "SELECT d FROM DetalleSalida d WHERE d.cantidad = :cantidad")})
public class DetalleSalida implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cantidad")
    private int cantidad;
    @JoinColumn(name = "fkmedicina", referencedColumnName = "idMedica")
    @ManyToOne(optional = false)
    private Medicamento fkmedicina;
    @JoinColumn(name = "fksalida", referencedColumnName = "idsalida")
    @ManyToOne(optional = false)
    private Salida fksalida;

    public DetalleSalida() {
    }

    public DetalleSalida(Integer id) {
        this.id = id;
    }

    public DetalleSalida(Integer id, int cantidad) {
        this.id = id;
        this.cantidad = cantidad;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Medicamento getFkmedicina() {
        return fkmedicina;
    }

    public void setFkmedicina(Medicamento fkmedicina) {
        this.fkmedicina = fkmedicina;
    }

    public Salida getFksalida() {
        return fksalida;
    }

    public void setFksalida(Salida fksalida) {
        this.fksalida = fksalida;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetalleSalida)) {
            return false;
        }
        DetalleSalida other = (DetalleSalida) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.DetalleSalida[ id=" + id + " ]";
    }
}
