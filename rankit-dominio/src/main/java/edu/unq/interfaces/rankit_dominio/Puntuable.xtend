package edu.unq.interfaces.rankit_dominio

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Puntuable {

	private var Date fechaDeRegistro
	private var boolean habilitado
	private var Integer id
	private var Tipo tipo
    private var String nombre
	/**
	 * Constructor de un objeto Puntuable, por defecto cuando se crea esta deshabilitado 
	 * y la fecha de registro es la fecha en que se creo 
	 */
	new() {
		this.fechaDeRegistro = new Date()
		this.nombre = ""
		this.habilitado = false
	}
	
	new (int id, Tipo tipo,String nombre){
		this.id=id
		this.tipo=tipo
		this.nombre=nombre
		
	}

	def boolean nombreContieneLasLetras(String letras) {
		nombre.contains(letras)
	}

	def void validarSiElPuntuableTieneNombre() {
		if (noTieneNombre()) {
			throw new UserException("Por favor defina un nombre")

		}
	}

	def void setHabilitado(boolean bool) {
		habilitado = bool
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
	def getId(){
		id
	}
	
	def getNombre(){
		nombre
	}
	def getTipo(){
		tipo
	}
	
	def boolean tieneElId(Integer integer) {
		id.equals(integer)
	}

}
