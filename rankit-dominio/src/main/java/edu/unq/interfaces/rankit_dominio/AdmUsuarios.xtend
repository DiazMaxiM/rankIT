package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.ArrayList

@Observable
@Accessors
class AdmUsuarios 
{
	Usuario[] usuarios = new ArrayList<Usuario>()
	
	def void agregarUsuarioNuevo(Usuario usuarioNuevo) 
	{
		getUsuarios.add (usuarioNuevo)
	}
	
	def void eliminarUsuario(Usuario usuarioAEliminar) 
	{
		getUsuarios.remove(usuarioAEliminar)
	}
	
	def void blanquearContrasenha(Usuario usuarioABlanquear) 
	{
		eliminarUsuario(usuarioABlanquear)
//		usuarioABlanquear.blanquear()
		agregarUsuarioNuevo(usuarioABlanquear)
	}
	
	def cantidadTotalDeUsuarios()
	{
		getUsuarios.size()
	}
	
	def usuariosActivos() 
	{
		getUsuarios.filter[usuario | usuario.activo].toList
	}
	
	def cantidadTotalDeUsuariosActivos() 
	{
		usuariosActivos.size
	}
	
	def cantidadTotalDeUsuariosInactivos() 
	{
	//	usuariosInactivos.size
	}
	
	def usuariosInactivos() 
	{
	//	getUsuarios.filter[usuario | usuario.inactivo].toList
	}
	
	def cantidadTotalDeUsuariosBaneados() 
	{
		usuariosBaneados.size
	}
	
	def usuariosBaneados() 
	{
		getUsuarios.filter[usuario | usuario.baneado].toList
	}
	
}