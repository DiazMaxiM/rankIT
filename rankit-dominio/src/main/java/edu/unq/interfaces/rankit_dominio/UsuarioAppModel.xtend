package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.unq.interfaces.rankit_dominio.Usuario
import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.model.ObservableUtils

@Observable
@Accessors

class UsuarioAppModel 
{
	private AdmUsuarios administradorDeUsuarios
	private Usuario usuarioSeleccionado
	private AdmCalificaciones administradorDeCalificaciones
	private String nombreDeUsuarioABuscar
	AdmPuntuables administradorDePuntuables
	
	Usuario usuarioLogeado
	
	new (AdmUsuarios admUsuarios,AdmCalificaciones administradorDeCalificaciones,AdmPuntuables admPuntuables,Usuario usuarioLogeado)
	{
		this.administradorDePuntuables= admPuntuables
		this.administradorDeUsuarios= admUsuarios
		this.administradorDeCalificaciones= administradorDeCalificaciones
		this.usuarioLogeado= usuarioLogeado
	}
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
	
	def buscarPorNombreDeUsuario() 
	{
		administradorDeUsuarios.buscarUsuarioDeNombre(nombreDeUsuarioABuscar)
	}
	
	def agregarNuevoUsuario() 
	{
		var usuarioNuevo = new Usuario
		administradorDeUsuarios.agregarUsuarioNuevo(usuarioNuevo)
		avisarCambiosDeNuevoUsuario
	}
	
	
	def void avisarCambiosDeNuevoUsuario() 
	{
		ObservableUtils.firePropertyChanged(this, "inscriptos", usuariosActuales)

	}
	
@Dependencies("usuarioSeleccionado")
	def Usuario[] getUsuariosActuales() 
	{
		administradorDeUsuarios.usuarios
	}
	
@Dependencies("usuarioSeleccionado")
	def String getNombre() 
	{
		usuarioSeleccionado.nombre
	}
	
@Dependencies("usuarioSeleccionado")
	def hayUsuarioSeleccionado()
	{
		usuarioSeleccionado!=null
	}
	
@Dependencies("usuarioSeleccionado")
	def getHayUsarioSeleccionado()
	{
		!usuarioSeleccionado.equals(null)
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
	
@Dependencies("usuarioSeleccionado")
	def boolean getActivo() 
	{
		usuarioSeleccionado.activo
	}	

@Dependencies("usuarioSeleccionado")
	def boolean getBaneado() 
	{
		usuarioSeleccionado.baneado
	}	

}
