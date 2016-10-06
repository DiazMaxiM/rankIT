package edu.unq.interfaces.rankit_dominio

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Usuario {
	private var Date fechaDeRegistro
	private var String nombre
	private var String password
	private boolean activo
	private boolean baneado
	private int id
	new() {
		this.fechaDeRegistro = new Date
		this.nombre = "NN"
		this.password = "123" // Contraseña por dafault
		this.activo = false
		this.baneado = false
	}

	/** 
	 * PROPÓSITO: Cambia el nombre del usuario.
	 * @param nombreNuevo: Es el nuevo nombre que tendrá el usuario.
	 */
	def cambiarNombre(String nombreNuevo) {
		nombre = nombreNuevo
	}

	/**
	 * PROPÓSITO: Cambia la contraseña del usuario.
	 * @param contrasenhaNueva: Es la contraseña nueva que tendrá el usuario.
	 */
	def cambiarContrasenha(String contrasenhaNueva) {
		password = contrasenhaNueva
	}

	/**
	 * PROPÓSITO: Banea al usuario.
	 * NOTA: Cuando se banea a un usuario, este queda inactivo.
	 */
	def void setBanear(boolean bool) {

		if (bool) {
			baneado = true
			inactivarUsuario
		} else
			(
		    desbanearUsuario
				
		)
	}

	/**
	 * PROPÓSITO: Desbanea un usuario.
	 */
	def void desbanearUsuario() {
		baneado = false
	}

	/**
	 * PROPÓSITO: Pregunta si el nombre del usuario es igual a otro especificado por parametro.
	 * @param: nombreAComparar: Es el nombre con el que realizo la comparacion con el del nombre del usuario.
	 */
	def deNombre(String nombreAComparar) {
		nombre.equals(nombreAComparar)
	}

	/**
	 * PROPÓSITO: Cambia el estado activo del usuario.
	 * NOTA : Si el usuario esta baneado, automáticamente, este se desbanea.
	 */
	def setActivo(boolean bool) {
		if (bool) {
			activo = true
			desbanearUsuario
		} else
			(
			inactivarUsuario
				
		)
	}

	/**
	 * PROPÓSITO: Pregunta si el usuario esta baneado.
	 */
	def estaBaneado() {
		baneado
	}

	/**
	 * PROPÓSITO: Pregunta si el usuario esta inactivo.
	 */
	def esInactivo() {
		activo == false
	}

	/**
	 * PROPÓSITO: Blanquea la contraseña del usuario.
	 * NOTA: Blanquear la contraseña es reestablecer la contraseña venida por default.
	 */
	def blanqueoDeContrasenha() {
		password = "123"
	}

	/**
	 * PROPÓSITO: Convierte al usuario en inactivo
	 */
	def void inactivarUsuario() {
		activo = false
	}

	def void setFechaDeRegistro(Date fecha) {
		if (fecha == null) {
			throw new UserException("Debe Ingresar Una Fecha");
		}
		this.fechaDeRegistro = fecha

	}

	/**
	 * PROPÓSITO: Pregunta si el usuario no tiene nombre.
	 * NOTA: Un usuario sin nombre tiene el nombre de "NN".
	 */
	def isNoTieneNombre() {
		nombre.equals("NN")
	}

}
