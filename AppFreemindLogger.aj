package ajmu;

public aspect AppFreemindLogger extends AppLogger{
	pointcut initLogger():execution(public static void freemind.main.FreeMindStarter.main(String[]));
	
	@Override
	void inicializarLogger() {

		setAppName("freemind");
		setAppVersion("1.0");
		agregarTarea("01", "Tarea 1: Creación de nuevo mapa");
		agregarTarea("02", "Tarea 2: Edición de mapa");
		agregarTarea("03", "Tarea 3: Creación de mapa protegido");
	}

}
