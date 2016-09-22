package edu.unq.interfaces.rankit_Interfaz
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import appModels.GenericaAppModel

class EliminarWindow extends Dialog<GenericaAppModel>{
	
	new(WindowOwner owner, GenericaAppModel model) {
		super(owner, model)
		title = "Eliminar de Rank-IT"
	}
	

	override protected createFormPanel(Panel mainPanel) {
	new Label(mainPanel)=>[text="¿Esta seguro que desea eliminar?"]
	new Button(mainPanel)=>[caption="Ok"
		onClick[|this.modelObject.eliminar
				 this.close
		]
	]
	}
	
}