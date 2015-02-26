package ajmu;

public aspect AppFreemindLogger extends AppLogger{
	
	@Override
	void initializationLogger() {

		setAppName("freemind");
		setAppVersion("1.0");
		addTask("01", "Tarea 1: Creación de nuevo mapa");
		addTask("02", "Tarea 2: Edición de mapa");
		addTask("03", "Tarea 3: Creación de mapa protegido");
	}

}
