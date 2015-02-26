package ajmu;

import freemind.controller.MapModuleManager;

public aspect TaskFreemindEscape extends TaskEscape {
	//pointcut NoFinaliza():call(void freemind.controller.Controller.close(..));
	
	boolean optionSave = false;
	
	pointcut notComplete();
	
	pointcut selectSave():execution(boolean freemind.modes.ControllerAdapter.save());
	after(): selectSave(){
		optionSave = true;
	}
	
	pointcut closeMap(boolean val, MapModuleManager buff): call(boolean freemind.modes.ModeController.close(boolean, MapModuleManager))&&args(val,buff);
	
	boolean around(boolean val, MapModuleManager buff):closeMap(val, buff){
		boolean value = proceed(val,buff);
		if(value && (taskRef!=null) && !optionSave){
			
			taskRef.noFinalize();
			taskRef = null;
		}
		return value;
	}
	
}
