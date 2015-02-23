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

import ajmu.logger.usability.LoggerJaxb;

public aspect TareaLogger {
	
	private static final LoggerJaxb logJaxb = new LoggerJaxb("undefined", "undefined");
	pointcut registrarInicio(Tarea t):initialization(Tarea.new(String))&&this(t);
	
	after(Tarea t): registrarInicio(t){
		logJaxb.addTask(t.getId(), t.getEstado());
		t.setEstado("En ejecución");
	}
	
	pointcut registrarDatos(Tarea t):execution(void Tarea.finaliza(..))&&this(t);
	
	after(Tarea t): registrarDatos(t){
		//logJaxb.addLogFinal(t.getEstado(), t.getCantAccesosDocumentacion(), t.getCantDialogos(), t.getCantExcepciones(), t.getCantMensajesIconoError(), t.getCantMensajesIconoInformativo(), t.getCantMensajesIconoPregunta(), t.getCantMensajesIconoAdvertencia(), t.getCantMensajesSinIcono(),t.tiempoDeEjecucion(),t.getGradoSatisfaccion());
		logJaxb.addLogFinal(t.getEstado(), t.getCantAccesosDocumentacion(), t.getCantDialogos(), t.getCantExcepciones(), t.getCantMensajesIconoError(), t.getCantMensajesIconoInformativo(), t.getCantMensajesIconoPregunta(), t.getCantMensajesIconoAdvertencia(), t.getCantMensajesSinIcono(),t.tiempoDeEjecucion(),t.getSat1(),t.getSat2(),t.getSat3(),t.getCompositeSat());
		
	}
	
	pointcut deteccionEventos(Tarea t): call(void Tarea.setCant*(..))&&target(t)||call(void Tarea.setEstado(..))&&target(t);
	
	after(Tarea t): deteccionEventos(t){
		logJaxb.addLogPartial(t.getEstado(),t.getCantAccesosDocumentacion(), t.getCantDialogos(), t.getCantExcepciones(), t.getCantMensajesIconoError(), t.getCantMensajesIconoInformativo(), t.getCantMensajesIconoPregunta(), t.getCantMensajesIconoAdvertencia(), t.getCantMensajesSinIcono());
		
		
	}
	
	pointcut registrarNoFinaliza(Tarea t):execution(void Tarea.noFinaliza(..))&&this(t);
	
	after(Tarea t): registrarNoFinaliza(t){
		logJaxb.addLogPartial(t.getEstado(),t.getCantAccesosDocumentacion(), t.getCantDialogos(), t.getCantExcepciones(), t.getCantMensajesIconoError(), t.getCantMensajesIconoInformativo(), t.getCantMensajesIconoPregunta(), t.getCantMensajesIconoAdvertencia(), t.getCantMensajesSinIcono());
		
	}
		
	public LoggerJaxb log(){
		return logJaxb;
	}
}
