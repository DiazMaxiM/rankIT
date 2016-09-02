package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
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
	
    def void cambiarNombre(String nuevoNombre){
    	this.nombre=nuevoNombre
    }
  
	def boolean esPuntuableHabiltado(){
		habilitado
	}
	
	def void habilitarPuntuable(){
		this.habilitado=true
	}
  	
	
	def Boolean estaDeshabilitado(){
		habilitado.equals(false)
	}
	
	def Boolean estaHabilitado(){
		habilitado.equals(true)
	}
	
	def Boolean tieneEsteNombre(String nombre){
		this.nombre.equals(nombre)
	}
	
	def void deshabilitarPuntuable(){
		habilitado=false
	}
	
	def Boolean noTieneNombreAsignado(){
		nombre.equals("")
	}
	
	def String nombreDelPuntuable(){
		nombre
	}
	
}