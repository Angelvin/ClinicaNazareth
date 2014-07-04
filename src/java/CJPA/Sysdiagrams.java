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
import javax.persistence.Lob;
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
@Table(name = "sysdiagrams", catalog = "clinica", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sysdiagrams.findAll", query = "SELECT s FROM Sysdiagrams s"),
    @NamedQuery(name = "Sysdiagrams.findByDiagramId", query = "SELECT s FROM Sysdiagrams s WHERE s.diagramId = :diagramId"),
    @NamedQuery(name = "Sysdiagrams.findByName", query = "SELECT s FROM Sysdiagrams s WHERE s.name = :name"),
    @NamedQuery(name = "Sysdiagrams.findByPrincipalId", query = "SELECT s FROM Sysdiagrams s WHERE s.principalId = :principalId"),
    @NamedQuery(name = "Sysdiagrams.findByVersion", query = "SELECT s FROM Sysdiagrams s WHERE s.version = :version")})
public class Sysdiagrams implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "diagram_id")
    private Integer diagramId;
    @Lob
    @Column(name = "definition")
    private byte[] definition;
    @Size(max = 255)
    @Column(name = "name")
    private String name;
    @Column(name = "principal_id")
    private Integer principalId;
    @Column(name = "version")
    private Integer version;

    public Sysdiagrams() {
    }

    public Sysdiagrams(Integer diagramId) {
        this.diagramId = diagramId;
    }

    public Integer getDiagramId() {
        return diagramId;
    }

    public void setDiagramId(Integer diagramId) {
        this.diagramId = diagramId;
    }

    public byte[] getDefinition() {
        return definition;
    }

    public void setDefinition(byte[] definition) {
        this.definition = definition;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPrincipalId() {
        return principalId;
    }

    public void setPrincipalId(Integer principalId) {
        this.principalId = principalId;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (diagramId != null ? diagramId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sysdiagrams)) {
            return false;
        }
        Sysdiagrams other = (Sysdiagrams) object;
        if ((this.diagramId == null && other.diagramId != null) || (this.diagramId != null && !this.diagramId.equals(other.diagramId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CJPA.Sysdiagrams[ diagramId=" + diagramId + " ]";
    }
}
