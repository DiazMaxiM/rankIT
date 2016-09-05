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

class AdmLugarWindow extends SimpleWindow<RankIT>{
	
	new(WindowOwner parent, RankIT model) {
		super(parent, model)
		title = "Rank-IT -->Adm Servicios"
	    taskDescription = "Resumen de situación"
	    
	}
	
	override protected createFormPanel(Panel panelPrincipal) {
	   	this.resumenDeSituacion(panelPrincipal)
	   	this.busqueda(panelPrincipal)
	    this.resultadosYEdicion(panelPrincipal)

	}
	
	def resumenDeSituacion(Panel panel) {
	   val panelEstadisticas = new Panel(panel)  // panel es el panel padre que contiene al nuevo panel
       panelEstadisticas.layout = new HorizontalLayout
	   new Label(panelEstadisticas).text = "Lugares inscriptos:"
       new Label(panelEstadisticas).text = "Habilitados:"
	   new Label(panelEstadisticas).text = "Deshabilitados:"
	}
	def busqueda(Panel panel){
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
	def resultadosYEdicion(Panel panel) {
		val panelDatos= new Panel(panel)  // panel es el panel padre que contiene al nuevo panel
        panelDatos.layout = new ColumnLayout(2)
        this.panelIzquierdo(panelDatos)
        this.panelDerecho(panelDatos)
	}
	
	def panelDerecho(Panel panel) {
		new Label(panel).text = "PanelDerecho"
		
	}
	
	
	def panelIzquierdo(Panel panel) {
		val table = new Table<Lugar>(panel, typeof(Lugar)) => [
        items <=> "lugares"
       ]
       new Column<Lugar>(table) => [
       title = "Nombre"
       fixedSize = 200
    ]
		
	}
	
	
	
	
	
	override protected addActions(Panel arg0) {
	//	throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}