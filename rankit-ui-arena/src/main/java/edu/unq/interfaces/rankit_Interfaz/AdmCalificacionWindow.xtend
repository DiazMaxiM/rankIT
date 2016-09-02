package edu.unq.interfaces.rankit_Interfaz

import edu.unq.interfaces.rankit_dominio.Calificacion
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.*
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import edu.unq.interfaces.rankit_dominio.Usuario

class AdmCalificacionWindow extends SimpleWindow<Calificacion>{
	
	new(WindowOwner parent, Calificacion model) {
		super(parent, new Calificacion(new Usuario))
	}
	
	
	def contenedorSituacion(Panel mainPanel) {
		val SituacionTituloPanel = new Panel(mainPanel)
		val SituacionEstadoSituacionPanel = new Panel(mainPanel)
			
		SituacionTituloPanel.layout = new HorizontalLayout
		SituacionEstadoSituacionPanel.layout = new ColumnLayout(8)
		
		new Label(SituacionTituloPanel)=> [
			text = "Resumen de situación:" 
		]	
		
		new Label(SituacionEstadoSituacionPanel)=> [
			text = "Calificaciones Registradas:" 
		]	
		
		new Label(SituacionEstadoSituacionPanel)=> [
			//bindValueToProperty("")
		]	
		
		new Label(SituacionEstadoSituacionPanel)=> [
			text = "Ofensivas:" 
		]	
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
		contenedorBusqueda (mainPanel)
		contenedorTablaYOpciones (mainPanel)
		}
	
	def void contenedorTablaYOpciones(Panel mainPanel) {
		val contenedorTablaYOpcionesPanel = new Panel(mainPanel)
		contenedorTablaYOpcionesPanel.layout = new ColumnLayout(2)
		contenedorTabla (contenedorTablaYOpcionesPanel)
		//contenedorOpciones (contenedorTablaYOpcionesPanel)
	}
	
	def void contenedorTabla(Panel mainPanel) {
		
		new Table<ResultadoCalificacion>(mainPanel, typeof(ResultadoCalificacion)) => [
			//bindeamos el contenido de la tabla
			//items <=> "resultados"
			//le definimos el alto y ancho, esto es opcional
			height = 200
			
			// describimos cada fila
			// para esto definimos las celdas de cada fila
		
			// la lotería de la que vamos a hablar
			// it es la grilla de resultados 
			new Column<ResultadoCalificacion>(it) => [
				title = "Lotería" //el nombre de la columna
				fixedSize = 150   //el tamaño que va a tener
				//bindContentsToProperty("nombreLoteria") //la propiedad que mostramos del objeto que está atrás de la fila 
			]   
			//el numero que salió en la loteria 
			new Column<ResultadoCalificacion>(it) => [
				title = "Ganador"
				fixedSize = 150
				//bindContentsToProperty("numeroGanador")
			] 
		]
	}
	
	def contenedorOpciones(Panel panel) {
		//throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def contenedorBusqueda(Panel mainPanel) {
		val contenedorTituloPanel = new Panel(mainPanel)
		val contenedorParametrosPanel = new Panel(mainPanel)
			
		contenedorTituloPanel.layout = new HorizontalLayout
		contenedorParametrosPanel.layout = new ColumnLayout(5)
		
		new Label(contenedorTituloPanel)=> [
			text = "Calificaciones:" 
		]	
		
		new Label(contenedorParametrosPanel)=> [
			text = "Usuario:" 
		]	
		
		new TextBox(contenedorParametrosPanel)=> [
			//bindValueToProperty("")
		]	
		
		new Label(contenedorParametrosPanel)=> [
			text = "Evaluado:" 
		]	
		new TextBox(contenedorParametrosPanel)=> [
			//bindValueToProperty("")
		]
		new Button(contenedorParametrosPanel)=> [
			caption = "Buscar"
		]	
	}	
	
}