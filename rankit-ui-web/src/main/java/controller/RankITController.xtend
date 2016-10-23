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
import edu.unq.interfaces.rankit_dominio.AdmCalificacionesParaElUsuario
import edu.unq.interfaces.rankit_dominio.AdmPuntuablesBasicos

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
			ok('{"id":' + this.rankit.admUsuarios.validarUsuario(usuario)+'}')
		} catch (UsuarioNoExistenteException e) {
			notFound('{ "error": "El usuario no esta registrado en Rank-IT" }')
		} catch (PasswordIncorrectoException e) {
			badRequest('{ "error": "La password ingresada no es correcta" }')
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
		} 
	}
	
	protected def Calificacion getCalificacionFromJSON(String body) {
		var JsonObject object = Json.parse(body).asObject();
		var String evaluado = object.get("evaluado").toString;
		var String puntos = object.get("puntos").toString;
		var String detalle = object.get("detalle").asString;
		var String usuario=object.get("usuario").toString;
		val id = Integer.valueOf(usuario);
		var Usuario usuarioLogeado=rankit.admUsuarios.usuarioConElID(id);
		var PuntuablesBasicos puntuable = new Gson().fromJson(evaluado, typeof(PuntuablesBasicos));
		var calificacion =new Calificacion(puntuable,puntos,detalle,usuarioLogeado)
		calificacion
	}
	
	@Delete("/calificaciones/:id")
	def eliminarCalificacion() {
		response.contentType = "application/json"
		try {
			val iId = Integer.valueOf(id)
			 rankit.admCalificaciones.eliminarCalificacionConLaId(iId)
			ok()
		} catch (NoSeInformaCalificacionException e) {
			badRequest('{"error": "No se informo la calificacion a eliminar"}')
		} catch (NoExisteCalificacionException e) {
			notFound('{"error": "No existe la calificacion a eliminar"}')
		}
	}

	@Get("/calificaciones/:id")
	def getCalificacionesDelUsuario() {
		response.contentType = "application/json"
		var AdmCalificacionesParaElUsuario admCalificacionesParaElUsuario=new AdmCalificacionesParaElUsuario(rankit.admCalificaciones)
		val iId = Integer.valueOf(id)
		var usuarioLogeado= rankit.admUsuarios.usuarioConElID(iId)
		var List<PuntuablesBasicos> lista = this.rankit.admLugares.getPuntuablesBasicos(TipoDePuntuable.LUGAR)
		lista.addAll(this.rankit.admServicios.getPuntuablesBasicos(TipoDePuntuable.SERVICIO))
		admCalificacionesParaElUsuario.crearCalificaciones(lista,usuarioLogeado)
		ok(admCalificacionesParaElUsuario.calificaciones.toJson)
	}

	
	
	
	protected def Calificacion getCalificacionActualizadaFromJSON(String body) {
		var JsonObject object = Json.parse(body).asObject();
		var String evaluado = object.get("evaluado").toString
		var String puntos = object.get("puntos").toString;
		var String detalle = object.get("detalle").asString;
		var String id = object.get("id").toString
		
		val iId = Integer.valueOf(id)
		var PuntuablesBasicos puntuable = new Gson().fromJson(evaluado, typeof(PuntuablesBasicos));
		var calificacion =new Calificacion(puntuable,puntos,detalle,iId)
		calificacion
	}
	
    @Put("/calificaciones")
	def editarCalificacion(@Body String body) {
		response.contentType = "application/json"
		try {
			var calificacion = getCalificacionActualizadaFromJSON(body);
			this.rankit.admCalificaciones.modificarCalificacion(calificacion)
			ok()

		} catch (CalificacionIncompletaException e) {
			badRequest('{ "error": "La calificacion esta incompleta" }')
			
		} catch (NoExisteCalificacionException e) {
			notFound('{ "error": "No se encuentra la calificacion" }')
		}

	}

	
}
