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
       new Label(panelEstadisticas)=>[
	   	    text="Lugares Inscriptos: "
		]
	    new Label(panelEstadisticas)=> [
			bindValueToProperty("administradorDePuntuables.lugaresInscriptos")
		]	
			
	   new Label(panelEstadisticas)=>[
	   	    text="Habilitados: "
			
		]
		new Label(panelEstadisticas)=> [
			bindValueToProperty("administradorDePuntuables.lugaresHabilitados")
		]
	   new Label(panelEstadisticas)=>[
	   	    text="Deshabilitados: "
		]
		
		new Label(panelEstadisticas)=> [
			bindValueToProperty("administradorDePuntuables.lugaresDeshabilitados")
		]
	}
	def crearListadoDeServicios(Panel panel){
		new Titulo(panel,"Servicios")
	    val panelBusqueda = new Panel(panel)
        panelBusqueda.layout = new HorizontalLayout
	    new Label(panelBusqueda).text = "Buscar por nombre de servicio"
	    new TextBox(panelBusqueda) => [
	       bindValueToProperty("nombreDelPuntuableBuscado")
	       
           width = 200 
         ]  
        new Button(panelBusqueda) => [
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
		new Label(servicioCompletaPanel).text = "Nombre:"
		 new Label(servicioCompletaPanel)=>[
			value <=> "puntuableSeleccionado.nombre"
			fontSize = 13
		]
	    new ErrorsPanel(servicioCompletaPanel, "Edita la información")
		new Label(servicioCompletaPanel).text = "Nombre:"
		new TextBox(servicioCompletaPanel)=> [
			bindEnabledToProperty("hayPuntuableSeleccionado")
		    bindValueToProperty("nombrePuntuable")
		]
		new Label(servicioCompletaPanel).text= "Habilitado"
		new CheckBox(servicioCompletaPanel)=> [
			bindEnabledToProperty("hayPuntuableSeleccionado")
		    bindValueToProperty("habilitado")
		]
        new Label(servicioCompletaPanel).text = "Ranting promedio:"
        new Label(servicioCompletaPanel)=> [
        	bindEnabledToProperty("hayPuntuableSeleccionado")
		    bindValueToProperty("ratingPromedio")
		]
	    new Label(servicioCompletaPanel).text = "Calificaciones:"
	    new Label(servicioCompletaPanel)=> [
	        bindEnabledToProperty("hayPuntuableSeleccionado")
			bindValueToProperty("cantidadDeCalificacionesDelPuntuable")
		]
	     new Button(servicioCompletaPanel) => [
	      caption = "Revisar Publicaciones"
	      bindEnabledToProperty("hayPuntuableSeleccionado")
	      //onClick [ | new NuevoPuntuableWindow(this, this.modelObject..open ]
         ]
         new Button(servicioCompletaPanel) => [
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
		new Table<Lugar>(panelTabla, typeof(Lugar)) => [
			//bindeamos el contenido de la tabla
			(items <=> "administradorDePuntuables.lugares")
			value <=> "puntuableSeleccionado"
			//le definimos el alto y ancho, esto es opcional
			width=200
			// describimos cada fila
			// para esto definimos las celdas de cada filar
			// it es la grilla de resultados 
			 
			new Column<Lugar>(it) => [
				title = "Fecha De Registro" //el nombre de la columna
				fixedSize = 150   //el tamaño que va a tener
				bindContentsToProperty("fechaDeRegistro").transformer = [fecha | new SimpleDateFormat("dd/MM/YYYY HH:mm").format(fecha)]
		 //la propiedad que mostramos del objeto que está atrás de la fila 
			] 
			
			new Column<Lugar>(it) => [
				title = "Nombre" //el nombre de la columna
				fixedSize = 150   //el tamaño que va a tener
				bindContentsToProperty("nombre")
		 //la propiedad que mostramos del objeto que está atrás de la fila 
			] 
			
			new Column<Lugar>(it) => [
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
	
}