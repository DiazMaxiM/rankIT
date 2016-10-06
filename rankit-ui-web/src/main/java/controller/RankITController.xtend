package controller

import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import edu.unq.interfaces.rankit_dominio.AdmUsuarios
import edu.unq.interfaces.rankit_dominio.PasswordIncorrectoException
import edu.unq.interfaces.rankit_dominio.Usuario
import edu.unq.interfaces.rankit_dominio.UsuarioNoExistenteException
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Put
import edu.unq.interfaces.rankit_dominio.NombreInvalidoException

@Controller
class RankITController {
	extension JSONUtils = new JSONUtils
	AdmUsuarios admUsuarios
	AdmCalificaciones admCalificaciones
	AdmPuntuables admPuntuables

	new(AdmUsuarios admUsuarios, AdmCalificaciones admCalificaciones, AdmPuntuables admPuntuables) {
		this.admCalificaciones = admCalificaciones
		this.admUsuarios = admUsuarios
		this.admPuntuables = admPuntuables
	}

	@Get("/puntuables")
	def getPuntuables() {
		response.contentType = "application/json"
		ok(this.admPuntuables.getPuntuables.toJson)
	}

	@Post("/usuarios")
	def ingresarUsuario(@Body String body) {
		response.contentType = "application/json"
		try {
			var Usuario usuario = body.fromJson(typeof(Usuario))
			ok(this.admUsuarios.validarUsuario(usuario).toJson)
		} catch (UsuarioNoExistenteException e) {
			notFound('{ "error": "El usuario no esta registrado en Rank-IT" }')
		} catch (PasswordIncorrectoException e) {
			badRequest('{ "error": "La password ingresada no es correcta" }')
		} catch (UnrecognizedPropertyException exception) {
			badRequest('{ "error": "Algo anda mal" }')
		}

	}
	
	@Put("/usuarios")
	def crearUsuario(@Body String body) {
		response.contentType = "application/json"
		try {
			var Usuario usuario = body.fromJson(typeof(Usuario))
			this.admUsuarios.crearUsuario(usuario)
			ok()
			
		} catch (NombreInvalidoException e) {
			badRequest('{ "error": "El Nombre es invalido" }')
		}

	}
}
