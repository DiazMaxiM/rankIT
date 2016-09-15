package edu.unq.interfaces.rankit_dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class AdmCalificaciones {
	List<Calificacion> listaCalificaciones = new ArrayList

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
	private def estaVacio(String data){
		data == null || data ==""
	}

	
	def  getCalificacionesRegistradas(){
		listaCalificaciones.size
	}
	
	def getCalificacionesOfensivas(){
		cantidadCalificacionesOfensivas(listaCalificaciones)
	}
	
	private def cantidadCalificacionesOfensivas(List<Calificacion> lista){
		lista.filter[calificacion | calificacion.isContenidoOfensivo].toList.size		
	}
	
	def agregarCalificacion( Calificacion calificacion){
		listaCalificaciones.add(calificacion)
	}
	
	def ratingPromedio(Puntuable puntuable){  
		if(!cantidadDeCalificacionesDelPuntuable(puntuable).equals(0)) {
	     puntajeDelPuntuable(puntuable)/cantidadDeCalificacionesDelPuntuable(puntuable)
	    }
	    else{
	       cantidadDeCalificacionesDelPuntuable(puntuable)
	    }
	}
	
	def calificacionesDelPutuable(Puntuable puntuable){
		listaCalificaciones.filter[calificacion | calificacion.isPuntuableBuscado(puntuable)].toList
	}
	
	def cantidadDeCalificacionesDelPuntuable(Puntuable puntuable){
		calificacionesDelPutuable(puntuable).size
	}
	
	def puntajeDelPuntuable(Puntuable puntuable){
		calificacionesDelPutuable(puntuable).fold(0, [ acumulador, calificacion | acumulador + calificacion.puntos])
	}

	def eliminarCalificacion( Calificacion calificacion){
		listaCalificaciones.remove(calificacion)
	}

	def agregarTodasLasCalificaciones(List<Calificacion>calificaciones){
     	listaCalificaciones.addAll(calificaciones)
    }
	
	def contenidoOfensivo(Calificacion calificacion, Boolean bool) {
		calificacion.contenidoOfensivo = bool
		analizarEstadoBaneado(calificacion.usuario)	
	}
	
	def analizarEstadoBaneado(Usuario usuario) {
		var cantidadCalificacionesOfensivas = cantidadCalificacionesOfensivas(filtrarCalificaciones(null,usuario.nombre))
		usuario.baneado =(cantidadCalificacionesOfensivas > 5)
	}
}





