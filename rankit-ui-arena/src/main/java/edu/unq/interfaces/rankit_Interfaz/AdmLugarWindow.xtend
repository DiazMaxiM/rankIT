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
import edu.unq.interfaces.rankit_dominio.RankIT
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.layout.VerticalLayout

class AdmLugarWindow extends SimpleWindow<RankIT>{
	
	new(WindowOwner parent, RankIT model) {
		super(parent, model)
		title = "Rank-IT -->Adm Servicios"
	    taskDescription = "Resumen de situación"
	    
	}
	
	override protected createFormPanel(Panel panelPrincipal) {
	   	this.resumenDeSituacion(panelPrincipal)
	   	this.crearListadoDeServicios(panelPrincipal)
	    this.crearEdicionDeServicioSeleccionado(panelPrincipal)

	}
	
	def resumenDeSituacion(Panel panel) {
	   val panelEstadisticas = new Panel(panel)  // panel es el panel padre que contiene al nuevo panel
       panelEstadisticas.layout = new HorizontalLayout
	   new Label(panelEstadisticas).text = "Lugares inscriptos:"
       new Label(panelEstadisticas).text = "Habilitados:"
	   new Label(panelEstadisticas).text = "Deshabilitados:"
	}
	def crearListadoDeServicios(Panel panel){
	    val panelBusqueda = new Panel(panel)  // panel es el panel padre que contiene al nuevo panel
        panelBusqueda.layout = new HorizontalLayout
	    new Label(panelBusqueda).text = "Servicios"
	    new Label(panelBusqueda).text = "Buscar por nombre de servicio"
	    new TextBox(panelBusqueda) => [
           width = 200 
         ]  
        new Button(panelBusqueda) => [
	      caption = "Buscar"
         ]
	}
	def crearEdicionDeServicioSeleccionado(Panel panel) {
		val panelDatos= new Panel(panel)  // panel es el panel padre que contiene al nuevo panel
        panelDatos.layout = new ColumnLayout(2)
   
        this.panelIzquierdo(panelDatos)
        this.panelDerecho(panelDatos)
	}
	
	def panelDerecho(Panel panel) {
		val servicioCompletaPanel = new Panel(panel)
		servicioCompletaPanel.layout = new VerticalLayout
		new Label(servicioCompletaPanel).text = "Nombre:"
		new Button(servicioCompletaPanel) => [
	      caption = "Edita la información"
	      //onClick [ | new NuevoPuntuableWindow(this, this.modelObject..open ]
         ]
		 new Label(servicioCompletaPanel).text = "Nombre:"
		 new TextBox(servicioCompletaPanel) => [
           width = 200 
         ]  
         this.datosEnFormaHorizontal(servicioCompletaPanel)
          new Label(servicioCompletaPanel).text = "Rankin promedio"
	     new Label(servicioCompletaPanel).text = "Calificaciones"
	     new Button(servicioCompletaPanel) => [
	      caption = "Revisar Publicaciones"
	      //onClick [ | new NuevoPuntuableWindow(this, this.modelObject..open ]
         ]
         new Button(servicioCompletaPanel) => [
	      caption = "Eliminar"
	      //onClick [ | new NuevoPuntuableWindow(this, this.modelObject..open ]
         ]
	}
	
	def datosEnFormaHorizontal(Panel panel) {
		val panelDatos=new Panel(panel)
		panelDatos.layout=new HorizontalLayout
	     new CheckBox(panelDatos)
	     new Label(panelDatos).text = "Habilitado"
	}
	
	
	
	def panelIzquierdo(Panel panel) {
	  val  panelDeListadoDeServicios = new Panel(panel)
	  /**
	   * val table = new Table<Lugar>(panel, typeof(Lugar)) => [
        items <=> "lugares"
       ]
       new Column<Lugar>(table) => [
       title = "Nombre"
       fixedSize = 200
    ]
		
	   * 
	   * 
	   */

	   new Button(panelDeListadoDeServicios) =>[
			caption = "Nuevo"
			//onClick [ | new NuevoPuntuableWindow(this, this.modelObject..open ]
		] 
	}
	
	
	
	
	
	override protected addActions(Panel panel) {
	}
	
}