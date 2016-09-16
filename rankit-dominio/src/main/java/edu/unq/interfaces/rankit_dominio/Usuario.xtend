package edu.unq.interfaces.rankit_dominio

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Usuario {
	private var Date fechaDeRegistro
	private var String nombre
	private var String password
	private boolean activo
	private boolean baneado

	new() {
		this.fechaDeRegistro = new Date
		this.nombre = "NN"
		this.password = "123"
		this.activo = false
		this.baneado = false
	}

	def cambiarNombre(String nombre) {
		this.nombre = nombre
	}

	def cambiarContrasenha(String contrasenha) {
		this.password = contrasenha
	}

	/**
	 * Cuando se banea a un usuario, este queda inactivo 
	 */
	def void banearUsuario() {
		activo = false
		baneado = true
	}

	/**
	 * Cuando se desbanea a un usuario, este queda activo 
	 */
	def void desbanearUsuario() {
		activo = true
		baneado = false
	}

	def isNombre(String nombre) {
		this.nombre.equals(nombre)
	}

	def boolean isActivo() {
		activo
	}

	def seLlama(String nombreAComparar) {
		nombre.equals(nombreAComparar)
	}

	def isBaneado() {
		baneado
	}

}
