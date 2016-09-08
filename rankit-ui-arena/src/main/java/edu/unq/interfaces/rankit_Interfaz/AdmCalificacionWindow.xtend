package edu.unq.interfaces.rankit_Interfaz

import edu.unq.interfaces.rankit_dominio.RankIT
import edu.unq.interfaces.rankit_dominio.Usuario
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import edu.unq.interfaces.rankit_dominio.Calificacion
import edu.unq.interfaces.rankit_dominio.RankITAppModel

class AdmCalificacionWindow extends SimpleWindow<RankITAppModel>{
	
	new(WindowOwner parent, RankITAppModel model) {
		super(parent, model)
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
		
		new Table<Usuario>(mainPanel, typeof(Usuario)) => [
			//bindeamos el contenido de la tabla
			items <=> "usuarios"
			//le definimos el alto y ancho, esto es opcional
			//height = 200
			
			// describimos cada fila
			// para esto definimos las celdas de cada fila
		
			// la lotería de la que vamos a hablar
			// it es la grilla de resultados 
			new Column<Usuario>(it) => [
				title = "Evaluado" //el nombre de la columna
				fixedSize = 150   //el tamaño que va a tener
				//bindContentsToProperty("nombre") //la propiedad que mostramos del objeto que está atrás de la fila 
			]   
			//el numero que salió en la loteria 
			new Column<Usuario>(it) => [
				title = "Ptos"
				fixedSize = 150
				//bindContentsToProperty("puntos")
			]
			new Column<Usuario>(it) => [
				title = "Fecha" //el nombre de la columna
				fixedSize = 150   //el tamaño que va a tener
				//bindContentsToProperty("fecha") //la propiedad que mostramos del objeto que está atrás de la fila 
			]   
			//el numero que salió en la loteria 
			new Column<Usuario>(it) => [
				title = "User"
				fixedSize = 150
				//bindContentsToProperty("user")
			] 
			new Column<Usuario>(it) => [
				title = "Es Ofensiva"
				fixedSize = 150
				//bindContentsToProperty("ofensiva")
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