/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CJPA;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author daMgeL
 */
@Entity
@Table(name = "entrada", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Entrada.findAll", query = "SELECT e FROM Entrada e"),
    @NamedQuery(name = "Entrada.findByIdEntr", query = "SELECT e FROM Entrada e WHERE e.idEntr = :idEntr"),
    @NamedQuery(name = "Entrada.findByCantidadEntrada", query = "SELECT e FROM Entrada e WHERE e.cantidadEntrada = :cantidadEntrada"),
    @NamedQuery(name = "Entrada.findByPresentacionEntrada", query = "SELECT e FROM Entrada e WHERE e.presentacionEntrada = :presentacionEntrada"),
    @NamedQuery(name = "Entrada.findByPrecioEntrada", query = "SELECT e FROM Entrada e WHERE e.precioEntrada = :precioEntrada"),
    @NamedQuery(name = "Entrada.findByFechaCaducidad", query = "SELECT e FROM Entrada e WHERE e.fechaCaducidad = :fechaCaducidad"),
    @NamedQuery(name = "Entrada.findByFechain", query = "SELECT e FROM Entrada e WHERE e.fechain = :fechain")})
public class Entrada implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idEntr")
    private Integer idEntr;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cantidadEntrada")
    private int cantidadEntrada;
    @Size(max = 50)
    @Column(name = "presentacionEntrada")
    private String presentacionEntrada;
    @Column(name = "precioEntrada")
    private Long precioEntrada;
    @Column(name = "fechaCaducidad")
    @Temporal(TemporalType.DATE)
    private Date fechaCaducidad;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechain")
    @Temporal(TemporalType.DATE)
    private Date fechain;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkentrada")
    private List<DetalleEntrada> detalleEntradaList;
    @JoinColumn(name = "fkEmpleado", referencedColumnName = "idEmpleado")
    @ManyToOne
    private Empleado fkEmpleado;
    @JoinColumn(name = "fkmedicamento", referencedColumnName = "idMedica")
    @ManyToOne
    private Medicamento fkmedicamento;

    public Entrada() {
    }

    public Entrada(Integer idEntr) {
        this.idEntr = idEntr;
    }

    public Entrada(Integer idEntr, int cantidadEntrada, Date fechain) {
        this.idEntr = idEntr;
        this.cantidadEntrada = cantidadEntrada;
        this.fechain = fechain;
    }

    public Integer getIdEntr() {
        return idEntr;
    }

    public void setIdEntr(Integer idEntr) {
        this.idEntr = idEntr;
    }

    public int getCantidadEntrada() {
        return cantidadEntrada;
    }

    public void setCantidadEntrada(int cantidadEntrada) {
        this.cantidadEntrada = cantidadEntrada;
    }

    public String getPresentacionEntrada() {
        return presentacionEntrada;
    }

    public void setPresentacionEntrada(String presentacionEntrada) {
        this.presentacionEntrada = presentacionEntrada;
    }

    public Long getPrecioEntrada() {
        return precioEntrada;
    }

    public void setPrecioEntrada(Long precioEntrada) {
        this.precioEntrada = precioEntrada;
    }

    public Date getFechaCaducidad() {
        return fechaCaducidad;
    }

    public void setFechaCaducidad(Date fechaCaducidad) {
        this.fechaCaducidad = fechaCaducidad;
    }

    public Date getFechain() {
        return fechain;
    }

    public void setFechain(Date fechain) {
        this.fechain = fechain;
    }

    @XmlTransient
    public List<DetalleEntrada> getDetalleEntradaList() {
        return detalleEntradaList;
    }

    public void setDetalleEntradaList(List<DetalleEntrada> detalleEntradaList) {
        this.detalleEntradaList = detalleEntradaList;
    }

    public Empleado getFkEmpleado() {
        return fkEmpleado;
    }

    public void setFkEmpleado(Empleado fkEmpleado) {
        this.fkEmpleado = fkEmpleado;
    }

    public Medicamento getFkmedicamento() {
        return fkmedicamento;
    }

    public void setFkmedicamento(Medicamento fkmedicamento) {
        this.fkmedicamento = fkmedicamento;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEntr != null ? idEntr.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Entrada)) {
            return false;
        }
        Entrada other = (Entrada) object;
        if ((this.idEntr == null && other.idEntr != null) || (this.idEntr != null && !this.idEntr.equals(other.idEntr))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Entrada[ idEntr=" + idEntr + " ]";
    }
}
