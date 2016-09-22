package edu.unq.interfaces.rankit_Interfaz

import appModels.RankITAppModel
import dummyData.RankITDummy
import org.uqbar.arena.Application

class RankITApplication extends Application {

	override protected createMainWindow() {
		val rankit = new RankITDummy().getRankit
		val model = new RankITAppModel(rankit)

		new Menu(this, model)

	}

	def static void main(String[] args) {
		new RankITApplication().start()
	}

}
