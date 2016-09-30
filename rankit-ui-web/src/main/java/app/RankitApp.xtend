package app

import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import edu.unq.interfaces.rankit_dominio.AdmUsuarios
import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.Puntuable
import edu.unq.interfaces.rankit_dominio.Tipo
import org.uqbar.xtrest.api.XTRest
import controller.RankITController

class RankitApp {
	def static void main(String[] args) {
		var admPuntuables = new AdmPuntuables
		var AdmUsuarios admUsuarios
	    var AdmCalificaciones admCalificaciones
	    admPuntuables.agregar(new Puntuable(2,Tipo.SERVICIO,"Metrogas"))
	    admPuntuables.agregar(new Puntuable(3,Tipo.LUGAR,"Freddo"))

        XTRest.startInstance(new RankITController(admUsuarios,admCalificaciones,admPuntuables), 9000)
    }
}