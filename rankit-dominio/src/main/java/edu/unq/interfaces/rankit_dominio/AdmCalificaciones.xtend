package edu.unq.interfaces.rankit_dominio

import com.google.common.base.Strings
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

/**
 * @author Maximiliano Diaz
 * 
 * Esta clase administra todas las calificaciones del sistema
 */
@Observable
@Accessors
class AdmCalificaciones {
	List<Calificacion> listaCalificaciones = new ArrayList

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
			return listaCalificaciones.filter[calificacion|calificacion.evaluado.nombre.equals(nombreEvaluadoBusqueda) || calificacion.evaluado.nombre.equals("") ].
				toList
		}
		if (estaVacio(nombreEvaluadoBusqueda) && !estaVacio(nombreUsuarioBusqueda)) {
			return listaCalificaciones.filter[calificacion|calificacion.usuario.nombre.equals(nombreUsuarioBusqueda)].
				toList
		}
		if (!estaVacio(nombreEvaluadoBusqueda) && !estaVacio(nombreUsuarioBusqueda)) {
			return listaCalificaciones.filter [ calificacion |
				calificacion.usuario.nombre.equals(nombreUsuarioBusqueda) &&
					calificacion.evaluado.nombre.equals(nombreEvaluadoBusqueda)
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
		listaCalificaciones.add(calificacion)
	}

	/**
	 * @param puntuable Puntuable sobre el cual se desea saber el promedio de calificaciones obtenidas
	 */
	def ratingPromedio(Puntuable puntuable) {
		if (!cantidadDeCalificacionesDelPuntuable(puntuable).equals(0)) {
			puntajeDelPuntuable(puntuable) / cantidadDeCalificacionesDelPuntuable(puntuable)
		} else {
			cantidadDeCalificacionesDelPuntuable(puntuable)
		}
	}

	/**
	 * @param puntuable cantidad de calificaciones de un puntuable
	 */
	def cantidadDeCalificacionesDelPuntuable(Puntuable puntuable) {
		calificacionesDelPutuable(puntuable).size
	}

	/**
	 * @param calificacion calificacion a eliminar
	 */
	def eliminarCalificacion(Calificacion calificacion) {
		listaCalificaciones.remove(calificacion)
	}

	/**
	 * TODO: NO ENCUENTRO QUIEN HIZO ESTO Y PARA QUE
	 */
//	def agregarTodasLasCalificaciones(List<Calificacion>calificaciones){
//     	listaCalificaciones.addAll(calificaciones)
//    }

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
	private def Integer puntajeDelPuntuable(Puntuable puntuable) {
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
		usuario.baneado = (cantidadCalificacionesOfensivas > 5)
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
	private def calificacionesDelPutuable(Puntuable puntuable) {
		listaCalificaciones.filter[calificacion|calificacion.evaluado.nombre.equals(puntuable.nombre)].toList
	}
}
