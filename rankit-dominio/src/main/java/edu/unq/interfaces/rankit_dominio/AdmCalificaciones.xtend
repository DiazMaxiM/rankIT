package edu.unq.interfaces.rankit_dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

/**
 * @author Maximiliano Diaz
 * @version 1.0
 * 
 * Esta clase se encarga de administrar todas las calificaciones realizadas por los distintos
 * usuarios.
 */


@Observable
@Accessors
class AdmCalificaciones {
	private List<Calificacion> listaCalificaciones = new ArrayList

	/**
	 * @param nombreEvaluadoBusqueda Es el nombre del Puntuable evaluado en la calificacion
	 * @param nombreUsuarioBusqueda  Es el nombre del Usuario que realizo la calificacion
	 * @return retorna una lista de calificaciones filtradas por los parametros ingresados
	 * 
	 * Si los parametros son String vacios ("") o null no lo tiene en cuenta en el filtro
	 * 
	 */
	def filtrarCalificaciones(String nombreEvaluadoBusqueda,String nombreUsuarioBusqueda ){
			listaCalificaciones.filter
			[calificacion |			
			(estaVacio(nombreEvaluadoBusqueda)  && estaVacio(nombreUsuarioBusqueda))
			||
			(( !estaVacio(nombreUsuarioBusqueda) && estaVacio(nombreEvaluadoBusqueda)) && calificacion.usuario.nombre.equals(nombreUsuarioBusqueda))
			||
			(( estaVacio(nombreUsuarioBusqueda) && !estaVacio(nombreEvaluadoBusqueda))  && calificacion.evaluado.nombre.equals(nombreEvaluadoBusqueda))
			||
			(( !estaVacio(nombreUsuarioBusqueda) && !estaVacio(nombreEvaluadoBusqueda) ) && 
			(calificacion.evaluado.nombre.equals(nombreEvaluadoBusqueda)
			&& calificacion.usuario.nombre.equals(nombreUsuarioBusqueda)))
					
		].toList
		
	}
	/**
	 * @param data valor al que se desea saber si es nulo o vacio
	 * @return Boolean
	 * 
	 */
	private def estaVacio(String data){
		data == null || data ==""
	}
	/**
	 * @return cantidad de calificaciones registradas 
	 */
	
	def  getCalificacionesRegistradas(){
		listaCalificaciones.size
	}
	/**
	 * @return cantidad de calificaciones ofensivas
	 */
	
	def getCalificacionesOfensivas(){
		cantidadCalificacionesOfensivas(listaCalificaciones)
	}
	
	/**
	 * @param lista de calificaciones
	 * @return Integer cantidad de calificaciones ofensivas de la lista ingresada por parametro
	 */
	
	private def cantidadCalificacionesOfensivas(List<Calificacion> lista){
		lista.filter[calificacion | calificacion.isContenidoOfensivo].toList.size		
	}
	/**
	 * @param calificacion Una Calificacion
	 * 
	 * agrega una calificacion a la lista de calificaciones 
	 */
	
	def void agregarCalificacion( Calificacion calificacion){
		listaCalificaciones.add(calificacion)
	}
	/**
	 * @autor Rosali Zaracho
	 *
	 * TODO: rosali explica tu metodo ratingPromedio
	 */
	
	def ratingPromedio(Puntuable puntuable){  
		if(!cantidadDeCalificacionesDelPuntuable(puntuable).equals(0)) {
	     puntajeDelPuntuable(puntuable)/cantidadDeCalificacionesDelPuntuable(puntuable)
	    }
	    else{
	       cantidadDeCalificacionesDelPuntuable(puntuable)
	    }
	}
	/**
	 * @autor Rosali Zaracho
	 *
	 * TODO: rosali explica tu metodo calificacionesDelPutuable
	 */
	
	def calificacionesDelPutuable(Puntuable puntuable){
		listaCalificaciones.filter[calificacion | calificacion.isPuntuableBuscado(puntuable)] 
	}
	/**
	 * @autor Rosali Zaracho
	 *
	 * TODO: rosali explica tu metodo cantidadDeCalificacionesDelPuntuable
	 */
	
	def cantidadDeCalificacionesDelPuntuable(Puntuable puntuable){
		calificacionesDelPutuable(puntuable).size
	}
	/**
	 * @autor Rosali Zaracho
	 *
	 * TODO: rosali explica tu metodo puntajeDelPuntuable
	 */
	def puntajeDelPuntuable(Puntuable puntuable){
		calificacionesDelPutuable(puntuable).fold(0, [ acumulador, calificacion | acumulador + calificacion.puntos])
	}
	/**
	 * @param calificacion Una Calificacion
	 * 
	 * elimina una Calificacion de la lista de Calificaciones
	 */

	def void eliminarCalificacion( Calificacion calificacion){
		listaCalificaciones.remove(calificacion)
	}
	/**
	 * @param calificaciones Lista de Calificaciones
	 * 
	 * agrega a la lista de calificaciones otra Lista con nuevas calificaciones
	 */
	
	def agregarTodasLasCalificaciones(List<Calificacion>calificaciones){
     	listaCalificaciones.addAll(calificaciones)
    }
	/**
	 * @param calificacion una Calificacion
	 * @param calificacion una Calificacion
	 * 
	 * agrega a la lista de calificaciones otra Lista con nuevas calificaciones
	 */
	
	def contenidoOfensivo(Calificacion calificacion, Boolean bool) {
		calificacion.contenidoOfensivo = bool
		analizarEstadoBaneado(calificacion.usuario)	
	}
	/**
	 * @param usuario Un Usuario
	 * 
	 * actualiza si debe estar baneado un usuario 
	 */
	def private void analizarEstadoBaneado(Usuario usuario) {
		var cantidadCalificacionesOfensivas = cantidadCalificacionesOfensivas(filtrarCalificaciones(null,usuario.nombre))
		usuario.baneado =(cantidadCalificacionesOfensivas > 5)
	}
}


/**
 * TODO: En rankit tiene un mensaje agreagar usuario hay que sacarlo
 */


