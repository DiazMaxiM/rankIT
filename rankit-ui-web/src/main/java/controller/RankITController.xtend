package controller

import com.eclipsesource.json.Json
import com.eclipsesource.json.JsonObject
import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import com.google.gson.Gson
import edu.unq.interfaces.rankit_dominio.AdmCalificacionesResumidas
import edu.unq.interfaces.rankit_dominio.Calificacion
import edu.unq.interfaces.rankit_dominio.CalificacionIncompletaException
import edu.unq.interfaces.rankit_dominio.NoExisteCalificacionException
import edu.unq.interfaces.rankit_dominio.NoSeInformaCalificacionException
import edu.unq.interfaces.rankit_dominio.NombreInvalidoException
import edu.unq.interfaces.rankit_dominio.PasswordIncorrectoException
import edu.unq.interfaces.rankit_dominio.PuntuablesBasicos
import edu.unq.interfaces.rankit_dominio.RankIT
import edu.unq.interfaces.rankit_dominio.TipoDePuntuable
import edu.unq.interfaces.rankit_dominio.Usuario
import edu.unq.interfaces.rankit_dominio.UsuarioNoExistenteException
import java.util.List
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.json.JSONUtils

@Controller
class RankITController {
	extension JSONUtils = new JSONUtils

	var RankIT rankit

	new(RankIT rankit) {
		this.rankit = rankit
	}

	@Get("/evaluados")
	def getPuntuables() {
		response.contentType = "application/json"
		var List<PuntuablesBasicos> lista = this.rankit.admLugares.getPuntuablesBasicos(TipoDePuntuable.LUGAR)
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
	def getRanking(String nombre, String tipo, String calificaciones, String ranking) {
		var AdmCalificacionesResumidas admCalificacionesResumidas = new AdmCalificacionesResumidas()
		response.contentType = "application/json"

		admCalificacionesResumidas.agregar(
			this.rankit.admCalificaciones.listarCalificacionesResumidas(
				this.rankit.admLugares.getPuntuablesBasicos(TipoDePuntuable.LUGAR)))
		admCalificacionesResumidas.agregar(
			this.rankit.admCalificaciones.listarCalificacionesResumidas(
				this.rankit.admServicios.getPuntuablesBasicos(TipoDePuntuable.SERVICIO)))

		ok(admCalificacionesResumidas.filtrar(nombre, tipo, ranking, calificaciones).toJson)
	}

	@Post("/calificaciones")
	def ingresarCalificacion(@Body String body) {
		response.contentType = "application/json"
		try {
			var calificacion = getCalificacionFromJSON(body);
			 this.rankit.admCalificaciones.agregarNuevaCalificacionValidada(calificacion)
			ok()
		} catch (CalificacionIncompletaException e) {
			badRequest('{ "error": "La Calificacion se encuentra incompleta" }')
		} catch (UnrecognizedPropertyException exception) {
			badRequest('{ "error": "Algo anda mal" }')
		}
	}
	
	protected def Calificacion getCalificacionFromJSON(String body) {
		var JsonObject object = Json.parse(body).asObject();
		var String evaluado = object.get("evaluado").toString
		var String puntos = object.get("puntos").toString;
		var String detalle = object.get("detalle").toString
		
		
		var PuntuablesBasicos puntuable = new Gson().fromJson(evaluado, typeof(PuntuablesBasicos));
		 var calificacion =new Calificacion(puntuable,puntos,detalle)
		  calificacion
	}

	@Get("/calificaciones")
	def getCalificacionesDelUsuario(String nombreDeUsuario) {
		response.contentType = "application/json"
		var usuarioLogeado= rankit.admUsuarios.usuarioConElNombre(nombreDeUsuario)
		var List<PuntuablesBasicos> lista = this.rankit.admLugares.getPuntuablesBasicos(TipoDePuntuable.LUGAR)
		lista.addAll(this.rankit.admServicios.getPuntuablesBasicos(TipoDePuntuable.SERVICIO))
		ok(rankit.admCalificaciones.calificacionesSimplificadasDelUsuario(nombreDeUsuario,lista,usuarioLogeado).toJson)
	}

	@Delete("/calificaciones")
	def eliminarCalificacion(String idCalificacionAEliminar) {
		response.contentType = "application/json"
		try {
			rankit.admCalificaciones.eliminarCalificacionConLaId(idCalificacionAEliminar)
			ok()
		} catch (NoSeInformaCalificacionException e) {
			badRequest('{"error": "No se informo la calificacion a eliminar"}')
		} catch (NoExisteCalificacionException e) {
			notFound('{"error": "No existe la calificacion a eliminar"}')
		}
	}
	
    @Put("/calificaciones")
	def editarCalificacion(@Body String body) {
		response.contentType = "application/json"
		try {
			var calificacion =  getCalificacionFromJSONParaModificar(body)
			this.rankit.admCalificaciones.modificarCalificacion(calificacion)
			ok()

		} catch (CalificacionIncompletaException e) {
			badRequest('{ "error": "La calificacion esta incompleta" }')
			
		} catch (NoExisteCalificacionException e) {
			notFound('{ "error": "No se encuentra la calificacion" }')
		}

	}
		protected def Calificacion getCalificacionFromJSONParaModificar(String body) {
		var JsonObject object = Json.parse(body).asObject();
		var String evaluado = object.get("evaluado").toString
		var String puntos = object.get("puntos").toString
		var String detalle = object.get("detalle").toString
		var String id = object.get("id").toString
		
		
		var PuntuablesBasicos puntuable = new Gson().fromJson(evaluado, typeof(PuntuablesBasicos));
	    var calificacion =new Calificacion(puntuable,puntos,detalle,id)
		calificacion
	}

	
}
