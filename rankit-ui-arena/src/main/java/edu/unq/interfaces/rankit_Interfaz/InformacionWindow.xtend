package edu.unq.interfaces.rankit_Interfaz

import appModels.GenericaAppModel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

class InformacionWindow extends Dialog<GenericaAppModel> {

	new(WindowOwner owner, GenericaAppModel model) {
		super(owner, model)
		title = "Rank-IT"
	}

	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel) => [text = "Su clave ha sido blanqueada"]
		new Button(mainPanel) => [
			caption = "Ok"
			onClick[|
				
				this.close
			]
		]
	}

}
