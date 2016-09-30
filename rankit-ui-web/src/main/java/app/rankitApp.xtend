package app

import org.uqbar.xtrest.api.XTRest
import edu.unq.interfaces.rankit_dominio.RankIT
import dummyData.RankITDummy

class rankitApp {


class BibliotecaApp {
	
	def static void main(String[] args) {
		var rankIT = new RankITDummy
		

        XTRest.startInstance(new BibliotecaController(rankIT), 9000)
    }
	
}	
}