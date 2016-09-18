package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.ArrayList
import java.util.List

@Observable
@Accessors
class AdmUsuarios 
{
	private List<Usuario> usuarios = new ArrayList<Usuario>()
	
	
	/**
	 * PROPÓSITO: Agrega un usuario especificado por parámetro.
	 * @param usuarioNuevo: Es el usuario nuevo a agregar.
	 */
	def void agregarUsuarioNuevo(Usuario usuarioNuevo) 
	{
		usuarios.add (usuarioNuevo)
	}
	
	/**
	 * PROPÓSITO: Elimina el usuario especificado por parámetro.
	 * @param usuarioAEliminar: Es el usuario a eliminar.
	 */
	def void eliminarUsuario(Usuario usuarioAEliminar) 
	{
		usuarios.remove(usuarioAEliminar)
	}
	
	/**
	 * PROPÓSITO: Blanquea la contraseña de un usuario en específico.
	 * @param usuarioABlanquear: Es el usuario al que se le blanqueará la contraseña.
	 */
	def void blanquearContrasenha(Usuario usuarioABlanquear) 
	{
		usuarioABlanquear.blanqueoDeContrasenha
	}
	
	/**
	 * PROPÓSITO: Retorna la cantidad total de usuarios registrados.
	 */
	def cantidadTotalDeUsuarios()
	{
		usuarios.size()
	}
	
	/**
	 * PROPÓSITO: Retorna todos los usuarios con que estén activos.
	 */
	def usuariosActivos() 
	{
		getUsuarios.filter[usuario | usuario.activo].toList
	}
	
	/**
	 * PROPÓSITO: Retorna la cantidad total de usuarios activos.
	 */
	def cantidadTotalDeUsuariosActivos() 
	{
		usuariosActivos.size
	}
	
	/**
	 * PROPÓSITO: Retorna la cantidad total de usuarios inactivos.
	 */
	def cantidadTotalDeUsuariosInactivos() 
	{
		usuariosInactivos.size
	}
	
	/**
	 * PROPÓSITO: Retorna todos los usuarios que estén inactivos.
	 */
	def usuariosInactivos() 
	{
		usuarios.filter[usuario | usuario.esInactivo].toList
	}
	
	/**
	 * PROPÓSITO: Retorna la cantidad total de usuarios baneados.
	 */
	def cantidadTotalDeUsuariosBaneados() 
	{
		usuariosBaneados.size
	}
	
	/**
	 * PROPÓSITO: Retorna todos los usuarios que estén baneados.
	 */
	def usuariosBaneados() 
	{
		getUsuarios.filter[usuario | usuario.baneado].toList
	}
	
	/**
	 * PROPÓSITO: Retorna todos los usuarios que tengan el nombre especificado.
	 * @param nombreABuscar: Es el nombre de usuario con el que se aplicará el filtro.
	 */
	def buscarUsuarioDeNombre (String nombreABuscar) 
	{
		if (nombreABuscar.empty)
		{
			usuarios
		}
		
		else
		{
			usuarios.filter[usuario | usuario.deNombre(nombreABuscar)].toList			
		}
	}
	
}