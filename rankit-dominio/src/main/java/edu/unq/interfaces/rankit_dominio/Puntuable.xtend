package edu.unq.interfaces.rankit_dominio

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.UserException

@Accessors 
@Observable
class Puntuable {
	 
	 private var Date fechaDeRegistro 
	 private var String nombre
	 private var boolean habilitado 

/**
 * Constructor de un objeto Puntuable, por defecto cuando se crea esta deshabilitado 
 * y la fecha de registro es la fecha en que se creo 
 */ 
	 new(){
	 	this.fechaDeRegistro=new Date()
	 	this.nombre=""
	 	this.habilitado=false
	 }

	def boolean nombreContieneLasLetras(String letras){
		nombre.contains(letras)
	}
	 
	def void verificarSiTieneNombre(){
		if(noTieneNombre()){
			throw new UserException("Por favor defina un nombre" )
			
		}
	}
	
	def void setHabilitado(boolean bool){
//		if(noTieneNombre){
//			throw new UserException("Por favor defina un nombre antes de habilitar" )
//		}
		habilitado=bool
	}
	
	
	def boolean noTieneNombre() {
		this.nombre.equals("")
	}
	
	def boolean tieneElNombre(String nombre) {
		 this.nombre.equals(nombre)
	}
	
	
	def boolean esIgualA(Puntuable puntuable) {
		this.equals(puntuable)
	}

	
	def tieneNombre() {
		!this.nombre.equals("")
	}
	
}