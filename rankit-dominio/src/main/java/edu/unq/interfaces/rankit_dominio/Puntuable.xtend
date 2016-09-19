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
	
	def boolean isNombre(String nombre)	{
		this.nombre.equals(nombre)
	}
	def Boolean contieneLasLetras(String letras){
		nombre.contains(letras)
	}
	 
	def void verificarSiTieneNombre(){
		if(isNoTieneNombre()){
			throw new UserException("Por favor defina un nombre" )
			
		}
	}
	
	def isNoTieneNombre() {
		this.nombre.equals("")
	}
	
	def boolean tieneElNombre(String nombre) {
		 this.nombre.equals(nombre)
	}
	
	
	def boolean esIgual(Puntuable puntuable) {
		this.equals(puntuable)
	}

		override equals(Object o){
		if(o!=null && o instanceof Puntuable){
			return this.nombre.equals((o as Puntuable).nombre)
		}
        return false
		
	}
}