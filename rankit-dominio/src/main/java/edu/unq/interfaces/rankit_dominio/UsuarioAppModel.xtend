package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.unq.interfaces.rankit_dominio.Usuario
import org.uqbar.commons.utils.Dependencies

@Observable
@Accessors

class UsuarioAppModel 
{
	private AdmUsuarios administradorDeUsuarios
	private Usuario usuarioSeleccionado
	private AdmCalificaciones administradorDeCalificaciones
	private String nombreDeUsuarioABuscar
	
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
		administradorDeUsuarios.eliminarUsuario(usuarioSeleccionado)
	}
	
	def void blanquearContrasenha()
	{
		administradorDeUsuarios.blanquearContrasenha(usuarioSeleccionado)
	}
//	
//	def agregarUsuario(Usuario usuarioNuevo) 
//	{
//		administradorDeUsuarios.agregarUsuarioNuevo(usuarioNuevo)
//	}
	
	def buscarPorNombreDeUsuario() 
	{
		administradorDeUsuarios.buscarUsuarioDeNombre(nombreDeUsuarioABuscar)
	}
	
	def agregarNuevoUsuario() 
	{
		//administradorDeUsuario.
	}
	
	@Dependencies("usuarioSeleccionado")

	def hayUsuarioSeleccionado()
	{
		usuarioSeleccionado!=null
	}
	
	def fechaDeLaUltimaPublicacion ()
	{
		//administradorDeCalificaciones.fechaDeLaUltimaPublicacionDe(usuarioSeleccionado)
		// fechaDeLaUltimaPublicacionDe (implementacion de AdmCalificacion)
	}
	
	def publicacionesDelUsuario() 
	{
		//administradorDeCalificaciones.publicacionesDelUsuario(usuarioSeleccionado)
		// publicacionesDelUsuario (implementacion de AdmCalificacion)
	}

}
