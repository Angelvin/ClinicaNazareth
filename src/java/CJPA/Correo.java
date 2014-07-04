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
@Table(name = "correo", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Correo.findAll", query = "SELECT c FROM Correo c"),
    @NamedQuery(name = "Correo.findByIdCorreo", query = "SELECT c FROM Correo c WHERE c.idCorreo = :idCorreo"),
    @NamedQuery(name = "Correo.findByCorreo", query = "SELECT c FROM Correo c WHERE c.correo = :correo"),
    @NamedQuery(name = "Correo.findByTipo", query = "SELECT c FROM Correo c WHERE c.tipo = :tipo")})
public class Correo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idCorreo")
    private Integer idCorreo;
    @Size(max = 50)
    @Column(name = "Correo")
    private String correo;
    @Size(max = 50)
    @Column(name = "tipo")
    private String tipo;
    @JoinColumn(name = "fkPersona", referencedColumnName = "idPersona")
    @ManyToOne(optional = false)
    private Persona fkPersona;

    public Correo() {
    }

    public Correo(Integer idCorreo) {
        this.idCorreo = idCorreo;
    }

    public Integer getIdCorreo() {
        return idCorreo;
    }

    public void setIdCorreo(Integer idCorreo) {
        this.idCorreo = idCorreo;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Persona getFkPersona() {
        return fkPersona;
    }

    public void setFkPersona(Persona fkPersona) {
        this.fkPersona = fkPersona;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCorreo != null ? idCorreo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Correo)) {
            return false;
        }
        Correo other = (Correo) object;
        if ((this.idCorreo == null && other.idCorreo != null) || (this.idCorreo != null && !this.idCorreo.equals(other.idCorreo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Correo[ idCorreo=" + idCorreo + " ]";
    }
}
