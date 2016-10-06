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
import edu.unq.interfaces.rankit_dominio.RankIT
import java.util.List
import edu.unq.interfaces.rankit_dominio.PuntuablesBasicos
import edu.unq.interfaces.rankit_dominio.TipoDePuntuable
import edu.unq.interfaces.rankit_dominio.Puntuable
import java.util.ArrayList
import edu.unq.interfaces.rankit_dominio.CalificacionResumida
import edu.unq.interfaces.rankit_dominio.FiltroBusqueda
import edu.unq.interfaces.rankit_dominio.AdmCalificacionesResumidas
import edu.unq.interfaces.rankit_dominio.Calificacion
import edu.unq.interfaces.rankit_dominio.CalificacionIncompletaException

@Controller
class RankITController {
	extension JSONUtils = new JSONUtils
	
	var RankIT rankit

	new(RankIT rankit) {
		this.rankit= rankit
	}

	@Get("/evaluados")
	def getPuntuables() {
		response.contentType = "application/json"
		var List<PuntuablesBasicos> lista =this.rankit.admLugares.getPuntuablesBasicos(TipoDePuntuable.LUGAR)
		lista.addAll(this.rankit.admServicios.getPuntuablesBasicos(TipoDePuntuable.SERVICIO))
		ok(lista.toJson)
	}

	@Post("/usuarios")
	def ingresarUsuario(@Body String body) {
		response.contentType = "application/json"
		try {
			var Usuario usuario = body.fromJson(typeof(Usuario))
			ok(this.rankit.admUsuarios.validarUsuario(usuario).toJson)
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
			this.rankit.admUsuarios.crearUsuario(usuario)
			ok()
			
		} catch (NombreInvalidoException e) {
			badRequest('{ "error": "El Nombre no es valido" }')
		}

	}
	@Get("/ranking")
	def getRanking(String nombre,String tipo,String calificaciones,String ranking) {
		var AdmCalificacionesResumidas admCalificacionesResumidas= new AdmCalificacionesResumidas()
		response.contentType = "application/json"
		
		admCalificacionesResumidas.agregar(this.rankit.admCalificaciones.listarCalificacionesResumidas(this.rankit.admLugares.getPuntuablesBasicos(TipoDePuntuable.LUGAR)))
		admCalificacionesResumidas.agregar(this.rankit.admCalificaciones.listarCalificacionesResumidas(this.rankit.admServicios.getPuntuablesBasicos(TipoDePuntuable.SERVICIO)))
		
		ok(admCalificacionesResumidas.filtrar(nombre,tipo,ranking,calificaciones).toJson)
	}
		@Post("/calificaciones")
	def ingresarCalificacion(@Body String body) {
		response.contentType = "application/json"
		try {
			var Calificacion calificacion = body.fromJson(typeof(Calificacion))
			this.rankit.admCalificaciones.agregarNuevaCalificacionValidada(calificacion)
			ok()
		} catch (CalificacionIncompletaException e) {
			badRequest('{ "error": "La Calificacion se encuentra incompleta" }')
			}
		 catch (UnrecognizedPropertyException exception) {
			badRequest('{ "error": "Algo anda mal" }')
		}

	}
}
