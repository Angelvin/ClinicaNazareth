/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CJPA;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
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
@Table(name = "tipo_pago", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoPago.findAll", query = "SELECT t FROM TipoPago t"),
    @NamedQuery(name = "TipoPago.findByIdTipopago", query = "SELECT t FROM TipoPago t WHERE t.idTipopago = :idTipopago"),
    @NamedQuery(name = "TipoPago.findByDescripcionTipoPago", query = "SELECT t FROM TipoPago t WHERE t.descripcionTipoPago = :descripcionTipoPago")})
public class TipoPago implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idTipopago")
    private Integer idTipopago;
    @Size(max = 50)
    @Column(name = "descripcionTipoPago")
    private String descripcionTipoPago;
    @OneToMany(mappedBy = "fkTipopago")
    private List<Pago> pagoList;

    public TipoPago() {
    }

    public TipoPago(Integer idTipopago) {
        this.idTipopago = idTipopago;
    }

    public Integer getIdTipopago() {
        return idTipopago;
    }

    public void setIdTipopago(Integer idTipopago) {
        this.idTipopago = idTipopago;
    }

    public String getDescripcionTipoPago() {
        return descripcionTipoPago;
    }

    public void setDescripcionTipoPago(String descripcionTipoPago) {
        this.descripcionTipoPago = descripcionTipoPago;
    }

    @XmlTransient
    public List<Pago> getPagoList() {
        return pagoList;
    }

    public void setPagoList(List<Pago> pagoList) {
        this.pagoList = pagoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipopago != null ? idTipopago.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoPago)) {
            return false;
        }
        TipoPago other = (TipoPago) object;
        if ((this.idTipopago == null && other.idTipopago != null) || (this.idTipopago != null && !this.idTipopago.equals(other.idTipopago))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.TipoPago[ idTipopago=" + idTipopago + " ]";
    }
}
