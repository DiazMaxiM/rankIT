package edu.unq.interfaces.rankit_dominio

import org.joda.time.DateTime

class Usuario {
	private var DateTime fechaDeRegistro
	private var String nombre 
	private var String password
	private boolean activo
	private boolean baneado
	
	new(String nombre, String password) {
		this.fechaDeRegistro= new DateTime
		this.nombre=nombre
		this.password=password
		this.activo=false
		this.baneado=false
		
		
	}
    
    def cambiarNombre(String nombre){
		this.nombre=nombre
	}
    
    def cambiarContrasenha(String contrasenha){
    	this.password=contrasenha 
    }
    
    def void activarUsuario(){
    	activo=true
    }
    
 /**
  * Cuando se banea a un usuario, este queda inactivo 
  */   
    def void banearUsuario(){
    	activo=false
    	baneado=true
    }
    
  /**
  * Cuando se desbanea a un usuario, este queda activo 
  */   
    def void desbanearUsuario(){
    	activo=true
    	baneado=false
    }
	
	def esUsuarioActivo() {
		activo.equals(true)
	}
	
	def esUsuarioInactivo() {
	   activo.equals(false)

	}
	
	def esUsuarioBaneado() {
		baneado.equals(true)
	}
	
	def tieneElMismoNombre(String nombre) {
		this.nombre.equals(nombre)
		
	}
	
	
	def nombreDeUsuario() {
		nombre
	}
    

	 
	 
}