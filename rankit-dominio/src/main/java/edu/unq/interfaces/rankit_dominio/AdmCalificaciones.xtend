package edu.unq.interfaces.rankit_dominio

import com.google.common.base.Strings
import java.util.ArrayList
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import excepciones.CalificacionIncompletaException
import excepciones.NoSeInformaCalificacionException
import excepciones.NoExisteCalificacionException

/**
 * @author Maximiliano Diaz
 * 
 * Esta clase administra todas las calificaciones del sistema
 */
@Observable
@Accessors
class AdmCalificaciones {
	List<Calificacion> listaCalificaciones = new ArrayList
	private int secuenciaId=1

	/**
	 * @param nombreEvaluadoBusqueda nombre del evaluado por el que se desea filtrar
	 * @param nombreUsuarioBusqueda nombre del usuario por el que se desea filtrar
	 * @return List<Calificacion> retorna la lista de calificaciones filtradas segun los parametros
	 */
	def filtrarCalificaciones(String nombreEvaluadoBusqueda, String nombreUsuarioBusqueda) {

		if (estaVacio(nombreEvaluadoBusqueda) && estaVacio(nombreUsuarioBusqueda)) {
			return listaCalificaciones
		}
		if (!estaVacio(nombreEvaluadoBusqueda) && estaVacio(nombreUsuarioBusqueda)) {

			return listaCalificaciones.filter [calificacion|
				calificacion.evaluado.nombre.contains(nombreEvaluadoBusqueda) || calificacion.evaluado.nombre.equals("")
			].toList
		}
		if (estaVacio(nombreEvaluadoBusqueda) && !estaVacio(nombreUsuarioBusqueda)) {
			return listaCalificaciones.filter[calificacion|calificacion.usuario.nombre.contains(nombreUsuarioBusqueda)].
				toList
		}
		if (!estaVacio(nombreEvaluadoBusqueda) && !estaVacio(nombreUsuarioBusqueda)) {
			return listaCalificaciones.filter [ calificacion |
				calificacion.usuario.nombre.contains(nombreUsuarioBusqueda) &&
					calificacion.evaluado.nombre.contains(nombreEvaluadoBusqueda)
			].toList
		}

	}

	/**
	 * @return retorna la cantidad de calificaciones
	 */
	def Integer getCalificacionesRegistradas() {
		listaCalificaciones.size
	}

	/**
	 * @return retorna la cantidad de calificaciones ofensivas
	 */
	def Integer getCalificacionesOfensivas() {
		cantidadCalificacionesOfensivas(listaCalificaciones)
	}

	/**
	 * @param calificacion Calificacion para agregar en el admiminstrador de calificaciones
	 */
	def void agregarCalificacion(Calificacion calificacion) {
		calificacion.id=secuenciaId
		secuenciaId+=1
		listaCalificaciones.add(calificacion)
	}

	/**
	 * @param puntuable Puntuable sobre el cual se desea saber el promedio de calificaciones obtenidas
	 */
	def ratingPromedio(PuntuableAbstracto puntuable) {
		if (!cantidadDeCalificacionesDelPuntuable(puntuable).equals(0)) {
			puntajeDelPuntuable(puntuable) / cantidadDeCalificacionesDelPuntuable(puntuable)
		} else {
			cantidadDeCalificacionesDelPuntuable(puntuable)
		}
	}

	/**
	 * @param puntuable cantidad de calificaciones de un puntuable
	 */
	def cantidadDeCalificacionesDelPuntuable(PuntuableAbstracto puntuable) {
		calificacionesDelPutuable(puntuable).size
	}

	/**
	 * @param calificacion calificacion a eliminar
	 */
	def eliminarCalificacion(Calificacion calificacion) {
		listaCalificaciones.remove(calificacion)
	}

	/**
	 * @param calificacion Calificacion para setear si es ofensiva
	 * @param bool Boolean
	 * 
	 * setea en la calificacion si es o no ofensiva y analiza si debe estar baneado
	 */
	def contenidoOfensivo(Calificacion calificacion, Boolean bool) {
		calificacion.contenidoOfensivo = bool
		analizarEstadoBaneado(calificacion.usuario)
	}

	/**
	 * @param List<Calificacion> lista de calificaciones donde se desea saber la cantidad de calificaciones ofensivas
	 * @return cantidad de calificaciones ofensivas  
	 */
	private def Integer cantidadCalificacionesOfensivas(List<Calificacion> lista) {
		lista.filter[calificacion|calificacion.isContenidoOfensivo].toList.size
	}

	/**
	 * @param Puntuable puntuable del que se desea saber la cantidad total de puntos en todas las calificaciones
	 * @return Integer cantidad total del puntos
	 */
	private def Integer puntajeDelPuntuable(PuntuableAbstracto puntuable) {
		calificacionesDelPutuable(puntuable).fold(0, [acumulador, calificacion|acumulador + calificacion.puntos])
	}

	/**
	 * @param usuario Usuario que realizo la calificacion
	 * 
	 * banea si el usuario tiene mas de 5 calificacion ofensivas
	 */
	private def analizarEstadoBaneado(Usuario usuario) {
		var cantidadCalificacionesOfensivas = cantidadCalificacionesOfensivas(
			filtrarCalificaciones(null, usuario.nombre))
		usuario.banear = (cantidadCalificacionesOfensivas > 5)
	}

	/**
	 * @param data data String
	 * @return Boolean retorna true si es null o empty el string ingresado
	 */
	private def estaVacio(String data) {
		Strings.isNullOrEmpty(data)
	}

	/**
	 * @param Puntuable sobre el que se desea saber la cantidad de calificaciones que tiene
	 */
	private def calificacionesDelPutuable(PuntuableAbstracto puntuable) {
		listaCalificaciones.filter[calificacion|calificacion.evaluado.nombre.equals(puntuable.nombre)].toList
	}

	def Date fechaDeLaUltimaPublicacionDe(Usuario usuario) {
		if(tienePublicaciones(usuario.nombre)) ultimaPublicacionDe(usuario.nombre).fecha
	}

	private def boolean tienePublicaciones(String nombreDeUsuario) {
		listaCalificaciones.exists[calificacion|calificacion.usuario.deNombre(nombreDeUsuario)]
	}

	def List<Calificacion> publicacionesDeUnUsuario(String nombreDeUsuario) {
		listaCalificaciones.filter[calificacion|calificacion.usuario.deNombre(nombreDeUsuario)].toList
	}

	private def Calificacion ultimaPublicacionDe(String nombreDeUsuario) {
		publicacionesDeUnUsuario(nombreDeUsuario).findLast[calificacion|calificacion.usuario.deNombre(nombreDeUsuario)]
	}

	def Integer cantidadDeCalificacionesNoOfensivas() {
		this.getCalificacionesRegistradas - this.calificacionesOfensivas
	}

	def eliminarCalificacionesDelUsuario(Usuario usuario) {
		listaCalificaciones.removeAll(publicacionesDeUnUsuario(usuario.nombre))
	}

	def eliminarCalificacionesDelPuntuable(Puntuable puntuable) {
		listaCalificaciones.removeAll(calificacionesDelPutuable(puntuable))
	}
	
	def List<CalificacionResumida> listarCalificacionesResumidas(List<PuntuablesBasicos> basicos) {
		var listaDeCalificacionesResumida = new ArrayList
		
		for(basico : basicos){
			listaDeCalificacionesResumida.add(new CalificacionResumida(basico,this.ratingPromedio(basico),this.cantidadDeCalificacionesDelPuntuable(basico)))
		}
		listaDeCalificacionesResumida
	}
	
	def void agregarNuevaCalificacionValidada(Calificacion calificacion) {
		if (calificacion.puntos == null || calificacion.detalle.isNullOrEmpty || calificacion.evaluado == null || calificacion.evaluado.nombre == null){
			throw new CalificacionIncompletaException("La Calificacion Esta Incompleta")
			
		}
		agregarCalificacion(calificacion)
	}
	
	def eliminarCalificacionConLaId(Integer id) {
		if (id==null){
			throw new NoSeInformaCalificacionException("No se informo la calificacion a eliminar")
		}
		if (existeCalificacionConId(id)){
			
			var calificacionAEliminar = listaCalificaciones.findFirst[calificacion |calificacion.id.equals(id)]
			println(existeCalificacionConId(id))
		    eliminarCalificacion(calificacionAEliminar)
		}
		else {
			throw new NoExisteCalificacionException("No existe la calificacion a eliminar")
		}
	}
	
	def boolean existeCalificacionConId(Integer id) {
		listaCalificaciones.exists[calificacion | calificacion.id.equals(id)]
	}
	
	
	def void editarCalificacion(Calificacion modificada) {
	    var calificacion= calificacionConElId(modificada.id)
	    calificacion.detalle=modificada.detalle
	    calificacion.evaluado=modificada.evaluado
	    calificacion.puntos =modificada.puntos
	}

   
	
	def Calificacion calificacionConElId(Integer id){
		var calificacion= listaCalificaciones.findFirst[calificacion|calificacion.id.equals(id)]
		calificacion
	}
	
	
	def modificarCalificacion(Calificacion modificada) {
		if(faltanDatosDeLaCalificacion(modificada.evaluado,modificada.puntos,modificada.detalle,modificada.id)){
			throw new CalificacionIncompletaException("La Calificacion esta imcompleta ")
		}
		if(!existeCalificacionConId(modificada.id)){
			throw new NoExisteCalificacionException("No se encuentra la calificacion")
		}
		 editarCalificacion(modificada)
		
	}
	
	def boolean faltanDatosDeLaCalificacion(PuntuableAbstracto evaluado, Integer puntos, String detalle, Integer id) {
		puntos == null || detalle.isNullOrEmpty || evaluado == null || id == null
	}
	
 
	
}
