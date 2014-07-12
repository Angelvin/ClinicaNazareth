/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CJPA;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
@Table(name = "consulta", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Consulta.findAll", query = "SELECT c FROM Consulta c"),
    @NamedQuery(name = "Consulta.findByIdConsulta", query = "SELECT c FROM Consulta c WHERE c.idConsulta = :idConsulta"),
    @NamedQuery(name = "Consulta.findByFechaConsulta", query = "SELECT c FROM Consulta c WHERE c.fechaConsulta = :fechaConsulta"),
    @NamedQuery(name = "Consulta.findByHoraConsulta", query = "SELECT c FROM Consulta c WHERE c.horaConsulta = :horaConsulta"),
    @NamedQuery(name = "Consulta.findByPeso", query = "SELECT c FROM Consulta c WHERE c.peso = :peso"),
    @NamedQuery(name = "Consulta.findByTemperatura", query = "SELECT c FROM Consulta c WHERE c.temperatura = :temperatura"),
    @NamedQuery(name = "Consulta.findByConsultaPor", query = "SELECT c FROM Consulta c WHERE c.consultaPor = :consultaPor"),
    @NamedQuery(name = "Consulta.findByPulso", query = "SELECT c FROM Consulta c WHERE c.pulso = :pulso"),
    @NamedQuery(name = "Consulta.findByTipoConsulta", query = "SELECT c FROM Consulta c WHERE c.tipoConsulta = :tipoConsulta"),
    
    @NamedQuery(name = "Consulta.findByExamenes", query = "SELECT c FROM Consulta c WHERE c.examenes = :examenes"),
    @NamedQuery(name = "Consulta.findBySintomasConsulta", query = "SELECT c FROM Consulta c WHERE c.sintomasConsulta = :sintomasConsulta")})
public class Consulta implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idConsulta")
    private Integer idConsulta;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaConsulta")
    @Temporal(TemporalType.DATE)
    private Date fechaConsulta;
    @Basic(optional = false)
    @NotNull
    @Column(name = "horaConsulta")
    @Temporal(TemporalType.TIME)
    private Date horaConsulta;
    @Size(max = 50)
    @Column(name = "peso")
    private String peso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "temperatura")
    private String temperatura;
    @Size(max = 50)
    @Column(name = "tensionalterial")
    private String tensionalterial;
    @Size(max = 250)
    @Column(name = "consultaPor")
    private String consultaPor;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "pulso")
    private String pulso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "tipoConsulta")
    private String tipoConsulta;
    
    @Size(max = 250)
    @Column(name = "Examenes")
    private String examenes;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "sintomasConsulta")
    private String sintomasConsulta;
    @OneToMany(mappedBy = "fkconsulta")
    private List<Factura> facturaList;
    @JoinColumn(name = "fkcita", referencedColumnName = "idCita")
    @OneToOne
    private Cita fkcita;
     @JoinColumn(name = "fkDetMedTrata", referencedColumnName = "idDetMedTrata")
    @ManyToOne
    private DetalleMedicina fkDetMedTrata;
    @JoinColumn(name = "fkExpediente", referencedColumnName = "idExpedi")
    @ManyToOne
    private Expediente fkExpediente;
    @OneToMany(mappedBy = "fkConsulta")
    private List<Examen> examenList;
    @OneToMany(mappedBy = "fkConsulta")
    private List<Tratamiento> tratamientoList;

    public Consulta() {
    }

    public Consulta(Integer idConsulta) {
        this.idConsulta = idConsulta;
    }

    public Consulta(Integer idConsulta, Date fechaConsulta, Date horaConsulta, String temperatura, String pulso, String tipoConsulta, String sintomasConsulta) {
        this.idConsulta = idConsulta;
        this.fechaConsulta = fechaConsulta;
        this.horaConsulta = horaConsulta;
        this.temperatura = temperatura;
        this.pulso = pulso;
        this.tipoConsulta = tipoConsulta;
        this.sintomasConsulta = sintomasConsulta;
    }

    public Integer getIdConsulta() {
        return idConsulta;
    }

    public void setIdConsulta(Integer idConsulta) {
        this.idConsulta = idConsulta;
    }

    public Date getFechaConsulta() {
        return fechaConsulta;
    }

    public void setFechaConsulta(Date fechaConsulta) {
        this.fechaConsulta = fechaConsulta;
    }

    public Date getHoraConsulta() {
        return horaConsulta;
    }

    public void setHoraConsulta(Date horaConsulta) {
        this.horaConsulta = horaConsulta;
    }

    public String getPeso() {
        return peso;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }

    public String getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(String temperatura) {
        this.temperatura = temperatura;
    }

    public String getTensionalterial() {
        return tensionalterial;
    }

    public void setTensionalterial(String tensionalterial) {
        this.tensionalterial = tensionalterial;
    }

 

    public String getConsultaPor() {
        return consultaPor;
    }

    public void setConsultaPor(String consultaPor) {
        this.consultaPor = consultaPor;
    }

    public String getPulso() {
        return pulso;
    }

    public void setPulso(String pulso) {
        this.pulso = pulso;
    }

    public String getTipoConsulta() {
        return tipoConsulta;
    }

    public void setTipoConsulta(String tipoConsulta) {
        this.tipoConsulta = tipoConsulta;
    }

 

    public String getExamenes() {
        return examenes;
    }

    public void setExamenes(String examenes) {
        this.examenes = examenes;
    }

    public String getSintomasConsulta() {
        return sintomasConsulta;
    }

    public void setSintomasConsulta(String sintomasConsulta) {
        this.sintomasConsulta = sintomasConsulta;
    }

    @XmlTransient
    public List<Factura> getFacturaList() {
        return facturaList;
    }

    public void setFacturaList(List<Factura> facturaList) {
        this.facturaList = facturaList;
    }

    public Cita getFkcita() {
        return fkcita;
    }

    public void setFkcita(Cita fkcita) {
        this.fkcita = fkcita;
    }

    public DetalleMedicina getFkDetMedTrata() {
        return fkDetMedTrata;
    }

    public void setFkDetMedTrata(DetalleMedicina fkDetMedTrata) {
        this.fkDetMedTrata = fkDetMedTrata;
    }

    
    public Expediente getFkExpediente() {
        return fkExpediente;
    }

    public void setFkExpediente(Expediente fkExpediente) {
        this.fkExpediente = fkExpediente;
    }

    @XmlTransient
    public List<Examen> getExamenList() {
        return examenList;
    }

    public void setExamenList(List<Examen> examenList) {
        this.examenList = examenList;
    }

    @XmlTransient
    public List<Tratamiento> getTratamientoList() {
        return tratamientoList;
    }

    public void setTratamientoList(List<Tratamiento> tratamientoList) {
        this.tratamientoList = tratamientoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idConsulta != null ? idConsulta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Consulta)) {
            return false;
        }
        Consulta other = (Consulta) object;
        if ((this.idConsulta == null && other.idConsulta != null) || (this.idConsulta != null && !this.idConsulta.equals(other.idConsulta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Consulta[ idConsulta=" + idConsulta + " ]";
    }
}
