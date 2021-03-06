//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vhudson-jaxb-ri-2.2-147 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2014.09.19 at 12:36:37 AM ART 
//


package ajmu.logger.usability;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for logType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="logType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="logParcial" type="{http://www.example.org/usabilityrecord}logParcialType" maxOccurs="unbounded"/>
 *         &lt;element name="logFinal" type="{http://www.example.org/usabilityrecord}logFinalType"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "logType", propOrder = {
    "logParcial",
    "logFinal"
})
public class LogType {

    @XmlElement(required = true)
    protected List<LogParcialType> logParcial;
    @XmlElement(required = true)
    protected LogFinalType logFinal;

    /**
     * Gets the value of the logParcial property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the logParcial property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getLogParcial().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link LogParcialType }
     * 
     * 
     */
    public List<LogParcialType> getLogParcial() {
        if (logParcial == null) {
            logParcial = new ArrayList<LogParcialType>();
        }
        return this.logParcial;
    }

    /**
     * Gets the value of the logFinal property.
     * 
     * @return
     *     possible object is
     *     {@link LogFinalType }
     *     
     */
    public LogFinalType getLogFinal() {
        return logFinal;
    }

    /**
     * Sets the value of the logFinal property.
     * 
     * @param value
     *     allowed object is
     *     {@link LogFinalType }
     *     
     */
    public void setLogFinal(LogFinalType value) {
        this.logFinal = value;
    }

}
