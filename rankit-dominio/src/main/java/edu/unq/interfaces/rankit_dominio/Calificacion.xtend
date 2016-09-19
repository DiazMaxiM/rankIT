package edu.unq.interfaces.rankit_dominio

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Calificacion {
	private int puntos
	private Date fecha
	private boolean contenidoOfensivo
	private String detalle
	private Puntuable evaluado 
	private Usuario usuario
	
	new(Usuario usuario){
		this.contenidoOfensivo=false
		this.detalle=""
		this.fecha=new Date() 
		this.puntos=0
		this.evaluado= new PuntuableNull()
		this.usuario = usuario
	}

	
	def isPuntuableBuscado(Puntuable puntuable) {
	   evaluado.esIgual(puntuable)
	}
	
}