package controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import edu.unq.interfaces.rankit_dominio.AdmUsuarios
import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import org.uqbar.xtrest.api.annotation.Get

@Controller
class RankITController {
		extension JSONUtils = new JSONUtils
		AdmUsuarios admUsuarios
	    AdmCalificaciones admCalificaciones
        AdmPuntuables admPuntuables
        
       new(AdmUsuarios admUsuarios,AdmCalificaciones admCalificaciones,
       	  AdmPuntuables admPuntuables){
       	  	this.admCalificaciones=admCalificaciones
       	  	this.admUsuarios=admUsuarios
       	  	this.admPuntuables=admPuntuables
       	}
    
    @Get("/puntuables")
     def getPuntuables() {
        response.contentType = "application/json"
        ok(this.admPuntuables.getPuntuables.toJson)
    }
    
    @Get("/puntuables/:id")
    def getLibroById() {
        response.contentType = "application/json"
        try {        	
            var puntuable = this.admPuntuables.getPuntuable(Integer.valueOf(id))
            if (puntuable == null) {
            	notFound('{ "error": "No existe Evaluado con ese id" }')
            } else {
            	ok(puntuable.toJson)
            }
        }
        catch (NumberFormatException ex) {
        	badRequest('{ "error": "El id debe ser un numero entero" }')
        }
    }
} 