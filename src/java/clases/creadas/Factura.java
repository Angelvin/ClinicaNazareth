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
@Table(name = "factura", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Factura.findAll", query = "SELECT f FROM Factura f"),
    @NamedQuery(name = "Factura.findByIdFactura", query = "SELECT f FROM Factura f WHERE f.idFactura = :idFactura"),
    @NamedQuery(name = "Factura.findByEstado", query = "SELECT f FROM Factura f WHERE f.estado = :estado"),
    @NamedQuery(name = "Factura.findByFkEmpleado", query = "SELECT f FROM Factura f WHERE f.fkEmpleado = :fkEmpleado")})
public class Factura implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idFactura")
    private Integer idFactura;
    @Size(max = 50)
    @Column(name = "estado")
    private String estado;
    @Column(name = "fkEmpleado")
    private Integer fkEmpleado;
    @JoinColumn(name = "fkconsulta", referencedColumnName = "idConsulta")
    @ManyToOne
    private Consulta fkconsulta;
    @JoinColumn(name = "fkPaciente", referencedColumnName = "idPaciente")
    @ManyToOne(optional = false)
    private Paciente fkPaciente;
    @JoinColumn(name = "fkPago", referencedColumnName = "idPago")
    @ManyToOne
    private Pago fkPago;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkfactura")
    private List<DetalleFactura> detalleFacturaList;

    public Factura() {
    }

    public Factura(Integer idFactura) {
        this.idFactura = idFactura;
    }

    public Integer getIdFactura() {
        return idFactura;
    }

    public void setIdFactura(Integer idFactura) {
        this.idFactura = idFactura;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Integer getFkEmpleado() {
        return fkEmpleado;
    }

    public void setFkEmpleado(Integer fkEmpleado) {
        this.fkEmpleado = fkEmpleado;
    }

    public Consulta getFkconsulta() {
        return fkconsulta;
    }

    public void setFkconsulta(Consulta fkconsulta) {
        this.fkconsulta = fkconsulta;
    }

    public Paciente getFkPaciente() {
        return fkPaciente;
    }

    public void setFkPaciente(Paciente fkPaciente) {
        this.fkPaciente = fkPaciente;
    }

    public Pago getFkPago() {
        return fkPago;
    }

    public void setFkPago(Pago fkPago) {
        this.fkPago = fkPago;
    }

    @XmlTransient
    public List<DetalleFactura> getDetalleFacturaList() {
        return detalleFacturaList;
    }

    public void setDetalleFacturaList(List<DetalleFactura> detalleFacturaList) {
        this.detalleFacturaList = detalleFacturaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idFactura != null ? idFactura.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Factura)) {
            return false;
        }
        Factura other = (Factura) object;
        if ((this.idFactura == null && other.idFactura != null) || (this.idFactura != null && !this.idFactura.equals(other.idFactura))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "clases.creadas.Factura[ idFactura=" + idFactura + " ]";
    }
    
}
