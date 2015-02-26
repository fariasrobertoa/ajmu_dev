package ajmu;

import java.awt.Dialog;

import org.aspectj.lang.Signature;

abstract aspect TaskEvent {
	
	protected static Task miTarea = null;
	protected int nroEvento = 0;
	protected int nroDialogo	= 0;
	
	pointcut flujoInicializacion(): cflow(inicializacion());
	pointcut flujoFinalizacion(): cflow(finalizacion());
	pointcut flujoAspecto(): cflow(adviceexecution());
	
	pointcut tareaEnEjecucion(): if ((miTarea!=null) && (!miTarea.isComplete()));
	
	pointcut inicializacion():initialization(Task.new(String));
	pointcut finalizacion():execution(void Task.finalize(..));
	after(): finalizacion(){
		nroEvento = 0;
		nroDialogo = 0;
		
	}
	
	pointcut registrarInicio(Task tar):inicializacion()&&this(tar);
	after(Task tar): registrarInicio(tar){
		miTarea = tar;
	}
		
	/**
	 * POINTCUT capturaDialogo()
	 * Captura ventanas de tipo Dialog gestionadas en el flujo de control LUEGO de la accion definida en pointcut inicializacion()
	 */
	pointcut capturaDialogo(Dialog jd): !flujoInicializacion()&&!flujoAspecto() && call( * *Dialog(..)) && target(jd) && tareaEnEjecucion();
	/**
	 * ADVICE before()
	 * Registra información de la ventana de tipo Dialog cuando ésta es capturada por el pointcut.
	 * Se registra el título de la ventana y la línea y clase desde la cual ocurrió la llamada.
	 * También se contabiliza el atributo cantDialogos del objeto miTarea.
	 * @param jd puede ser cualquier objeto de tipo Dialog o JDialog.
	 */
	before(Dialog jd): capturaDialogo(jd){
		if (thisJoinPoint.getTarget().getClass().getSuperclass().getCanonicalName().equals("javax.swing.JDialog") ||
				thisJoinPoint.getTarget().getClass().getSuperclass().getCanonicalName().equals("java.awt.Dialog")){
			
			String tituloDialogo	= "Titulo: " + jd.getTitle();
			
			Signature sig = thisJoinPointStaticPart.getSignature();
			String kind = thisJoinPointStaticPart.getKind();
			String line =""+ thisJoinPointStaticPart.getSourceLocation().getLine();
	        String sourceName = thisJoinPointStaticPart.getSourceLocation().getWithinType().getCanonicalName();
	         
	        String reg = "Dialogo: "+  + ++nroDialogo + "-> TITULO: " + tituloDialogo + ": Ocurrio un llamado en "+ sourceName+ "("+ kind +") linea " + line + " al metodo " + sig + "(" + thisJoinPoint.toLongString() + ")";
	        
	        miTarea.setTotalDialogs();
			
			TaskLogger.aspectOf().log().addDialog(miTarea.getTotalDialogs(), reg);
		}		
	}
	
}
