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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author daMgeL
 */
@Entity
@Table(name = "salida", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Salida.findAll", query = "SELECT s FROM Salida s"),
    @NamedQuery(name = "Salida.findByIdsalida", query = "SELECT s FROM Salida s WHERE s.idsalida = :idsalida"),
    @NamedQuery(name = "Salida.findByFechaSalida", query = "SELECT s FROM Salida s WHERE s.fechaSalida = :fechaSalida")})
public class Salida implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idsalida")
    private Integer idsalida;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaSalida")
    @Temporal(TemporalType.DATE)
    private Date fechaSalida;
    @JoinColumn(name = "fkMedicamento", referencedColumnName = "idMedica")
    @ManyToOne(optional = false)
    private Medicamento fkMedicamento;
    @JoinColumn(name = "fktiposalida", referencedColumnName = "id")
    @ManyToOne
    private TipoSalida fktiposalida;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fksalida")
    private List<DetalleSalida> detalleSalidaList;

    public Salida() {
    }

    public Salida(Integer idsalida) {
        this.idsalida = idsalida;
    }

    public Salida(Integer idsalida, Date fechaSalida) {
        this.idsalida = idsalida;
        this.fechaSalida = fechaSalida;
    }

    public Integer getIdsalida() {
        return idsalida;
    }

    public void setIdsalida(Integer idsalida) {
        this.idsalida = idsalida;
    }

    public Date getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(Date fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public Medicamento getFkMedicamento() {
        return fkMedicamento;
    }

    public void setFkMedicamento(Medicamento fkMedicamento) {
        this.fkMedicamento = fkMedicamento;
    }

    public TipoSalida getFktiposalida() {
        return fktiposalida;
    }

    public void setFktiposalida(TipoSalida fktiposalida) {
        this.fktiposalida = fktiposalida;
    }

    @XmlTransient
    public List<DetalleSalida> getDetalleSalidaList() {
        return detalleSalidaList;
    }

    public void setDetalleSalidaList(List<DetalleSalida> detalleSalidaList) {
        this.detalleSalidaList = detalleSalidaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idsalida != null ? idsalida.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Salida)) {
            return false;
        }
        Salida other = (Salida) object;
        if ((this.idsalida == null && other.idsalida != null) || (this.idsalida != null && !this.idsalida.equals(other.idsalida))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Salida[ idsalida=" + idsalida + " ]";
    }
}
