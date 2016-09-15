package edu.unq.interfaces.component

import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class LabelCheckBox extends Panel{
	
	CheckBox checkBox
	Label label
	
	
	new(Container container) {
		super(container)
		layout= new HorizontalLayout
		crearCheckBox(this)
		label = new Label(this)
		
	}
  def  setText(String text){ 
		label.text = text
		this
	}

	
	def crearCheckBox(LabelCheckBox box) {
		checkBox = new CheckBox(this)
		this
	}
	  
	def bindValueToProperty(String property) {
		checkBox.bindValueToProperty(property)
		this
	}
	
	def bindEnabledToProperty(String property) {
		checkBox.bindEnabledToProperty(property)
		this
	}
	
}