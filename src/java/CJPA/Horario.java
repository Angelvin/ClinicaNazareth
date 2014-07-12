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
@Table(name = "horario", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Horario.findAll", query = "SELECT h FROM Horario h"),
    @NamedQuery(name = "Horario.findByIdhorario", query = "SELECT h FROM Horario h WHERE h.idhorario = :idhorario"),
    @NamedQuery(name = "Horario.findByHoraini", query = "SELECT h FROM Horario h WHERE h.horaini = :horaini")})
public class Horario implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idhorario")
    private Integer idhorario;
    @Column(name = "horaini")
    @Temporal(TemporalType.TIME)
    private Date horaini;
    
    @JoinColumn(name = "fkempleado", referencedColumnName = "idEmpleado")
    @ManyToOne(optional = false)
    private Empleado fkempleado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkhorario")
    private List<Cita> citaList;

    public Horario() {
    }

    public Horario(Integer idhorario) {
        this.idhorario = idhorario;
    }

    public Integer getIdhorario() {
        return idhorario;
    }

    public void setIdhorario(Integer idhorario) {
        this.idhorario = idhorario;
    }

    public Date getHoraini() {
        return horaini;
    }

    public void setHoraini(Date horaini) {
        this.horaini = horaini;
    }


    public Empleado getFkempleado() {
        return fkempleado;
    }

    public void setFkempleado(Empleado fkempleado) {
        this.fkempleado = fkempleado;
    }

    @XmlTransient
    public List<Cita> getCitaList() {
        return citaList;
    }

    public void setCitaList(List<Cita> citaList) {
        this.citaList = citaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idhorario != null ? idhorario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Horario)) {
            return false;
        }
        Horario other = (Horario) object;
        if ((this.idhorario == null && other.idhorario != null) || (this.idhorario != null && !this.idhorario.equals(other.idhorario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Horario[ idhorario=" + idhorario + " ]";
    }
}
