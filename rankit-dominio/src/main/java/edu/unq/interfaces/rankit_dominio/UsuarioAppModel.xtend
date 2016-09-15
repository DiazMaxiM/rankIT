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
	private Usuario usuarioLogeado
	private AdmCalificaciones administradorDeCalificaciones
	
	private AdmPuntuables admDePuntuables
	
	new (AdmUsuarios admUsuarios,AdmCalificaciones administradorDeCalificaciones,AdmPuntuables admPuntuables,Usuario usuarioLogeado)
	{
		this.admDePuntuables= admPuntuables
		this.administradorDeUsuarios= admUsuarios
		this.administradorDeCalificaciones= administradorDeCalificaciones
		this.usuarioLogeado= usuarioLogeado
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
