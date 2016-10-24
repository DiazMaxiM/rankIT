package edu.unq.interfaces.rankit_dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class AdmUsuarios {
	private List<Usuario> usuarios = new ArrayList<Usuario>()
	private int secuenciaId=1
	/**
	 * PROPÓSITO: Agrega un usuario especificado por parámetro.
	 * @param usuarioNuevo: Es el usuario nuevo a agregar.
	 */
	def void agregarUsuario() {
		var usuarioNuevo = new Usuario
		agregarUsuario(usuarioNuevo)
	}

	def agregarUsuario(Usuario usuarioNuevo) {
		usuarioNuevo.id =secuenciaId
		secuenciaId+=1
		usuarios.add(usuarioNuevo)
	}

	/**
	 * PROPÓSITO: Elimina el usuario especificado por parámetro.
	 * @param usuarioAEliminar: Es el usuario a eliminar.
	 */
	def void eliminarUsuario(Usuario usuarioAEliminar) {
		usuarios.remove(usuarioAEliminar)
	}

	/**
	 * PROPÓSITO: Blanquea la contraseña de un usuario en específico.
	 * @param usuarioABlanquear: Es el usuario al que se le blanqueará la contraseña.
	 */
	def void blanquearContrasenha(Usuario usuarioABlanquear) {
		usuarioABlanquear.blanqueoDeContrasenha
	}

	/**
	 * PROPÓSITO: Retorna la cantidad total de usuarios registrados.
	 */
	def int cantidadTotalDeUsuarios() {
		usuarios.size()
	}

	/**
	 * PROPÓSITO: Retorna todos los usuarios con que estén activos.
	 */
	def usuariosActivos() {
		usuarios.filter[usuario|usuario.activo].toList
	}

	/**
	 * PROPÓSITO: Retorna la cantidad total de usuarios activos.
	 */
	def cantidadTotalDeUsuariosActivos() {
		usuariosActivos.size
	}

	/**
	 * PROPÓSITO: Retorna la cantidad total de usuarios inactivos.
	 */
	def cantidadTotalDeUsuariosInactivos() {
		usuariosInactivos.size
	}

	/**
	 * PROPÓSITO: Retorna todos los usuarios que estén inactivos.
	 */
	def usuariosInactivos() {
		usuarios.filter[usuario|usuario.esInactivo].toList
	}

	/**
	 * PROPÓSITO: Retorna la cantidad total de usuarios baneados.
	 */
	def cantidadTotalDeUsuariosBaneados() {
		usuariosBaneados.size
	}

	/**
	 * PROPÓSITO: Retorna todos los usuarios que estén baneados.
	 */
	def usuariosBaneados() {
		getUsuarios.filter[usuario|usuario.baneado].toList
	}

	/**
	 * PROPÓSITO: Retorna todos los usuarios que tengan el nombre especificado.
	 * @param nombreABuscar: Es el nombre de usuario con el que se aplicará el filtro.
	 * NOTA: En el caso de que el nombreABuscar esté vacio, devuelve todos los usuarios.
	 */
	def buscarUsuarioDeNombre(String nombreABuscar) {
		if(nombreABuscar.empty) usuarios else usuariosDeNombre(nombreABuscar)
	}

	private def usuariosDeNombre(String nombreABuscar) {
		usuarios.filter[usuario|usuario.deNombre(nombreABuscar)].toList
	}

	def void cambiarNombreSiPuede(Usuario usuario, String nombreNuevo) {
		if (esUnNombreValido(nombreNuevo)) {
			usuario.cambiarNombre(nombreNuevo)
		}
	}

	private def boolean esUnNombreValido(String nombreNuevo) {
		! noEsNombreValido(nombreNuevo)
	}

	private def boolean noEsNombreValido(String nombreNuevo) {
		hayNombreRepetido(nombreNuevo) || nombreInvalido(nombreNuevo) || (noTieneNombre(nombreNuevo))
	}

	private def hayNombreRepetido(String nombreAComparar) {
		var boolean respuesta = cantidadDeUsuariosDeNombre(nombreAComparar) >= 1

		if (respuesta) {
			throw new UserException("El nombre ya esta siendo usado")
		}
		respuesta
	}

	private def int cantidadDeUsuariosDeNombre(String nombreAComparar) {
		usuariosDeNombre(nombreAComparar).size
	}

	private def nombreInvalido(String nombre) {
		var boolean respuesta = nombre == "NN"
		if (respuesta) {
			throw new UserException("El nombre ingresado no está permitido")
		}
		respuesta
	}

	private def noTieneNombre(String nombre) {
		var boolean respuesta = nombre.empty
		if (respuesta) {
			throw new UserException("Por favor, ingrese un nombre")
		}
		respuesta
	}

	def int validarUsuario(Usuario usuarioALogear) {
		var usuario = usuarios.findFirst[usuario|usuario.nombre.equals(usuarioALogear.nombre)]
		if (!(usuario==null)) {
			if (usuario.password.equals(usuarioALogear.password)) {
				return devolverIdDelUsuario(usuario)
			} else {
				throw new PasswordIncorrectoException("Password Invalido")
			}
		} else {
				throw new UsuarioNoExistenteException("Usuario Invalido")
			
		}
	}

	
	def int devolverIdDelUsuario(Usuario usuario) {
		usuario.id
	}
     
    def void crearUsuario(Usuario usuario){
    	  var usuarios = usuariosDeNombre(usuario.nombre)
		  if (!usuarios.empty){
		  
		      throw new NombreInvalidoException("Nombre invalido")
			}
    	  this.agregarUsuario(usuario)
    }
	
	
	def Usuario usuarioConElNombre(String nombreUsuario) {
	    var usuario= usuarios.findFirst[usuario|usuario.nombre.equals(nombreUsuario)]
		usuario
	}
	
	def usuarioConElID(String idUsuario) {
		if(idUsuario.contains("null")){
		   throw new UserException("Debe indicar el id del usuario")
		}
		val id= new Integer(idUsuario)
		var usuario= usuarios.findFirst[usuario|usuario.id.equals(id)]
		usuario
	}
	
}
