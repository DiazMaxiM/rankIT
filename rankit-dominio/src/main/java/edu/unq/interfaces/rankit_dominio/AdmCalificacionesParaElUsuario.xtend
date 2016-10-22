package edu.unq.interfaces.rankit_dominio

import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class AdmCalificacionesParaElUsuario {
	
	AdmCalificaciones admCalificaciones
	List<CalificacionDelUsuario>calificaciones=new ArrayList
	new(AdmCalificaciones calificaciones) {
		this.admCalificaciones=calificaciones
	}
	
	
	
	def void crearCalificaciones(List<PuntuablesBasicos> basicos, Usuario usuario) {
		  var calificacionesDelUsuario=admCalificaciones.publicacionesDeUnUsuario(usuario.nombre)
		  var calificacionesResultantes=new ArrayList
		   for(calificacion:calificacionesDelUsuario){
		   	   var puntuableBasico=basicos.findFirst[puntuable|puntuable.nombre.equals(calificacion.evaluado.nombre)]
		   	   var promedioDelPuntuable= admCalificaciones.ratingPromedio(puntuableBasico)
		   	   var calificacionResultante=new CalificacionDelUsuario(puntuableBasico,promedioDelPuntuable,calificacion.detalle,calificacion.puntos,calificacion.id)
		   	   calificacionesResultantes.add(calificacionResultante)
		   }
		      calificaciones=calificacionesResultantes
		   }
	
		
}