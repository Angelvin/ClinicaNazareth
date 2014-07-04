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
 * @author daMgeL
 */
@Entity
@Table(name = "medicamento", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Medicamento.findAll", query = "SELECT m FROM Medicamento m"),
    @NamedQuery(name = "Medicamento.findByIdMedica", query = "SELECT m FROM Medicamento m WHERE m.idMedica = :idMedica"),
    @NamedQuery(name = "Medicamento.findByNombreMedica", query = "SELECT m FROM Medicamento m WHERE m.nombreMedica = :nombreMedica"),
    @NamedQuery(name = "Medicamento.findByViaAdmonMedica", query = "SELECT m FROM Medicamento m WHERE m.viaAdmonMedica = :viaAdmonMedica"),
    @NamedQuery(name = "Medicamento.findByPresentaMedica", query = "SELECT m FROM Medicamento m WHERE m.presentaMedica = :presentaMedica"),
    @NamedQuery(name = "Medicamento.findByExistenciaMedica", query = "SELECT m FROM Medicamento m WHERE m.existenciaMedica = :existenciaMedica"),
    @NamedQuery(name = "Medicamento.findByEstadoMedica", query = "SELECT m FROM Medicamento m WHERE m.estadoMedica = :estadoMedica")})
public class Medicamento implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idMedica")
    private Integer idMedica;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "nombreMedica")
    private String nombreMedica;
    @Size(max = 50)
    @Column(name = "viaAdmonMedica")
    private String viaAdmonMedica;
    @Size(max = 50)
    @Column(name = "presentaMedica")
    private String presentaMedica;
    @Column(name = "existenciaMedica")
    private Integer existenciaMedica;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "EstadoMedica")
    private String estadoMedica;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkmedicina")
    private List<DetalleEntrada> detalleEntradaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkMedicamento")
    private List<Salida> salidaList;
    @JoinColumn(name = "fkSubGrupo", referencedColumnName = "idSubGrupo")
    @ManyToOne(optional = false)
    private Subgrupo fkSubGrupo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkmedicina")
    private List<DetalleFactura> detalleFacturaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkmedicina")
    private List<DetalleSalida> detalleSalidaList;
    @OneToMany(mappedBy = "fkmedicamento")
    private List<Entrada> entradaList;

    public Medicamento() {
    }

    public Medicamento(Integer idMedica) {
        this.idMedica = idMedica;
    }

    public Medicamento(Integer idMedica, String nombreMedica, String estadoMedica) {
        this.idMedica = idMedica;
        this.nombreMedica = nombreMedica;
        this.estadoMedica = estadoMedica;
    }

    public Integer getIdMedica() {
        return idMedica;
    }

    public void setIdMedica(Integer idMedica) {
        this.idMedica = idMedica;
    }

    public String getNombreMedica() {
        return nombreMedica;
    }

    public void setNombreMedica(String nombreMedica) {
        this.nombreMedica = nombreMedica;
    }

    public String getViaAdmonMedica() {
        return viaAdmonMedica;
    }

    public void setViaAdmonMedica(String viaAdmonMedica) {
        this.viaAdmonMedica = viaAdmonMedica;
    }

    public String getPresentaMedica() {
        return presentaMedica;
    }

    public void setPresentaMedica(String presentaMedica) {
        this.presentaMedica = presentaMedica;
    }

    public Integer getExistenciaMedica() {
        return existenciaMedica;
    }

    public void setExistenciaMedica(Integer existenciaMedica) {
        this.existenciaMedica = existenciaMedica;
    }

    public String getEstadoMedica() {
        return estadoMedica;
    }

    public void setEstadoMedica(String estadoMedica) {
        this.estadoMedica = estadoMedica;
    }

    @XmlTransient
    public List<DetalleEntrada> getDetalleEntradaList() {
        return detalleEntradaList;
    }

    public void setDetalleEntradaList(List<DetalleEntrada> detalleEntradaList) {
        this.detalleEntradaList = detalleEntradaList;
    }

    @XmlTransient
    public List<Salida> getSalidaList() {
        return salidaList;
    }

    public void setSalidaList(List<Salida> salidaList) {
        this.salidaList = salidaList;
    }

    public Subgrupo getFkSubGrupo() {
        return fkSubGrupo;
    }

    public void setFkSubGrupo(Subgrupo fkSubGrupo) {
        this.fkSubGrupo = fkSubGrupo;
    }

    @XmlTransient
    public List<DetalleFactura> getDetalleFacturaList() {
        return detalleFacturaList;
    }

    public void setDetalleFacturaList(List<DetalleFactura> detalleFacturaList) {
        this.detalleFacturaList = detalleFacturaList;
    }

    @XmlTransient
    public List<DetalleSalida> getDetalleSalidaList() {
        return detalleSalidaList;
    }

    public void setDetalleSalidaList(List<DetalleSalida> detalleSalidaList) {
        this.detalleSalidaList = detalleSalidaList;
    }

    @XmlTransient
    public List<Entrada> getEntradaList() {
        return entradaList;
    }

    public void setEntradaList(List<Entrada> entradaList) {
        this.entradaList = entradaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idMedica != null ? idMedica.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Medicamento)) {
            return false;
        }
        Medicamento other = (Medicamento) object;
        if ((this.idMedica == null && other.idMedica != null) || (this.idMedica != null && !this.idMedica.equals(other.idMedica))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Medicamento[ idMedica=" + idMedica + " ]";
    }
}
