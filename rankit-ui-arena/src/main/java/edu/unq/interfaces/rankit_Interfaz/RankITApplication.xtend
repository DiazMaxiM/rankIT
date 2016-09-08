package edu.unq.interfaces.rankit_Interfaz

import org.uqbar.arena.Application
import edu.unq.interfaces.rankit_dominio.RankIT
import edu.unq.interfaces.rankit_dominio.RankITAppModel

class RankITApplication extends  Application{
	
	override protected createMainWindow() {
	val rankit = new RankIT()
	val model = new RankITAppModel(rankit)	
	
	
	new Menu(this, model)
	
	}
	def static void main (String[] args){
		new RankITApplication().start()
	}
	
	
}