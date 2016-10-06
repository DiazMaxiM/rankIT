package app

import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import edu.unq.interfaces.rankit_dominio.AdmUsuarios
import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.Puntuable
import dummyData.RankITDummy
import org.uqbar.xtrest.api.XTRest
import controller.RankITController

class RankitApp {
	def static void main(String[] args) {
		
        XTRest.startInstance(new RankITController(new RankITDummy().rankit), 9000)
    }
}