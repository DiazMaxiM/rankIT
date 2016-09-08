package edu.unq.interfaces.rankit_Interfaz

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import edu.unq.interfaces.rankit_dominio.Lugar
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label

class AdmLugarWindow extends SimpleWindow<Lugar>{
	
	new(WindowOwner parent, Lugar model) {
		super(parent, model)
		title = "Rank-IT -->Adm Servicios"
	    taskDescription = "Resumen de situación"
	    
	}
	
	override protected createFormPanel(Panel panelPrincipal) {
	   	this.resumenDeSituacion(panelPrincipal)
	   	this.busqueda(panelPrincipal)
	    this.datosYEdicion(panelPrincipal)

	}
	
	def resumenDeSituacion(Panel panel) {
	   val panelEstadisticas = new Panel(panel)  // panel es el panel padre que contiene al nuevo panel
       panelEstadisticas.layout = new HorizontalLayout
	   new Label(panelEstadisticas).text = ""
	}
	
	def busqueda(Panel panel) {
	     	
	}
	
	def datosYEdicion(Panel panel) {
		
	}
	
	
	
	
	override protected addActions(Panel arg0) {
	//	throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}