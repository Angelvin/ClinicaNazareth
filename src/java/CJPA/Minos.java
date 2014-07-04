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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author daMgeL
 */
@Entity
@Table(name = "MINOS", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Minos.findAll", query = "SELECT m FROM Minos m"),
    @NamedQuery(name = "Minos.findByMINOSId", query = "SELECT m FROM Minos m WHERE m.mINOSId = :mINOSId")})
public class Minos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "MINOSId")
    private Integer mINOSId;

    public Minos() {
    }

    public Minos(Integer mINOSId) {
        this.mINOSId = mINOSId;
    }

    public Integer getMINOSId() {
        return mINOSId;
    }

    public void setMINOSId(Integer mINOSId) {
        this.mINOSId = mINOSId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (mINOSId != null ? mINOSId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Minos)) {
            return false;
        }
        Minos other = (Minos) object;
        if ((this.mINOSId == null && other.mINOSId != null) || (this.mINOSId != null && !this.mINOSId.equals(other.mINOSId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Minos[ mINOSId=" + mINOSId + " ]";
    }
}
