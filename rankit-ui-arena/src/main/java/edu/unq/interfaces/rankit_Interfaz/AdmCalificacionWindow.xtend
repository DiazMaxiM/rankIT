package edu.unq.interfaces.rankit_Interfaz

import edu.unq.interfaces.rankit_dominio.Calificacion
import edu.unq.interfaces.rankit_dominio.CalificacionAppModel
import edu.unq.interfaces.rankit_dominio.Puntuable
import edu.unq.interfaces.rankit_dominio.Usuario
import java.text.SimpleDateFormat
import org.uqbar.arena.bindings.DateTransformer
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.NumericField

class AdmCalificacionWindow extends SimpleWindow<CalificacionAppModel>{
	
	new(WindowOwner parent, CalificacionAppModel model) {
		super(parent, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title="Rank-IT --> Adm Calificacion"
		
		val panel    = new Panel(mainPanel)
		panel.layout = new VerticalLayout
		
		contenedorSituacion      (panel)
		contenedorBusqueda       (panel)
		contenedorTablaYOpciones (panel)
	}
	
	def contenedorSituacion(Panel mainPanel) {
	
		val SituacionTituloPanel = new Panel(mainPanel)
		SituacionTituloPanel.layout = new HorizontalLayout

		new Label(SituacionTituloPanel)=> [
			text = "Resumen de situación:" 
		]		

		val SituacionEstadoSituacionPanel = new Panel(mainPanel)
		SituacionEstadoSituacionPanel.layout = new ColumnLayout(4)
		
		new Label(SituacionEstadoSituacionPanel)=> [
			text = "Calificaciones Registradas:" 
		]	
		
		new Label(SituacionEstadoSituacionPanel)=> [
			bindValueToProperty("calificacionesRegistradas")
		]	
		
		new Label(SituacionEstadoSituacionPanel)=> [
			text = "Ofensivas:" 
		]	
		new Label(SituacionEstadoSituacionPanel)=> [
			bindValueToProperty("calificacionesOfensivas")
		]	
		
	}
	
	override protected addActions(Panel actionsPanel) {
	}
	
	def void contenedorTablaYOpciones(Panel mainPanel) {

		val contenedorTablaYOpcionesPanel = new Panel(mainPanel)
		contenedorTablaYOpcionesPanel.layout = new ColumnLayout(2)

		contenedorTabla (contenedorTablaYOpcionesPanel)
		contenedorOpciones (contenedorTablaYOpcionesPanel)

//		new Label(contenedorTablaYOpcionesPanel)
	}
	
	def void contenedorTabla(Panel mainPanel) {
		val contenedorTabla = new Panel(mainPanel)
		//contenedorTabla.layout = new Ver
		
		new Table<Calificacion>(contenedorTabla, typeof(Calificacion)) => [
			//bindeamos el contenido de la tabla
			(items <=> "listaCalificacionesFiltradas")
			value <=> "calificacionSeleccionada"
			//le definimos el alto y ancho, esto es opcional
			width=400
			height=400
			// describimos cada fila
			// para esto definimos las celdas de cada fila
		
			// la lotería de la que vamos a hablar
			// it es la grilla de resultados 
			new Column<Calificacion>(it) => [
				title = "Evaluado" //el nombre de la columna
				fixedSize = 100   //el tamaño que va a tener
				bindContentsToProperty("evaluado").transformer = [ Puntuable puntuable | puntuable.nombre]
		 //la propiedad que mostramos del objeto que está atrás de la fila 
			]   
			//el numero que salió en la loteria 
			new Column<Calificacion>(it) => [
				title = "Ptos"
				fixedSize = 100
				bindContentsToProperty("puntos")
			]
			new Column<Calificacion>(it) => [
				title = "Fecha" //el nombre de la columna
				fixedSize = 100   //el tamaño que va a tener
				bindContentsToProperty("fecha").transformer = [fecha | new SimpleDateFormat("dd/MM/YYYY HH:mm").format(fecha)] //la propiedad que mostramos del objeto que está atrás de la fila 
			]   
			//el numero que salió en la loteria 
			new Column<Calificacion>(it) => [
				title = "User"
				fixedSize = 100
				bindContentsToProperty("usuario").transformer = [ Usuario usuario | usuario.nombre]
			] 
			new Column<Calificacion>(it) => [
				title = "Es Ofensiva"
				fixedSize = 100
				bindContentsToProperty("contenidoOfensivo").transformer = [ esOfensivo | if (esOfensivo) "Si" else "No"]
			] 
		]
		new Button(contenedorTabla)=>[
			caption = "Nuevo"
			onClick [ | this.modelObject.agregarNuevaCalificacion()]
			]
	}
	
	def contenedorOpciones(Panel panel) {
		val contenedorOpciones = new Panel(panel)
		contenedorOpciones.layout = new VerticalLayout
		
		new ErrorsPanel(contenedorOpciones,"")
		
		new Label(contenedorOpciones)=> [
			text = "Evaluado" 
		]	
		new Selector(contenedorOpciones)=>[
			bindEnabledToProperty("hayCalificacionSeleccionada")
			bindItemsToProperty("admPuntuables.todosLosPuntuables").adapter = new PropertyAdapter(Puntuable, "nombre")
			bindValueToProperty("calificacionSeleccionada.evaluado")
		]
	 
		val contenedorFechaYUsuario = new Panel(contenedorOpciones)
		contenedorFechaYUsuario.layout = new VerticalLayout
		
		val contenedorFecha = new Panel(contenedorFechaYUsuario)
		contenedorFecha.layout = new HorizontalLayout
		val contenedorFechaColumna= new Panel(contenedorFecha)
		contenedorFechaColumna.layout = new ColumnLayout(2)
		
		
		new Label(contenedorFechaColumna)=> [
			text = "Fecha:" 
		]
		new Label(contenedorFechaColumna)=> [
			bindEnabledToProperty("hayCalificacionSeleccionada")
		val dateTransformer =new DateTransformer;		
			dateTransformer.pattern="dd/MM/yyyy HH:mm"
			bindValueToProperty("calificacionSeleccionada.fecha").transformer = dateTransformer
		]
		
		val contenedorUsuarioColumna= new Panel(contenedorFecha)
		contenedorUsuarioColumna.layout = new ColumnLayout(2)
		
		new Label(contenedorFechaColumna)=> [
			text = "Usuario:" 
		]
		new Label(contenedorFechaColumna)=> [
			bindEnabledToProperty("hayCalificacionSeleccionada")
			bindValueToProperty("calificacionSeleccionada.evaluado.nombre")//.transformer = [ fecha | new SimpleDateFormat("dd/MM/YYYY").format(fecha)]
		]
		
		new Label(contenedorOpciones)=> [
		text ="Puntaje:"	
		]
		new NumericField(contenedorOpciones)=> [
		bindEnabledToProperty("hayCalificacionSeleccionada")
		bindValueToProperty("puntos")
		]
		new Label(contenedorOpciones)=> [
		text ="Detalle:"	
		]
		new TextBox(contenedorOpciones)=> [
		bindEnabledToProperty("hayCalificacionSeleccionada")
		bindValueToProperty("calificacionSeleccionada.detalle")//.transformer = [ fecha | new SimpleDateFormat("dd/MM/YYYY").format(fecha)]
		height = 50
		]
		
		val contenedorContOfensivo = new Panel(contenedorOpciones)
		contenedorContOfensivo.layout = new VerticalLayout
		
		val contenedorContOfensivoHorizontal = new Panel(contenedorContOfensivo)
		contenedorFecha.layout = new HorizontalLayout
		val contenedorContOfensivoHorizontalColumna= new Panel(contenedorContOfensivoHorizontal)
		contenedorContOfensivoHorizontalColumna.layout = new ColumnLayout(2)
		new CheckBox(contenedorContOfensivoHorizontalColumna)=> [
		bindValueToProperty("contenidoOfensivo")//.transformer = [ fecha | new SimpleDateFormat("dd/MM/YYYY").format(fecha)]
		bindEnabledToProperty("hayCalificacionSeleccionada")
		]
		new Label(contenedorContOfensivoHorizontalColumna)=> [
		text ="Contenido Ofensivo"	
		] 
		new Button(contenedorOpciones)=> [
		caption = "Eliminar"
		    bindEnabledToProperty("hayCalificacionSeleccionada")
			
			onClick [ | this.modelObject.eliminarCalificacionSeleccionada()		
					
			]
		]
		
		
		}
	
	def contenedorBusqueda(Panel mainPanel) {
		val contenedorTituloPanel = new Panel(mainPanel)
		contenedorTituloPanel.layout = new HorizontalLayout
		
		
		new Label(contenedorTituloPanel)=> [
			text = "Calificaciones:" 
		]	
		
		val contenedorParametrosPanel = new Panel(mainPanel)
		contenedorParametrosPanel.layout = new ColumnLayout(5)
		
		new Label(contenedorParametrosPanel)=> [
			text = "Usuario:" 
		]	
		
		new TextBox(contenedorParametrosPanel)=> [
			bindValueToProperty("nombreUsuarioBusqueda")
		]	
		
		new Label(contenedorParametrosPanel)=> [
			text = "Evaluado:" 
		]	
		new TextBox(contenedorParametrosPanel)=> [
			bindValueToProperty("nombreEvaluadoBusqueda")
		]
		new Button(contenedorParametrosPanel)=> [
			caption = "Buscar"
			onClick [this.modelObject.listaCalificacionesFiltradas()]
		]	
	}	
	
}