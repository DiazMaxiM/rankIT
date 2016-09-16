package edu.unq.interfaces.rankit_Interfaz

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout

abstract class VistaGenericaWindow<T> extends  SimpleWindow<T>{
	

	
	new(WindowOwner parent, T model) {
		super(parent, model)
	}
	override protected createFormPanel(Panel mainPanel) {
		 
		 val panel= new Panel(mainPanel)
		 panel.layout= new VerticalLayout
		
		 resumenDeSituacion(panel)
		 busqueda(panel)
		 tablaYEdicion(panel)
	}
	def void resumenDeSituacion(Panel mainPanel)
	
	def void busqueda(Panel mainPanel)
	
	
	def void tablaYEdicion(Panel mainPanel)
	
	
	
}