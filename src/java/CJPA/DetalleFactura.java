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
@Table(name = "detalle_factura", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DetalleFactura.findAll", query = "SELECT d FROM DetalleFactura d"),
    @NamedQuery(name = "DetalleFactura.findById", query = "SELECT d FROM DetalleFactura d WHERE d.id = :id"),
    @NamedQuery(name = "DetalleFactura.findByCantidad", query = "SELECT d FROM DetalleFactura d WHERE d.cantidad = :cantidad")})
public class DetalleFactura implements Serializable {
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
    @JoinColumn(name = "fkfactura", referencedColumnName = "idFactura")
    @ManyToOne(optional = false)
    private Factura fkfactura;
    @JoinColumn(name = "fkmedicina", referencedColumnName = "idMedica")
    @ManyToOne(optional = false)
    private Medicamento fkmedicina;

    public DetalleFactura() {
    }

    public DetalleFactura(Integer id) {
        this.id = id;
    }

    public DetalleFactura(Integer id, int cantidad) {
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

    public Factura getFkfactura() {
        return fkfactura;
    }

    public void setFkfactura(Factura fkfactura) {
        this.fkfactura = fkfactura;
    }

    public Medicamento getFkmedicina() {
        return fkmedicina;
    }

    public void setFkmedicina(Medicamento fkmedicina) {
        this.fkmedicina = fkmedicina;
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
        if (!(object instanceof DetalleFactura)) {
            return false;
        }
        DetalleFactura other = (DetalleFactura) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.DetalleFactura[ id=" + id + " ]";
    }
}
