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
	
	def void agregarUsuarioNuevo(Usuario usuarioNuevo) 
	{
		usuarios.add (usuarioNuevo)
	}
	
	def void eliminarUsuario(Usuario usuarioAEliminar) 
	{
		usuarios.remove(usuarioAEliminar)
	}
	
	def void blanquearContrasenha(Usuario usuarioABlanquear) 
	{
		usuarioABlanquear.blanqueoDeContrasenha
	}
	
	def cantidadTotalDeUsuarios()
	{
		usuarios.size()
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
		usuariosInactivos.size
	}
	
	def usuariosInactivos() 
	{
		usuarios.filter[usuario | usuario.esInactivo].toList
	}
	
	def cantidadTotalDeUsuariosBaneados() 
	{
		usuariosBaneados.size
	}
	
	def usuariosBaneados() 
	{
		getUsuarios.filter[usuario | usuario.baneado].toList
	}
	
	def buscarUsuarioDeNombre (String nombreABuscar) 
	{
		if (tieneNombre(nombreABuscar))
		{
			usuarios.filter[usuario | usuario.deNombre(nombreABuscar)].toList			
		}
		
		else
		{
			usuarios
		}
	}
	
	def tieneNombre(String nombre) 
	{
		nombre!=""
	}
	
}