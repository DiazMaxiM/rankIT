package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class CalificacionAppModel {
	
	AdmCalificaciones administradorCalificacion;
	Calificacion calificacionSeleccionada;
	Usuario usuarioLogeado
	AdmPuntuables admPuntuables;
	
		
	new(AdmCalificaciones calificaciones, AdmPuntuables puntuables,Usuario usuario) {
	administradorCalificacion = calificaciones
	admPuntuables= puntuables
	usuarioLogeado=	usuario
	}
	
	def void setCalificacionSeleccionada(Calificacion calificacionSel){
		calificacionSeleccionada = calificacionSel
	}
	
	def Boolean getContenidoOfensivo(){
		calificacionSeleccionada.contenidoOfensivo
	
	}
	
	def void setContenidoOfensivo(Boolean bool){
		System.out.println(bool)
		calificacionSeleccionada.contenidoOfensivo = bool
		actualizarEstadoSituacion
	}
	def Boolean isCalificacionSeleccionada(){
		calificacionSeleccionada != null
	}	
	
	def int getCalificacionesRegistradas(){
		administradorCalificacion.getCalificacionesRegistradas()
	}
	def int getCalificacionesOfensivas(){
 		administradorCalificacion.getCalificacionesOfensivas()
	}
	
	def eliminarCalificacionSeleccionada()
	{
	administradorCalificacion.eliminarCalificacion(calificacionSeleccionada)
	actualizarEstadoSituacion
	}

	def agregarCalificacion(Calificacion nuevaCalificacion){
		administradorCalificacion.agregarCalificacion(nuevaCalificacion)
		actualizarEstadoSituacion
	}
	
	def actualizarEstadoSituacion(){
	ObservableUtils.firePropertyChanged(this,"calificacionesRegistradas",calificacionesRegistradas)
	ObservableUtils.firePropertyChanged(this,"calificacionesOfensivas",calificacionesOfensivas)	
	}
}