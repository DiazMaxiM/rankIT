package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime

@Accessors 
abstract class Puntuable {
	 
	 private var DateTime fechaDeRegistro 
	 private var String nombre
	 private var boolean habilitado 

/**
 * Constructor de un objeto Puntuable, por defecto cuando se crea esta deshabilitado 
 * y la fecha de registro es la fecha en que se creo 
 */ 
	 new(){
	 	this.fechaDeRegistro=new DateTime
	 	this.nombre=""
	 	this.habilitado=false
	 }
	def boolean isHabiltado(){
		habilitado
	}
	
	def void habilitarPuntuable(){
		this.habilitado=true
	}
	def boolean isNombre(String nombre)	{
		this.nombre.equals(nombre)
	}
}