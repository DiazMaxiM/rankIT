package app

import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import org.uqbar.xtrest.api.XTRest
import controller.PuntuablesController
import edu.unq.interfaces.rankit_dominio.Puntuable
import edu.unq.interfaces.rankit_dominio.Tipo

class PuntuablesApp {
	def static void main(String[] args) {
		var admPuntuables = new AdmPuntuables
	    admPuntuables.agregar(new Puntuable(2,Tipo.SERVICIO,"Metrogas"))

        XTRest.startInstance(new PuntuablesController(admPuntuables), 9000)
    }
}