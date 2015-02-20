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

import java.awt.Button;
import java.awt.Checkbox;
import java.awt.CheckboxGroup;
import java.awt.Frame;
import java.awt.Label;
import java.awt.Panel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.Icon;
import javax.swing.JOptionPane;

public aspect TareaGradoSatisfaccion /* implements ActionListener */{
	
	Icon icon;
	
	pointcut registrarDatos(Tarea t):execution(void Tarea.finaliza(..))&&this(t);
	
	before(Tarea t): registrarDatos(t){
		/*Panel vtnSatisfaccion = new Panel();
		Label txtDificultad = new Label("¿Cuán difícil o fácil le resultó completar esta tarea?");
		vtnSatisfaccion.add(txtDificultad);
		CheckboxGroup chxDificultad = new CheckboxGroup();
		vtnSatisfaccion.add(new Checkbox("1 - Muy Difícil",chxDificultad,false));
		vtnSatisfaccion.add(new Checkbox("2 - Difícil",chxDificultad,false));
		vtnSatisfaccion.add(new Checkbox("3 - Moderado",chxDificultad,false));
		vtnSatisfaccion.add(new Checkbox("4 - Fácil",chxDificultad,false));
		vtnSatisfaccion.add(new Checkbox("5 - Muy Fácil",chxDificultad,false));
		
		Label txtSatisfaccion = new Label("¿Qué tan satisfecho se encuentra con el uso de esta aplicación para realizar esta tarea?");
		vtnSatisfaccion.add(txtSatisfaccion);
		CheckboxGroup chxSatisfaccion = new CheckboxGroup();
		vtnSatisfaccion.add(new Checkbox("1 - Totalmente Insatisfecho",chxSatisfaccion,false));
		vtnSatisfaccion.add(new Checkbox("2 - Insatisfecho",chxSatisfaccion,false));
		vtnSatisfaccion.add(new Checkbox("3 - Moderado",chxSatisfaccion,false));
		vtnSatisfaccion.add(new Checkbox("4 - Satisfecho",chxSatisfaccion,false));
		vtnSatisfaccion.add(new Checkbox("5 - Muy Satisfecho",chxSatisfaccion,false));
		
		Label txtTiempo = new Label("¿Cuánto tiempo tardó en completar esta tarea?");
		vtnSatisfaccion.add(txtTiempo);
		CheckboxGroup chxTiempo = new CheckboxGroup();
		vtnSatisfaccion.add(new Checkbox("1 - Demasiado Tiempo",chxTiempo,false));
		vtnSatisfaccion.add(new Checkbox("2 - Un poco más de lo previsto",chxTiempo,false));
		vtnSatisfaccion.add(new Checkbox("3 - Moderado",chxTiempo,false));
		vtnSatisfaccion.add(new Checkbox("4 - Poco tiempo",chxTiempo,false));
		vtnSatisfaccion.add(new Checkbox("5 - Demasiado rápido",chxTiempo,false));
		
		Button btnGuardar = new Button("Guardar");
		btnGuardar.addActionListener(this);
		vtnSatisfaccion.add(btnGuardar);
		
		Frame frmVtn = new Frame();
		frmVtn.setTitle("Test de Satisfacción");
		frmVtn.setSize(500,300);
		frmVtn.add(vtnSatisfaccion);
		frmVtn.setVisible(true);
		*/
		
		Object[] opciones = {"Muy buena", "Buena", "Regular", "Mala"};
		String s = (String)JOptionPane.showInputDialog(
		                    null,
		                    "Por favor:\n"
		                    + "\"Indique su grado de satisfacción con la aplicación \n para realizar la tarea:"+ t.getDescripcion() +"\"",
		                    "Grado de Satisfacción",
		                    JOptionPane.PLAIN_MESSAGE,	
		                    icon,
		                    opciones,
		                    "Muy buena");		
		if ((s != null) && (s.length() > 0)) {
		    t.setGradoSatisfaccion(s);
		    return;
		}
		
	}
	/*public void actionPerformed(ActionEvent e) {
		Button btn = (Button) e.getSource();
		Panel panel = (Panel) btn.getParent();
		Checkbox check = (Checkbox) panel.getComponent(1);
		if(check.getState()){
			System.out.print("Seleccionó " + check.getLabel());
		}
		check = (Checkbox) panel.getComponent(2);
		if(check.getState()){
			System.out.print("Seleccionó " + check.getLabel());
		}
    }*/
}
