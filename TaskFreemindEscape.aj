package ajmu;

import freemind.controller.MapModuleManager;

public aspect TaskFreemindEscape extends TaskEscape {
	//pointcut NoFinaliza():call(void freemind.controller.Controller.close(..));
	pointcut NoFinaliza();
	
	pointcut CerrarMapa(boolean val, MapModuleManager buff): call(boolean freemind.modes.ModeController.close(boolean, MapModuleManager))&&args(val,buff);
	
	boolean around(boolean val, MapModuleManager buff):CerrarMapa(val, buff){
		boolean valor = proceed(val,buff);
		if(!valor && (miTarea!=null)){
			
			miTarea.noFinaliza();
			miTarea = null;
		}
		return valor;
	}
	
}
