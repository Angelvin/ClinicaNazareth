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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author daMgeL
 */
@Entity
@Table(name = "telefono", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Telefono.findAll", query = "SELECT t FROM Telefono t"),
    @NamedQuery(name = "Telefono.findByIdtelefono", query = "SELECT t FROM Telefono t WHERE t.idtelefono = :idtelefono"),
    @NamedQuery(name = "Telefono.findByNumero", query = "SELECT t FROM Telefono t WHERE t.numero = :numero"),
    @NamedQuery(name = "Telefono.findByTipo", query = "SELECT t FROM Telefono t WHERE t.tipo = :tipo")})
public class Telefono implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idtelefono")
    private Integer idtelefono;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "numero")
    private String numero;
    @Size(max = 50)
    @Column(name = "tipo")
    private String tipo;
    @JoinColumn(name = "idPerson", referencedColumnName = "idPersona")
    @ManyToOne(optional = false)
    private Persona idPerson;

    public Telefono() {
    }

    public Telefono(Integer idtelefono) {
        this.idtelefono = idtelefono;
    }

    public Telefono(Integer idtelefono, String numero) {
        this.idtelefono = idtelefono;
        this.numero = numero;
    }

    public Integer getIdtelefono() {
        return idtelefono;
    }

    public void setIdtelefono(Integer idtelefono) {
        this.idtelefono = idtelefono;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Persona getIdPerson() {
        return idPerson;
    }

    public void setIdPerson(Persona idPerson) {
        this.idPerson = idPerson;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtelefono != null ? idtelefono.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Telefono)) {
            return false;
        }
        Telefono other = (Telefono) object;
        if ((this.idtelefono == null && other.idtelefono != null) || (this.idtelefono != null && !this.idtelefono.equals(other.idtelefono))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Telefono[ idtelefono=" + idtelefono + " ]";
    }
}
