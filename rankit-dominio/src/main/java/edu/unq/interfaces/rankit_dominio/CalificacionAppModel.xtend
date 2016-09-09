package edu.unq.interfaces.rankit_dominio

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Observable
@Accessors
class CalificacionAppModel {
	
	AdmCalificaciones administradorCalificacion;
	Calificacion calificacionSeleccionada;
	Usuario usuarioLogeado
	List<Puntuable> lugares;
	List<Puntuable> servicios;
	
		
	new(AdmCalificaciones calificaciones, List<Puntuable> lugares, List<Puntuable> servicios,Usuario usuario) {
	administradorCalificacion = calificaciones
	this.lugares=lugares
	this.servicios=servicios
	usuarioLogeado=	usuario
	}
	
	def getListaPuntuables(){
		val nuevaLista= newArrayList
		nuevaLista.addAll(lugares)
		nuevaLista.addAll(servicios)
		nuevaLista
	}
	
}