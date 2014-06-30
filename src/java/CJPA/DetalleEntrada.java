/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package clases.creadas;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Angel
 */
@Entity
@Table(name = "detalle_entrada", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DetalleEntrada.findAll", query = "SELECT d FROM DetalleEntrada d"),
    @NamedQuery(name = "DetalleEntrada.findById", query = "SELECT d FROM DetalleEntrada d WHERE d.id = :id"),
    @NamedQuery(name = "DetalleEntrada.findByCantidad", query = "SELECT d FROM DetalleEntrada d WHERE d.cantidad = :cantidad"),
    @NamedQuery(name = "DetalleEntrada.findByFechacaducidad", query = "SELECT d FROM DetalleEntrada d WHERE d.fechacaducidad = :fechacaducidad")})
public class DetalleEntrada implements Serializable {
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
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechacaducidad")
    @Temporal(TemporalType.DATE)
    private Date fechacaducidad;
    @JoinColumn(name = "fkentrada", referencedColumnName = "idEntr")
    @ManyToOne(optional = false)
    private Entrada fkentrada;
    @JoinColumn(name = "fkmedicina", referencedColumnName = "idMedica")
    @ManyToOne(optional = false)
    private Medicamento fkmedicina;

    public DetalleEntrada() {
    }

    public DetalleEntrada(Integer id) {
        this.id = id;
    }

    public DetalleEntrada(Integer id, int cantidad, Date fechacaducidad) {
        this.id = id;
        this.cantidad = cantidad;
        this.fechacaducidad = fechacaducidad;
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

    public Date getFechacaducidad() {
        return fechacaducidad;
    }

    public void setFechacaducidad(Date fechacaducidad) {
        this.fechacaducidad = fechacaducidad;
    }

    public Entrada getFkentrada() {
        return fkentrada;
    }

    public void setFkentrada(Entrada fkentrada) {
        this.fkentrada = fkentrada;
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
        if (!(object instanceof DetalleEntrada)) {
            return false;
        }
        DetalleEntrada other = (DetalleEntrada) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "clases.creadas.DetalleEntrada[ id=" + id + " ]";
    }
    
}
