package edu.unq.interfaces.rankit_dominio

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.utils.Dependencies

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
	
	@Dependencies("calificacionSeleccionada") 
	def Boolean isCalificacionSeleccionada(){
		calificacionSeleccionada != null
	}	
	
	def int getCalificacionesRegistradas(){
		administradorCalificacion.getCalificacionesRegistradas()
	}
	@Dependencies("calificacionesRegistradas") 
	def eliminarCalificacionSeleccionada()
	{
	administradorCalificacion.eliminarCalificacion(calificacionSeleccionada)
	}
	
}