/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CJPA;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author daMgeL
 */
@Entity
@Table(name = "Direccion", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Direccion.findAll", query = "SELECT d FROM Direccion d"),
    @NamedQuery(name = "Direccion.findByIdDireccion", query = "SELECT d FROM Direccion d WHERE d.idDireccion = :idDireccion"),
    @NamedQuery(name = "Direccion.findByCalleDireccion", query = "SELECT d FROM Direccion d WHERE d.calleDireccion = :calleDireccion"),
    @NamedQuery(name = "Direccion.findByCasaDireccion", query = "SELECT d FROM Direccion d WHERE d.casaDireccion = :casaDireccion")})
public class Direccion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idDireccion", nullable = false)
    private Integer idDireccion;
    @Size(max = 50)
    @Column(name = "calleDireccion")
    private String calleDireccion;
    @Size(max = 50)
    @Column(name = "casaDireccion")
    private String casaDireccion;
    @JoinColumn(name = "fkMunicipio", referencedColumnName = "idmuni")
    @ManyToOne(optional = false)
    private Municipio fkMunicipio;
    @JoinColumn(name = "fkpersona", referencedColumnName = "idPersona")
    @ManyToOne(optional = false)
    private Persona fkpersona;

    public Direccion() {
    }

    public Direccion(Integer idDireccion) {
        this.idDireccion = idDireccion;
    }

    public Integer getIdDireccion() {
        return idDireccion;
    }

    public void setIdDireccion(Integer idDireccion) {
        this.idDireccion = idDireccion;
    }

    public String getCalleDireccion() {
        return calleDireccion;
    }

    public void setCalleDireccion(String calleDireccion) {
        this.calleDireccion = calleDireccion;
    }

    public String getCasaDireccion() {
        return casaDireccion;
    }

    public void setCasaDireccion(String casaDireccion) {
        this.casaDireccion = casaDireccion;
    }

    public Municipio getFkMunicipio() {
        return fkMunicipio;
    }

    public void setFkMunicipio(Municipio fkMunicipio) {
        this.fkMunicipio = fkMunicipio;
    }

    public Persona getFkpersona() {
        return fkpersona;
    }

    public void setFkpersona(Persona fkpersona) {
        this.fkpersona = fkpersona;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDireccion != null ? idDireccion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Direccion)) {
            return false;
        }
        Direccion other = (Direccion) object;
        if ((this.idDireccion == null && other.idDireccion != null) || (this.idDireccion != null && !this.idDireccion.equals(other.idDireccion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Direccion[ idDireccion=" + idDireccion + " ]";
    }
}
