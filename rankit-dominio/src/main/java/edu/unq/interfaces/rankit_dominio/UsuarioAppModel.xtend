package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.unq.interfaces.rankit_dominio.Usuario

@Observable
@Accessors

class UsuarioAppModel 
{
	private AdmUsuarios todosLosUsuarios
	private Usuario usuarioSeleccionado
	private AdmCalificaciones administradorDeCalificaciones
	
	new (AdmCalificaciones admCalificaciones,AdmUsuarios admUsuarios)
	{
		this.todosLosUsuarios= admUsuarios
		this.administradorDeCalificaciones =admCalificaciones
	}
//	
//	def cantidadDeUsuariosRegistrados()
//	{
//		getTodosLosUsuarios.cantidadTotalDeUsuarios
//	}
//	
//	def cantidadDeUsuariosActivos()
//	{
//		getTodosLosUsuarios.cantidadTotalDeUsuariosActivos
//	}
//	
//	def cantidadDeUsuariosInactivos()
//	{
//		getTodosLosUsuarios.cantidadTotalDeUsuariosInactivos
//	}
//	
//	def cantidadDeUsuariosBaneados()
//	{
//		getTodosLosUsuarios.cantidadTotalDeUsuariosBaneados
//	}
//	
//	def eliminarUsuario() 
//	{
//		getTodosLosUsuarios.eliminarUsuario(getUsuarioSeleccionado)
//	}
//	
//	def abrirVentanaDeCalificaciones()
//	{
//		// Se pide crear una nueva ventana de calificaciones con el usuario seleccionado como filtro
//
//	}
//	
//	def void blanquearContrasenha()
//	{
//		getTodosLosUsuarios.blanquearContrasenha(getUsuarioSeleccionado)
//	}
//	
//	def agregarUsuario(Usuario usuarioNuevo) 
//	{
//		getTodosLosUsuarios.agregarUsuarioNuevo(usuarioNuevo)
//	}

}
