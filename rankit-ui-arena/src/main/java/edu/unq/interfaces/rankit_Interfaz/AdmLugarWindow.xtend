package edu.unq.interfaces.rankit_Interfaz

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import edu.unq.interfaces.rankit_dominio.Lugar
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
import edu.unq.interfaces.component.Titulo
import org.uqbar.arena.windows.ErrorsPanel
import edu.unq.interfaces.component.LabeledCheckBox
import java.text.SimpleDateFormat
import org.uqbar.arena.widgets.CheckBox
import edu.unq.interfaces.rankit_dominio.PuntuableSeleccionadoAppModel
import org.uqbar.arena.windows.Dialog
import edu.unq.interfaces.rankit_dominio.Puntuable

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
			bindValueToProperty("administradorDePuntuables.lugaresDeshabilitados")
		]
	}
	
	def puntuablesHabilitados(Panel panel) {
		new Label(panel)=>[
	   	    text="Habilitados: "
			
		]
		new Label(panel)=> [
			bindValueToProperty("administradorDePuntuables.lugaresHabilitados")
		]
	}
	
	def puntuablesInscriptos(Panel panel) {
		new Label(panel)=>[
	   	    text="Lugares Inscriptos: "
		]
	    new Label(panel)=> [
			bindValueToProperty("administradorDePuntuables.lugaresInscriptos")
		]
	}
	
	def crearListadoDeServicios(Panel panel){
		new Titulo(panel,"Servicios")
	    val panelBusqueda = new Panel(panel)
        panelBusqueda.layout = new HorizontalLayout
        this.ingresarDatos(panelBusqueda)
        this.buscar(panelBusqueda)
	}
	
	def ingresarDatos(Panel panel){
		new Label(panel).text = "Buscar por nombre de servicio"
	    new TextBox(panel) => [
	       bindValueToProperty("nombreDelLugarBuscado")
	       
           width = 200 
         ]  
	}
	
	def buscar(Panel panel){
		 new Button(panel) => [
	      caption = "Buscar"
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
		this.nombreYPanelDeError(servicioCompletaPanel)
		this.cambiarNombreYHabilitar(servicioCompletaPanel)
		this.estadisticasDelPuntuable(servicioCompletaPanel)
		this.revisarYEliminar(servicioCompletaPanel)
	}
	
	def nombreYPanelDeError(Panel panel) {
		 new Label(panel).text = "Nombre:"
		 new Label(panel)=>[
			value <=> "puntuableSeleccionado.nombre"
			fontSize = 13
		]
	    new ErrorsPanel(panel, "Edita la información")
	}
	
	def cambiarNombreYHabilitar(Panel panel) {
		new Label(panel).text = "Nombre:"
		new TextBox(panel)=> [
			bindEnabledToProperty("hayPuntuableSeleccionado")
		    bindValueToProperty("nombreLugar")
		]
		new Label(panel).text= "Habilitado"
		new CheckBox(panel)=> [
			bindEnabledToProperty("hayPuntuableSeleccionado")
		    bindValueToProperty("habilitadoLugar")
		]
	}
	
	def estadisticasDelPuntuable(Panel panel) {
		 new Label(panel).text = "Ranting promedio:"
        new Label(panel)=> [
        	bindEnabledToProperty("hayPuntuableSeleccionado")
		    bindValueToProperty("ratingPromedio")
		]
	    new Label(panel).text = "Calificaciones:"
	    new Label(panel)=> [
	        bindEnabledToProperty("hayPuntuableSeleccionado")
			bindValueToProperty("cantidadDeCalificacionesDelPuntuable")
		]
		
		}
		
		def revisarYEliminar(Panel panel){
		     new Button(panel) => [
		      caption = "Revisar Publicaciones"
		      bindEnabledToProperty("hayPuntuableSeleccionado")
		       onClick[|this.mostrarPuntuableSeleccionado]
	         ]
	         new Button(panel) => [
		      caption = "Eliminar"
		      bindEnabledToProperty("hayPuntuableSeleccionado")
		      onClick [| 
			 	this.modelObject.eliminarLugar
			 ]
		      
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
	
	
	
	override protected addActions(Panel panel) {
	}
	
	//Acciones 
	def mostrarPuntuableSeleccionado(){
		this.openDialog(new MostrarPuntuableWindow(this, modelObject.puntuableSeleccionado))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.buscarPorNombreDeLugar]
		dialog.open
	}
	
}