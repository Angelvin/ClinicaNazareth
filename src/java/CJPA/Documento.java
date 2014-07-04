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
@Table(name = "documento", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Documento.findAll", query = "SELECT d FROM Documento d"),
    @NamedQuery(name = "Documento.findByIdDocu", query = "SELECT d FROM Documento d WHERE d.idDocu = :idDocu"),
    @NamedQuery(name = "Documento.findByNumero", query = "SELECT d FROM Documento d WHERE d.numero = :numero"),
    @NamedQuery(name = "Documento.findByTipo", query = "SELECT d FROM Documento d WHERE d.tipo = :tipo")})
public class Documento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idDocu", nullable = false)
    private Integer idDocu;
    @Size(max = 50)
    @Column(name = "numero")
    private String numero;
    @Size(max = 50)
    @Column(name = "tipo")
    private String tipo;
    @JoinColumn(name = "fkpersona", referencedColumnName = "idPersona")
    @ManyToOne
    private Persona fkpersona;

    public Documento() {
    }

    public Documento(Integer idDocu) {
        this.idDocu = idDocu;
    }

    public Integer getIdDocu() {
        return idDocu;
    }

    public void setIdDocu(Integer idDocu) {
        this.idDocu = idDocu;
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

    public Persona getFkpersona() {
        return fkpersona;
    }

    public void setFkpersona(Persona fkpersona) {
        this.fkpersona = fkpersona;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDocu != null ? idDocu.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Documento)) {
            return false;
        }
        Documento other = (Documento) object;
        if ((this.idDocu == null && other.idDocu != null) || (this.idDocu != null && !this.idDocu.equals(other.idDocu))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Documento[ idDocu=" + idDocu + " ]";
    }
}
