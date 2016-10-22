package edu.unq.interfaces.rankit_dominio

import java.util.List
import java.util.ArrayList

class AdmCalificacionesParaElUsuario {
	
	AdmCalificaciones admCalificaciones
	
	new(AdmCalificaciones calificaciones) {
		this.admCalificaciones=calificaciones
	}
	
	
	
	def calificaciones(List<PuntuablesBasicos> basicos, Usuario usuario) {
		  var calificacionesDelUsuario=admCalificaciones.publicacionesDeUnUsuario(usuario.nombre)
		  var calificacionesResultantes=new ArrayList
		   for(calificacion:calificacionesDelUsuario){
		   	   var puntuableBasico=basicos.findFirst[puntuable|puntuable.nombre.equals(calificacion.evaluado.nombre)]
		   	   var promedioDelPuntuable= admCalificaciones.ratingPromedio(puntuableBasico)
		   	   var calificacionResultante=new CalificacionDelUsuario(puntuableBasico,promedioDelPuntuable,calificacion.detalle,calificacion.puntos,calificacion.id)
		   	   calificacionesResultantes.add(calificacionResultante)
		   }
		     calificacionesResultantes
		   }
	
	
	
		
}