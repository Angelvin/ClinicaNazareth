/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package clases.creadas;

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
 * @author Angel
 */
@Entity
@Table(name = "persona", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Persona.findAll", query = "SELECT p FROM Persona p"),
    @NamedQuery(name = "Persona.findByIdPersona", query = "SELECT p FROM Persona p WHERE p.idPersona = :idPersona"),
    @NamedQuery(name = "Persona.findByPnombrePer", query = "SELECT p FROM Persona p WHERE p.pnombrePer = :pnombrePer"),
    @NamedQuery(name = "Persona.findBySnombrePer", query = "SELECT p FROM Persona p WHERE p.snombrePer = :snombrePer"),
    @NamedQuery(name = "Persona.findByPApellPer", query = "SELECT p FROM Persona p WHERE p.pApellPer = :pApellPer"),
    @NamedQuery(name = "Persona.findBySApellPer", query = "SELECT p FROM Persona p WHERE p.sApellPer = :sApellPer"),
    @NamedQuery(name = "Persona.findByFechaNacPer", query = "SELECT p FROM Persona p WHERE p.fechaNacPer = :fechaNacPer"),
    @NamedQuery(name = "Persona.findBySexo", query = "SELECT p FROM Persona p WHERE p.sexo = :sexo"),
    @NamedQuery(name = "Persona.findByIglesia", query = "SELECT p FROM Persona p WHERE p.iglesia = :iglesia")})
public class Persona implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idPersona")
    private Integer idPersona;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "pnombrePer")
    private String pnombrePer;
    @Size(max = 30)
    @Column(name = "snombrePer")
    private String snombrePer;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "pApellPer")
    private String pApellPer;
    @Size(max = 50)
    @Column(name = "sApellPer")
    private String sApellPer;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaNacPer")
    @Temporal(TemporalType.DATE)
    private Date fechaNacPer;
    @Size(max = 1)
    @Column(name = "sexo")
    private String sexo;
    @Size(max = 50)
    @Column(name = "iglesia")
    private String iglesia;
    @OneToMany(mappedBy = "fkpersona")
    private List<Documento> documentoList;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "fkpersona")
    private Empleado empleado;
    @OneToOne(mappedBy = "fkpersona")
    private Paciente paciente;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkPersona")
    private List<Correo> correoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkpersona")
    private List<Direccion> direccionList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idPerson")
    private List<Telefono> telefonoList;
    @JoinColumn(name = "fkLogin", referencedColumnName = "idLogin")
    @ManyToOne
    private Login fkLogin;
    @OneToMany(mappedBy = "fkresponsable")
    private List<Persona> personaList;
    @JoinColumn(name = "fkresponsable", referencedColumnName = "idPersona")
    @ManyToOne
    private Persona fkresponsable;

    public Persona() {
    }

    public Persona(Integer idPersona) {
        this.idPersona = idPersona;
    }

    public Persona(Integer idPersona, String pnombrePer, String pApellPer, Date fechaNacPer) {
        this.idPersona = idPersona;
        this.pnombrePer = pnombrePer;
        this.pApellPer = pApellPer;
        this.fechaNacPer = fechaNacPer;
    }

    public Integer getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(Integer idPersona) {
        this.idPersona = idPersona;
    }

    public String getPnombrePer() {
        return pnombrePer;
    }

    public void setPnombrePer(String pnombrePer) {
        this.pnombrePer = pnombrePer;
    }

    public String getSnombrePer() {
        return snombrePer;
    }

    public void setSnombrePer(String snombrePer) {
        this.snombrePer = snombrePer;
    }

    public String getPApellPer() {
        return pApellPer;
    }

    public void setPApellPer(String pApellPer) {
        this.pApellPer = pApellPer;
    }

    public String getSApellPer() {
        return sApellPer;
    }

    public void setSApellPer(String sApellPer) {
        this.sApellPer = sApellPer;
    }

    public Date getFechaNacPer() {
        return fechaNacPer;
    }

    public void setFechaNacPer(Date fechaNacPer) {
        this.fechaNacPer = fechaNacPer;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getIglesia() {
        return iglesia;
    }

    public void setIglesia(String iglesia) {
        this.iglesia = iglesia;
    }

    @XmlTransient
    public List<Documento> getDocumentoList() {
        return documentoList;
    }

    public void setDocumentoList(List<Documento> documentoList) {
        this.documentoList = documentoList;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }

    @XmlTransient
    public List<Correo> getCorreoList() {
        return correoList;
    }

    public void setCorreoList(List<Correo> correoList) {
        this.correoList = correoList;
    }

    @XmlTransient
    public List<Direccion> getDireccionList() {
        return direccionList;
    }

    public void setDireccionList(List<Direccion> direccionList) {
        this.direccionList = direccionList;
    }

    @XmlTransient
    public List<Telefono> getTelefonoList() {
        return telefonoList;
    }

    public void setTelefonoList(List<Telefono> telefonoList) {
        this.telefonoList = telefonoList;
    }

    public Login getFkLogin() {
        return fkLogin;
    }

    public void setFkLogin(Login fkLogin) {
        this.fkLogin = fkLogin;
    }

    @XmlTransient
    public List<Persona> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<Persona> personaList) {
        this.personaList = personaList;
    }

    public Persona getFkresponsable() {
        return fkresponsable;
    }

    public void setFkresponsable(Persona fkresponsable) {
        this.fkresponsable = fkresponsable;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPersona != null ? idPersona.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Persona)) {
            return false;
        }
        Persona other = (Persona) object;
        if ((this.idPersona == null && other.idPersona != null) || (this.idPersona != null && !this.idPersona.equals(other.idPersona))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "clases.creadas.Persona[ idPersona=" + idPersona + " ]";
    }
    
}
