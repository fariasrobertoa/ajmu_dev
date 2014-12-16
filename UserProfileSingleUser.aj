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

public aspect UserProfileSingleUser extends TaskUserProfile{
	
	pointcut initUserSession():execution(public static void freemind.main.FreeMindStarter.main(String[]));
	
	
}
