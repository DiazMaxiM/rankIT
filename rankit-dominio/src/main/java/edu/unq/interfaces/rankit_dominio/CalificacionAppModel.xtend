package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Dependencies

@Observable
@Accessors
class CalificacionAppModel {
	
	AdmCalificaciones administradorCalificacion;
	Calificacion calificacionSeleccionada;
	Usuario usuarioLogeado;
	AdmPuntuables admPuntuables;
	String nombreUsuarioBusqueda;
	String nombreEvaluadoBusqueda;

	new(AdmCalificaciones calificaciones, AdmPuntuables puntuables,Usuario usuario) {
	administradorCalificacion = calificaciones
	admPuntuables= puntuables
	usuarioLogeado=	usuario
	}
	@Dependencies("calificacionSeleccionada")
	def getPuntos(){
		if (hayCalificacionSeleccionada){
			return calificacionSeleccionada.puntos
		}
		""
	}
	def setPuntos(Integer numero){
		var Integer valor=0;
		if (numero != null)
		{
			valor=numero
		}
		 calificacionSeleccionada.puntos=valor
	}
	
	def actualizarLista(){
		listaCalificacionesFiltradas
}
	def setNombreUsuarioBusqueda(String nombre){
		nombreUsuarioBusqueda= nombre
		ObservableUtils.firePropertyChanged(this,"listaCalificacionesFiltradas",listaCalificacionesFiltradas)		
	}
	def setNombreEvaluadoBusqueda(String nombre){
		nombreEvaluadoBusqueda= nombre
		ObservableUtils.firePropertyChanged(this,"listaCalificacionesFiltradas",listaCalificacionesFiltradas)		
	}
	def listaCalificacionesFiltradas(){
	
		administradorCalificacion.listaCalificaciones.filter
		[calificacion |
		
		(isNombreEvaluadoVacio && isNombreUsuarioVacio)
		||
		(( !isNombreUsuarioVacio && isNombreEvaluadoVacio) && calificacion.usuario.nombre.equals(nombreUsuarioBusqueda))
		||
		(( isNombreUsuarioVacio && !isNombreEvaluadoVacio)  && calificacion.evaluado.nombre.equals(nombreEvaluadoBusqueda))
		||
		(( !isNombreUsuarioVacio && !isNombreEvaluadoVacio ) && 
		(calificacion.evaluado.nombre.equals(nombreEvaluadoBusqueda)
		&& calificacion.usuario.nombre.equals(nombreUsuarioBusqueda)))
				
	].toList
	
	}
	def isNombreEvaluadoVacio(){
		nombreEvaluadoBusqueda == null || nombreEvaluadoBusqueda ==""
	}
	def isNombreUsuarioVacio(){
		nombreUsuarioBusqueda == null || nombreUsuarioBusqueda ==""
	}
	
	def void setCalificacionSeleccionada(Calificacion calificacionSel){
		calificacionSeleccionada = calificacionSel
		if (calificacionSel!=null){
		ObservableUtils.firePropertyChanged(this,"contenidoOfensivo",contenidoOfensivo)		}		
	}
	def Boolean getContenidoOfensivo(){
		calificacionSeleccionada.contenidoOfensivo
	}

	def void setContenidoOfensivo(Boolean bool){
		calificacionSeleccionada.contenidoOfensivo = bool
		actualizarEstadoSituacion
	}
	@Dependencies("calificacionSeleccionada")
	def Boolean getHayCalificacionSeleccionada(){
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
	ObservableUtils.firePropertyChanged(this,"puntos",puntos)
	ObservableUtils.firePropertyChanged(this,"listaCalificacionesFiltradas",listaCalificacionesFiltradas)
	ObservableUtils.firePropertyChanged(this,"calificacionesRegistradas",calificacionesRegistradas)
	ObservableUtils.firePropertyChanged(this,"calificacionesOfensivas",calificacionesOfensivas)	
	}
}