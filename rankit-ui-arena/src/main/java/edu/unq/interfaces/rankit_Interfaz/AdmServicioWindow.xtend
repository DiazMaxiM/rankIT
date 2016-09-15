package edu.unq.interfaces.rankit_Interfaz
import org.uqbar.arena.windows.WindowOwner
import edu.unq.interfaces.rankit_dominio.PuntuableAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import edu.unq.interfaces.rankit_dominio.Puntuable
import org.uqbar.arena.widgets.tables.Column
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import java.text.SimpleDateFormat
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import java.util.List
import edu.unq.interfaces.rankit_dominio.Calificacion
import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.Usuario
import edu.unq.interfaces.rankit_dominio.CalificacionAppModel

class AdmServicioWindow extends AdmLugarWindow{
	
	new(WindowOwner parent, PuntuableAppModel model) {
		super(parent, model)
	}


	
	override puntuablesInscriptos(Panel panel) {
		new Label(panel)=>[
	   	    text="Servicios Inscriptos: "
		]
	    new Label(panel)=> [
			bindValueToProperty("inscriptos")
		]
	}
	
	
	override titulo(Panel panel){
		var panelTitulo=new Panel(panel)
		panelTitulo.layout=new ColumnLayout(2)
		new Label(panelTitulo) => [
		text = "Servicios"
		fontSize = 15
        ]
	}
	
	override ingresarDatosYBuscar(Panel panel){
		var panelDatos=new Panel(panel)
		panelDatos.layout=new ColumnLayout(3)
		new Label(panelDatos).text = "Buscar por nombre de Servicio:"
	    new TextBox(panelDatos) => [
	       bindValueToProperty("nombreBuscado")
	       
           width = 100
         ]  
         
		 new Button(panelDatos) => [
	      caption = "Buscar"
	      width = 100
	      onClick([|modelObject.buscar])
	      .setAsDefault
          .disableOnError
         ]
	}
	
	
	

	
	
}