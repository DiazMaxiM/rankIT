package controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import org.uqbar.xtrest.api.annotation.Get

@Controller
class PuntuablesController {
	extension JSONUtils = new JSONUtils
	AdmPuntuables admPuntuables
	
	new(AdmPuntuables admPuntuables) {
		this.admPuntuables = admPuntuables
	}
	
	@Get("/puntuables")
    def getLibros() {
        response.contentType = "application/json"
        ok(this.admPuntuables.getPuntuables.toJson)
    }
	
}