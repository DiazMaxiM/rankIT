package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.unq.interfaces.rankit_dominio.Usuario

@Observable
@Accessors

class UsuarioAppModel 
{
	private AdmUsuarios administradorDeUsuarios
	private Usuario usuarioSeleccionado
	private CalificacionAppModel administradorDeCalificaciones
	
	new (AdmUsuarios admUsuarios)
	{
		administradorDeUsuarios= admUsuarios
	}
	
	def cantidadDeUsuariosRegistrados()
	{
		administradorDeUsuarios.cantidadTotalDeUsuarios
	}
	
	def cantidadDeUsuariosActivos()
	{
		administradorDeUsuarios.cantidadTotalDeUsuariosActivos
	}
	
	def cantidadDeUsuariosInactivos()
	{
		administradorDeUsuarios.cantidadTotalDeUsuariosInactivos
	}
	
	def cantidadDeUsuariosBaneados()
	{
		administradorDeUsuarios.cantidadTotalDeUsuariosBaneados
	}
	
	def eliminarUsuario() 
	{
		administradorDeUsuarios.eliminarUsuario(getUsuarioSeleccionado)
	}
	
	def abrirVentanaDeCalificaciones()
	{
		// Se pide crear una nueva ventana de calificaciones con el usuario seleccionado como filtro

	}
	
	def void blanquearContrasenha()
	{
		administradorDeUsuarios.blanquearContrasenha(getUsuarioSeleccionado)
	}
	
	def agregarUsuario(Usuario usuarioNuevo) 
	{
		administradorDeUsuarios.agregarUsuarioNuevo(usuarioNuevo)
	}

}
