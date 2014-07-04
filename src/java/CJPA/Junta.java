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
@Table(name = "junta", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Junta.findAll", query = "SELECT j FROM Junta j"),
    @NamedQuery(name = "Junta.findByIdJunta", query = "SELECT j FROM Junta j WHERE j.idJunta = :idJunta"),
    @NamedQuery(name = "Junta.findByNumero", query = "SELECT j FROM Junta j WHERE j.numero = :numero")})
public class Junta implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idJunta")
    private Integer idJunta;
    @Size(max = 50)
    @Column(name = "numero")
    private String numero;
    @JoinColumn(name = "fkMedico", referencedColumnName = "idEmpleado")
    @ManyToOne
    private Empleado fkMedico;

    public Junta() {
    }

    public Junta(Integer idJunta) {
        this.idJunta = idJunta;
    }

    public Integer getIdJunta() {
        return idJunta;
    }

    public void setIdJunta(Integer idJunta) {
        this.idJunta = idJunta;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public Empleado getFkMedico() {
        return fkMedico;
    }

    public void setFkMedico(Empleado fkMedico) {
        this.fkMedico = fkMedico;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idJunta != null ? idJunta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Junta)) {
            return false;
        }
        Junta other = (Junta) object;
        if ((this.idJunta == null && other.idJunta != null) || (this.idJunta != null && !this.idJunta.equals(other.idJunta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Junta[ idJunta=" + idJunta + " ]";
    }
}
