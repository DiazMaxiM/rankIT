package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.unq.interfaces.rankit_dominio.Usuario
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Dependencies

@Observable
@Accessors

class UsuarioAppModel 
{
	AdmUsuarios todosLosUsuarios
	Usuario usuarioSeleccionado
	String  nombreDeUsuarioABuscar = ""
	
	new (AdmUsuarios usuarios)
	{
		setTodosLosUsuarios(usuarios)
	}
	
	def publicacionesDelUsuario() 
	{
        usuarioSeleccionado.getPublicaciones
	}
	
	def buscarPorNombreDeUsuario()
	{
		todosLosUsuarios.buscarUsuarioConNombre(nombreDeUsuarioABuscar)
	}
	
	def cantidadDeUsuariosRegistrados()
	{
		todosLosUsuarios.cantidadTotalDeUsuarios
	}
	
	def cantidadDeUsuariosActivos()
	{
		todosLosUsuarios.cantidadTotalDeUsuariosActivos
	}
	
	def cantidadDeUsuariosInactivos()
	{
		todosLosUsuarios.cantidadTotalDeUsuariosInactivos
	}
	
	def cantidadDeUsuariosBaneados()
	{
		todosLosUsuarios.cantidadTotalDeUsuariosBaneados
	}
	
	def eliminarUsuario() 
	{
		todosLosUsuarios.eliminarUsuario(usuarioSeleccionado)
		// avisarCambiosDeLugares
	}
	
	def void blanquearContrasenha()
	{
		todosLosUsuarios.blanquearContrasenha(usuarioSeleccionado)
		// avisarCambiosDeLugares
	}
	
	def agregarUsuario(Usuario usuarioNuevo) 
	{
		todosLosUsuarios.agregarUsuarioNuevo(usuarioNuevo)
	}
	
	def agregarNuevoUsuario() 
	{
		var usuarioNuevo = new Usuario
		todosLosUsuarios.agregarUsuarioNuevo(usuarioNuevo)
		//avisarCambiosDeLugares
		usuarioNuevo
	}
	
@Dependencies("usuarioSeleccionado")

	def hayUsuarioSeleccionado()
	{
		usuarioSeleccionado!=null
	}

}
