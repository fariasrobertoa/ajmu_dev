/**
* 
* PROYECTO DE INVESTIGACIÓN
* USABILIDAD & AOP: DESARROLLO Y EVALUACIÓN DE UN FRAMEWORK DE DOMINIO.
* (2014-2015)
* CÓDIGO: 29/A315
* 
* MÁS INFORMACIÓN EN {@link https://sites.google.com/site/profeprog/proyecto5}
* 
*/
package ajmu;


public class Tarea {	
	
	private String id;
	private boolean completa;
	private long inicializacion,finalizacion;
	private int cantExcepciones;
	private String descripcion;
	private int cantDialogos;
	private int cantAccesosDocumentacion;
	private int cantMensajesSinIcono;
	private int cantMensajesIconoError;
	private int cantMensajesIconoInformativo;
	private int cantMensajesIconoAdvertencia;
	private int cantMensajesIconoPregunta;
	private String gradoSatisfaccion;
	private String estado;
	private int ageUser;
	private String sexUser;
	
	public int getAgeUser() {
		return ageUser;
	}

	public void setAgeUser(int ageUser) {
		this.ageUser = ageUser;
	}

	public String getSexUser() {
		return sexUser;
	}

	public void setSexUser(String sexUser) {
		this.sexUser = sexUser;
	}
	
    

	public Tarea(String desc) {		
		id	= desc.replaceAll(" ", "_") + "_"+ System.currentTimeMillis();
		completa = false;
		inicializacion = System.currentTimeMillis();
		finalizacion = 0;
		cantExcepciones = 0;
		descripcion = desc;
		cantAccesosDocumentacion = 0;
		gradoSatisfaccion = "No sabe / No responde";
		estado = "Iniciada";
	}
	
	public void setGradoSatisfaccion(String gradoSatisfaccion) {
		this.gradoSatisfaccion = gradoSatisfaccion;
	}
	public String getGradoSatisfaccion() {
		return gradoSatisfaccion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getDescripcion() {
		return descripcion;
	}	
	public String getId() {
		return id;
	}
	public boolean isCompleta() {
		return completa;
	}
	public Long getInicializacion() {
		return inicializacion;
	}
	public Long getFinalizacion() {
		return finalizacion;
	}
	public void finaliza(){	
			finalizacion = System.currentTimeMillis();
			completa = true;	
			estado = "Finalizada";	
	}
	public void noFinaliza(){	
		completa = false;	
		estado = "No Finalizada";	
	}
	public void setCantExcepciones() {
		this.cantExcepciones++;
	}
	public int getCantExcepciones() {
		return cantExcepciones;
	}
	public void setCantDialogos() {
		this.cantDialogos++;
	}
	public int getCantDialogos() {
		return cantDialogos;
	}
	public void setCantAccesosDocumentacion(){
		this.cantAccesosDocumentacion++;
	}
	public int getCantAccesosDocumentacion(){
		return this.cantAccesosDocumentacion;
	}
	public void setCantMensajesSinIcono() {
		this.cantMensajesSinIcono++;
	}
	public int getCantMensajesSinIcono() {
		return this.cantMensajesSinIcono;
	}
	public void setCantMensajesIconoError() {
		this.cantMensajesIconoError++;
	}
	public int getCantMensajesIconoError() {
		return this.cantMensajesIconoError;
	}
	public void setCantMensajesIconoInformativo() {
		this.cantMensajesIconoInformativo++;
	}
	public int getCantMensajesIconoInformativo() {
		return this.cantMensajesIconoInformativo;
	}
	public void setCantMensajesIconoAdvertencia() {
		this.cantMensajesIconoAdvertencia++;
	}
	public int getCantMensajesIconoAdvertencia() {
		return this.cantMensajesIconoAdvertencia;
	}
	public void setCantMensajesIconoPregunta() {
		this.cantMensajesIconoPregunta++;
	}
	public int getCantMensajesIconoPregunta() {
		return this.cantMensajesIconoPregunta;
	} 
	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
	public Long tiempoDeEjecucion(){
		return finalizacion - inicializacion;
	}
	public String tiempoDeEjecucionSeg(){
		Long tejecucion = finalizacion - inicializacion;
		
		Long horas = tejecucion / 3600000;
		Long restoHoras = tejecucion%3600000;
		
		Long minutos = restoHoras / 60000;
		Long restoMinutos = restoHoras%60000;
		
		Long segundos = restoMinutos / 1000;
		Long restoSegundos = restoMinutos%1000;
		
		return horas + ":" + minutos + ":" + segundos + "." + restoSegundos;	
	}
}
