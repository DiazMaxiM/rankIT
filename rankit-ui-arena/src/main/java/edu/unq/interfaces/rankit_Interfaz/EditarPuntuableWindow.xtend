package edu.unq.interfaces.rankit_Interfaz

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import edu.unq.interfaces.rankit_dominio.Puntuable
import org.uqbar.arena.widgets.Panel
import edu.unq.interfaces.component.LabeledCheckBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarPuntuableWindow extends Dialog<Puntuable> {
	
	new(WindowOwner owner, Puntuable model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel)=>[
			text="Nombre: "
			fontSize = 13
		]
		 new Label(mainPanel)=>[
			value <=> "nombre"
			fontSize = 13
		]
		new TextBox(mainPanel)=> [
		    bindValueToProperty("nombre")
		]
		
		new LabeledCheckBox(mainPanel) => [
			text = "Habilitado"
			bindValueToProperty("habilitado")
		]
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [|this.close]
		]
	}
}