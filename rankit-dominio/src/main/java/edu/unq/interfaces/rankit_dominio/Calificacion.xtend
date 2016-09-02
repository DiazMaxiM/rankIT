package edu.unq.interfaces.rankit_dominio

import org.joda.time.DateTime
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Calificacion {
	private int puntos
	private DateTime fecha
	private boolean contenidoOfensivo
	private String detalle
	private Puntuable evaluado 
	
	new(Usuario usuario){
		this.contenidoOfensivo=false
		this.detalle="prueba"
		this.fecha=new DateTime 
		this.puntos=0
		this.evaluado=null
	}
	def boolean esCalificacionOfensiva() {
		contenidoOfensivo.equals(true)
	}
	def void marcarComoContenidoOfensivo(){
	    contenidoOfensivo=true  
	}
	def boolean sinDescripcion() {
		detalle.equals("prueba")
	}
	def void darPuntosALaCalificacion(int puntos){
		this.puntos=puntos
	}
	def void indicarElDetalleDeLaCalificacion(String detalle){
		this.detalle=detalle
	}	
	def  void indicarEvaluado(Puntuable evaluado){
		this.evaluado=evaluado 
	}
}