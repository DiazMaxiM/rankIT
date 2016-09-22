package edu.unq.interfaces.rankit_dominio

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.UserException
import com.google.common.base.Strings

@Observable
@Accessors
class Calificacion {
	private Integer puntos
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
	def void setPuntos(String valor){
		if (valor.contains(","))
		{
			throw new UserException("El puntaje debe ser un numero entero")
		}		
		if (Strings.isNullOrEmpty(valor))
		{
			throw new UserException("Complete los puntos")
		}
		puntos= Integer.parseInt(valor)
		
	}
	
	
}