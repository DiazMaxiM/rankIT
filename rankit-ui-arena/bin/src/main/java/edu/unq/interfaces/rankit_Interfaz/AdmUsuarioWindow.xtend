package edu.unq.interfaces.rankit_Interfaz

import edu.unq.interfaces.rankit_dominio.Usuario
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.MainWindow

class AdmUsuarioWindow extends SimpleWindow<Usuario> {
	
	
	
	new(WindowOwner parent, Usuario model) {
		super(parent, new Usuario())
	}
	
	def contenedorSituacion(Panel mainPanel) {
		val SituacionTituloPanel = new Panel(mainPanel)
		val SituacionEstadoSituacionPanel = new Panel(mainPanel)
			
		SituacionTituloPanel.layout = new HorizontalLayout
		SituacionEstadoSituacionPanel.layout = new ColumnLayout(8)
		
		new Label(SituacionTituloPanel)=> [text = "Resumen de situación:" ]	
		
		new Label(SituacionEstadoSituacionPanel)=> [ text = "Usuarios Registrados:" ]	
		
		new Label(SituacionEstadoSituacionPanel)=> [
			//bindValueToProperty("")
		]
		
		new Label(SituacionEstadoSituacionPanel)=> [ text = "Activos:" ]
		
		new Label(SituacionEstadoSituacionPanel)=> [
			//bindValueToProperty("")
		]
		
		new Label(SituacionEstadoSituacionPanel)=> [ text = "Inactivos:" ]
		
		new Label(SituacionEstadoSituacionPanel)=> [
			//bindValueToProperty("")
		]
		
		new Label(SituacionEstadoSituacionPanel)=> [ text = "Baneados:" ]
		
		new Label(SituacionEstadoSituacionPanel)=> [
			//bindValueToProperty("")
		]
		
	}
	
	override protected addActions(Panel actionsPanel) {
		//throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
	this.title="Rank-IT --> Adm Usuarios"
		contenedorSituacion (mainPanel)
		//contenedorBusqueda (mainPanel)
		//contenedorTabla (mainPanel)
		//contenedorOpciones (mainPanel)
	}
	
	
	
}