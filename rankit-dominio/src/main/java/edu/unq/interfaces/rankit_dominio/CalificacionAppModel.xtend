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
	List<Puntuable> lugares;
	List<Puntuable> servicios;
	
		
	new(AdmCalificaciones calificaciones, List<Puntuable> lugares, List<Puntuable> servicios,Usuario usuario) {
	administradorCalificacion = calificaciones
	this.lugares=lugares
	this.servicios=servicios
	usuarioLogeado=	usuario
	}
	
	def void setCalificacionSeleccionada(Calificacion calificacionSel){
		calificacionSeleccionada = calificacionSel
	}
	
	@Dependencies("calificacionSeleccionada") 
	def Boolean isCalificacionSeleccionada(){
		calificacionSeleccionada != null
	}
	
	
	def getListaPuntuables(){
		val nuevaLista= newArrayList
		nuevaLista.addAll(lugares)
		nuevaLista.addAll(servicios)
		nuevaLista
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