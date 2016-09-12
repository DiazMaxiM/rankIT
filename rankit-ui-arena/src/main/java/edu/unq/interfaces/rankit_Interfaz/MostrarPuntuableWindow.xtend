package edu.unq.interfaces.rankit_Interfaz

import org.uqbar.arena.aop.windows.TransactionalDialog
import edu.unq.interfaces.rankit_dominio.PuntuableSeleccionadoAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import edu.unq.interfaces.rankit_dominio.Puntuable

class MostrarPuntuableWindow extends TransactionalDialog<Puntuable>{
	
	new(WindowOwner owner, Puntuable model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
}