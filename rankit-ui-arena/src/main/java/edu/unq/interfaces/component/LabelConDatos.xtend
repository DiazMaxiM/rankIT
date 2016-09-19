package edu.unq.interfaces.component

import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.layout.HorizontalLayout
import java.awt.Color

@Observable
@Accessors
class LabelConDatos extends Panel{
	

	Label labelNombre
	Label labelValor
	
	
	new(Container container) {
		super(container)
		layout= new HorizontalLayout
		labelNombre = new Label(this)
		labelValor = new Label(this)
	}
  	  
	def bindValueToPropertyLabelValor(String property) {
		labelValor.bindValueToProperty(property)
		this
	}
	def bindValueToPropertyLabelNombre(String property) {
		labelNombre.bindValueToProperty(property)
		this
	}
	def cambiarDeColorAlValor(String property){
		     if(property.equals("R")||property.equals("r")){
		     	labelValor.foreground = Color.RED
		     }
				labelValor.foreground = Color.BLUE
			
  		 }
}