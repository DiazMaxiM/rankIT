package edu.unq.interfaces.rankit_Interfaz

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import edu.unq.interfaces.rankit_dominio.PuntuableAppModel
import org.uqbar.arena.windows.ErrorsPanel
import java.text.SimpleDateFormat
import org.uqbar.arena.widgets.CheckBox
import edu.unq.interfaces.rankit_dominio.Puntuable
import edu.unq.interfaces.rankit_dominio.CalificacionAppModel
import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.Usuario
import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import edu.unq.interfaces.rankit_dominio.Calificacion
import java.util.List
import edu.unq.interfaces.component.LabelCheckBox

class AdmLugarWindow extends SimpleWindow<PuntuableAppModel>{
	
	new(WindowOwner parent, PuntuableAppModel model) {
		super(parent, model)
		title = "Rank-IT -->Adm Servicios"
	    taskDescription = "Resumen de situación"
	    
	}
	
	override protected createFormPanel(Panel panelPrincipal) {
		val panel= new Panel(panelPrincipal)
	   	this.resumenDeSituacion(panel)
	   	this.crearListadoDeServicios(panel)
	    this.crearEdicionDeServicioSeleccionado(panel)

	}
	
	def resumenDeSituacion(Panel panel) {
	   val panelEstadisticas = new Panel(panel) 
       panelEstadisticas.layout = new HorizontalLayout
       this.puntuablesInscriptos(panelEstadisticas)
       this.puntuablesHabilitados(panelEstadisticas)
       this.puntuablesDesHabilitados(panelEstadisticas)
	}
	
	def puntuablesDesHabilitados(Panel panel) {
		new Label(panel)=>[
	   	    text="Deshabilitados: "
		]
		
		new Label(panel)=> [
			bindValueToProperty("lugaresDeshabilitados")
		]
	}
	
	def puntuablesHabilitados(Panel panel) {
		new Label(panel)=>[
	   	    text="Habilitados: "
			
		]
		new Label(panel)=> [
			bindValueToProperty("lugaresHabilitados")
		]
	}
	
	def puntuablesInscriptos(Panel panel) {
		new Label(panel)=>[
	   	    text="Lugares Inscriptos: "
		]
	    new Label(panel)=> [
			bindValueToProperty("lugaresInscriptos")
		]
	}
	
	def crearListadoDeServicios(Panel panel){
		var panelBusqueda= new Panel(panel)
		this.titulo(panelBusqueda)
		 this.ingresarDatosYBuscar(panelBusqueda)
    
	}
	
	def titulo(Panel panel){
		var panelTitulo=new Panel(panel)
		panelTitulo.layout=new ColumnLayout(2)
		new Label(panelTitulo) => [
		text = "Lugares"
		fontSize = 15
        ]
	}
	
	def ingresarDatosYBuscar(Panel panel){
		var panelDatos=new Panel(panel)
		panelDatos.layout=new ColumnLayout(3)
		new Label(panelDatos).text = "Buscar por nombre de Lugar:"
	    new TextBox(panelDatos) => [
	       bindValueToProperty("nombreDelLugarBuscado")
	       
           width = 100
         ]  
         
		 new Button(panelDatos) => [
	      caption = "Buscar"
	      width = 100
	       onClick([|modelObject.buscarPorNombreDeLugar])
	       .setAsDefault
          .disableOnError
        ]
	}
	def crearEdicionDeServicioSeleccionado(Panel panel) {
		val panelDatos= new Panel(panel)
        panelDatos.layout = new ColumnLayout(2)
   
        this.panelIzquierdo(panelDatos)
        this.panelDerecho(panelDatos)
	}
	
	def panelDerecho(Panel panel) {
		val servicioCompletaPanel = new Panel(panel)
		servicioCompletaPanel.layout = new VerticalLayout
		this.mostrarNombre(servicioCompletaPanel)
		this.panelErrores(servicioCompletaPanel)
		this.editarNombre(servicioCompletaPanel)
		this.habilitarPuntuable(servicioCompletaPanel)
		this.calificacionesPuntuable(servicioCompletaPanel)
		this.botones(servicioCompletaPanel)
	}
	
	
	def mostrarNombre(Panel panel){
		var panelNombre=new Panel(panel)
		panelNombre.layout = new  ColumnLayout(2)
		new Label(panelNombre)=>[
			text="Nombre: "
			fontSize = 13
		]
		 new Label(panelNombre)=>[
			value <=> "puntuableSeleccionado.nombre"
			fontSize = 13
		]
	}
	
	def panelErrores(Panel panel) {
	    new ErrorsPanel(panel, "Edita la información")
	}
	
	def editarNombre(Panel panel){
		new Label(panel).text = "Nombre:"
		new TextBox(panel)=> [
		  bindEnabledToProperty("hayPuntuableSeleccionado")
		  bindValueToProperty("nombre")
		]
		
	}
	
	def habilitarPuntuable(Panel panel) {
		var panelHabilitar=new Panel(panel)
		panelHabilitar.layout = new HorizontalLayout
	     new LabelCheckBox(panelHabilitar)
	     .setText("Habilitado")
	     .bindEnabledToProperty("hayPuntuableSeleccionado")
		 .bindValueToProperty("habilitado")
	
	
	}
	
	def  calificacionesPuntuable(Panel panel) {
		this. rating(panel)
		this.calificaciones(panel)
		
	}
	def rating(Panel panel){
		var panelRating=new Panel(panel)
		panelRating.layout = new HorizontalLayout
		new Label(panelRating).text = "Ranting promedio:"
        new Label(panelRating)=> [
           bindEnabledToProperty("hayPuntuableSeleccionado")
		   bindValueToProperty("ratingPromedio")
		]
		
	}
	def calificaciones(Panel panel){
		var panelCalificaciones=new Panel(panel)
		panelCalificaciones.layout = new HorizontalLayout
	    new Label(panelCalificaciones).text = "Calificaciones:"
	    new Label(panelCalificaciones)=> [
	       bindEnabledToProperty("hayPuntuableSeleccionado")
		   bindValueToProperty("cantidadDeCalificacionesDelPuntuable")
		]
		
		}
		
		def botones(Panel panel){
		     new Button(panel) => [
		       caption = "Revisar Calificaciones"
		       bindEnabledToProperty("hayPuntuableSeleccionado")
		       onClick [ |mostrarCalificacionesDelPuntuable(this.modelObject.calificacionesDelPuntuable,this.modelObject.puntuableSeleccionado)]
		       width = 200
		]
	         new Button(panel) => [
		      caption = "Eliminar"
		     bindEnabledToProperty("hayPuntuableSeleccionado")
		      onClick [| 
			 	this.modelObject.eliminarLugar
			 ]
		       width = 200
	         ]
	}

	
	
	def panelIzquierdo(Panel panel) {
	  val  panelDeListadoDeServicios = new Panel(panel)
	  this.contenedorTabla(panelDeListadoDeServicios)
	  this.panelBotones(panelDeListadoDeServicios) 
	}
	
	def contenedorTabla(Panel panel) {
	
		val panelTabla=new Panel(panel)
		new Table<Puntuable>(panelTabla, typeof(Puntuable)) => [
			//bindeamos el contenido de la tabla
			(items <=> "administradorDePuntuables.lugares")
			value <=> "puntuableSeleccionado"
			//le definimos el alto y ancho, esto es opcional
			width=200
			// describimos cada fila
			// para esto definimos las celdas de cada filar
			// it es la grilla de resultados 
			 
			new Column<Puntuable>(it) => [
				title = "Fecha De Registro" //el nombre de la columna
				fixedSize = 150   //el tamaño que va a tener
				bindContentsToProperty("fechaDeRegistro").transformer = [fecha | new SimpleDateFormat("dd/MM/YYYY HH:mm").format(fecha)]
		 //la propiedad que mostramos del objeto que está atrás de la fila 
			] 
			
			new Column<Puntuable>(it) => [
				title = "Nombre" //el nombre de la columna
				fixedSize = 150   //el tamaño que va a tener
				bindContentsToProperty("nombre")
		 //la propiedad que mostramos del objeto que está atrás de la fila 
			] 
			
			new Column<Puntuable>(it) => [
				title = "Habilitado" //el nombre de la columna
				fixedSize = 150   //el tamaño que va a tener
				bindContentsToProperty("habilitado").transformer = [ Boolean isHabilitado | if (isHabilitado) "SI" else "NO" ]
		 //la propiedad que mostramos del objeto que está atrás de la fila 
			] 
			]  
    }
	
	
	def panelBotones(Panel panel) {
		val panelBotones=new Panel(panel)
		new Button(panelBotones) =>[
			caption = "Nuevo"
			onClick [| 
				this.modelObject.nuevoLugar
			]
		] 
	}
	
		
	def mostrarCalificacionesDelPuntuable(List<Calificacion>calificacionesDelPuntuable,Puntuable lugar){  
		 var admPuntuables=new AdmPuntuables
		 admPuntuables.agregarLugar(lugar)
		 var admCalificaciones=new AdmCalificaciones
		 admCalificaciones.agregarTodasLasCalificaciones(calificacionesDelPuntuable)
		 var usuario=new Usuario
		 var appModel= new CalificacionAppModel(admCalificaciones,admPuntuables,usuario)
         new AdmCalificacionWindow(this,appModel) => [
			open
		]
	}
	
	
	
	override protected addActions(Panel panel) {
	}
	

	
}