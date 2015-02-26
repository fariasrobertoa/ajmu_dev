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

abstract aspect TaskConnect{

	static boolean connectOcupado = false;
	boolean iniciada	= false;	
	Task miTarea = null;
	
	/**
	 * POINTCUT inicializacion()
	 * Define el conjunto de puntos de corte que marcan el inicio de la tarea cuya usabilidad se desea estudiar.
	 */
	abstract pointcut inicializacion();
	/**
	 * ADVICE before()
	 * Si la tarea aún no ha iniciado, cambia el estado del atributo iniciada a true. 
	 */
	
	abstract String setIdTask();
	
	before(): inicializacion(){
		if(!connectOcupado){
			if (!iniciada) {
				miTarea = new Task(setIdTask());
				iniciada = true;
				connectOcupado = true;
				
			}
		}
	}
	
	/**
	 * POINTCUT finalizacion()
	 * Define el conjunto de puntos de corte que marcan el fin de la tarea cuya usabilidad se desea estudiar.
	 */
	abstract pointcut finalizacion();
	/**
	 * ADVICE after() returning.
	 * Si la tarea se encuentra iniciada cuando alguno de los joinpoints es capturado, entonces cambia el estado
	 * de la tarea a finalizada e inicializa los atributos del aspecto.  
	 */	 
	after() returning: finalizacion(){
		if (iniciada) {
			miTarea.finalize();	
		}
		iniciada = false;
		connectOcupado = false;
			
	}
	pointcut noFinalize():execution(void Task.noFinalize(..));
	after() returning: noFinalize(){
		iniciada = false;
		connectOcupado = false;
	}
	
	
	
}
