package edu.unq.interfaces.rankit_dominio

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors 
@Observable
abstract class Puntuable {
	 
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