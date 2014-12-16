package ajmu.logger.usability;

import java.util.Date;
import java.util.GregorianCalendar;

import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

public class LoggerJaxb {
	private UsabilityRecordType regusa;
	private SessionType sesionActual;
	private TaskType tareaActual;
	private String fileLog = "logUsability.xml";
	
	public LoggerJaxb(String nameApp, String version){
		regusa = new UsabilityRecordType();
		regusa.setAppName(nameApp);
        regusa.setVersion(version);
        regusa.generateXML(fileLog);
	}
	
	public void setApp(String nameApp, String version){
		regusa.setAppName(nameApp);
        regusa.setVersion(version);
        regusa.generateXML(fileLog);
	}
	
	public void addTaskAnalized(String id, String name){
		TasksAnalizedType task = new TasksAnalizedType();
		task.setId(id);
		task.setName(name);
		regusa.getTasksAnalized().add(task);
	}
	public void addSession(Integer edad, String sex, String id){
		SessionType sesion = new SessionType();
        sesion.setAge(edad);
        long time = System.currentTimeMillis();
        GregorianCalendar c = new GregorianCalendar();
        c.setTime(new Date(time));
        try{
        XMLGregorianCalendar dateSesion = DatatypeFactory.newInstance().newXMLGregorianCalendar(c);
        
        sesion.setDate(dateSesion);
        sesion.setSex(sex);
        sesion.setId(id);
        regusa.getSession().add(sesion);
        sesionActual = sesion;
        regusa.generateXML(fileLog);
		}catch(Exception e){
		        	
		}
	}
	
	public void addTask(String id, String state){
		TaskType tarea = new TaskType();
        tarea.setId(id);
        tarea.setState(state);
        
        ExceptionsType errores = new ExceptionsType();
        tarea.getExceptions().add(errores);
        
        LogType logTask = new LogType();
        tarea.getLog().add(logTask);
        
        DialoguesType dialogues = new DialoguesType();
        tarea.getDialogues().add(dialogues);
        
        sesionActual.getTask().add(tarea);
        tareaActual = tarea;
        regusa.generateXML(fileLog);
	}
	
	public void addException(Integer id, String msj){
		ExceptionType error = new ExceptionType();
        error.setId(id);
        error.setMessage(msj);
        tareaActual.getExceptions().get(0).getException().add(error);
        regusa.generateXML(fileLog);
	}
	
	public void addLogPartial(String state, Integer accDoc, Integer cantDialog, Integer cantExcep, Integer msjE, Integer msjI, Integer msjQ, Integer msjW, Integer msjO){
		if(tareaActual!=null){
			LogParcialType logTaskPartial = new LogParcialType();
			logTaskPartial.setTotalAccDoc(accDoc);
			logTaskPartial.setTotalDialog(cantDialog);
			logTaskPartial.setTotalExcep(cantExcep);
			logTaskPartial.setTotalMessError(msjE);
			logTaskPartial.setTotalMessInfo(msjI);
			logTaskPartial.setTotalMessQuestion(msjQ);
			logTaskPartial.setTotalMessWarn(msjW);
			logTaskPartial.setTotalMessWithoutIcon(msjO);
			
			tareaActual.getLog().get(0).getLogParcial().add(logTaskPartial);
			tareaActual.setState(state);
			regusa.generateXML(fileLog);
		}
	}
	
	public void addLogFinal(String state, Integer accDoc, Integer cantDialog, Integer cantExcep, Integer msjE, Integer msjI, Integer msjQ, Integer msjW, Integer msjO,Long execTime, String satisfaction){
		LogFinalType logTaskFinal = new LogFinalType();
		logTaskFinal.setTotalAccDoc(accDoc);
		logTaskFinal.setTotalDialog(cantDialog);
		logTaskFinal.setTotalExcep(cantExcep);
		logTaskFinal.setTotalMessError(msjE);
		logTaskFinal.setTotalMessInfo(msjI);
		logTaskFinal.setTotalMessQuestion(msjQ);
		logTaskFinal.setTotalMessWarn(msjW);
		logTaskFinal.setTotalMessWithoutIcon(msjO);
		logTaskFinal.setTotalExecTime(execTime);
		logTaskFinal.setSatisDegree(satisfaction);
		tareaActual.getLog().get(0).setLogFinal(logTaskFinal);
		tareaActual.setState(state);
		regusa.generateXML(fileLog);
	}
	
	public void addDialog(Integer id, String msj){
		DialogType dialog = new DialogType();
		dialog.setId(id);
		dialog.setMessage(msj);;
		tareaActual.getDialogues().get(0).getDialog().add(dialog);
		regusa.generateXML(fileLog);
	}
}
