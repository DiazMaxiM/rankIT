package edu.unq.interfaces.rankit_dominio

import com.google.common.base.Strings
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Calificacion {
	private Integer id
	private Integer puntos
	private Date fecha
	private boolean contenidoOfensivo
	private String detalle
	private PuntuableAbstracto evaluado
	private Usuario usuario


	new(Usuario usuario){
		this.contenidoOfensivo = false
		this.detalle = ""
		this.fecha = new Date()
		this.puntos = 0
		this.evaluado = new PuntuableNull()
		this.usuario = usuario
	}
	new() {
	}
	
	new(PuntuablesBasicos basicos, String puntos, String detalle, Usuario usuario) {
	
	this.evaluado = basicos
	this.puntos= puntos
	this.detalle = detalle
	this.usuario=usuario
	}
	
	new(PuntuableAbstracto basicos,String puntos, String detalle, String id) {
		this.evaluado = basicos
	    this.puntos= puntos
	    this.detalle = detalle
	    this.id=id
	  
	}
	
   def void setId(String id){
   	   if(id.contains("null")){
   	   	 throw new UserException("Debe indicar la el id de la calificacion")
   	   }
   	   this.id=new Integer(id)
   }
	
	def void setPuntos(String valor) {
		
		// TODO : preguntar si esta bien que quite las dobles comillas que vienen de objecto que armo con json.
		
	
		if (valor.contains(",") || valor.contains(".")) {
			throw new UserException("El puntaje debe ser un numero entero")
		}
		if (Strings.isNullOrEmpty(valor)|| valor.contains("null")) {
			throw new UserException("Complete los puntos")
		}
		puntos = new Integer (valor)

	}
   
    
   
	

	
}
