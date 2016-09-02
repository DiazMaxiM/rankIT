package edu.unq.interfaces.rankit_Interfaz

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import edu.unq.interfaces.rankit_dominio.Lugar
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout

class AdmLugarWindow extends SimpleWindow<Lugar>{
	
	new(WindowOwner parent, Lugar model) {
		super(parent, model)
		title = "Rank-IT -->Adm Servicios"
	    taskDescription = "Resumen de situación"
	    
	}
	
	override protected createFormPanel(Panel panelPrincipal) {
	   	this.primerLayout(panelPrincipal)
	   	this.segundoLayout(panelPrincipal)
	    this.tercerLayout(panelPrincipal)

	}
	
	override protected addActions(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}