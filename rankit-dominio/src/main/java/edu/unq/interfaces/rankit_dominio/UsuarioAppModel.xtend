package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import java.util.Date
import java.util.List
import java.text.DateFormat

@Observable
@Accessors

class UsuarioAppModel 
{
	private AdmUsuarios administradorDeUsuarios
	private Usuario usuarioSeleccionado
	private AdmCalificaciones administradorDeCalificaciones
	private String nombreDeUsuarioABuscar = ""
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
	
	def int getCantidadDeUsuariosRegistrados()
	{
		administradorDeUsuarios.cantidadTotalDeUsuarios
	}
	
	def int getCantidadDeUsuariosActivos()
	{
		administradorDeUsuarios.cantidadTotalDeUsuariosActivos
	}
	
	def int getCantidadDeUsuariosInactivos()
	{
		administradorDeUsuarios.cantidadTotalDeUsuariosInactivos
	}
	
	def int getCantidadDeUsuariosBaneados()
	{
		administradorDeUsuarios.cantidadTotalDeUsuariosBaneados
	}
	
	def void eliminarUsuario() 
	{
		administradorDeUsuarios.eliminarUsuario(usuarioSeleccionado)
		avisarModificacionesDeUsuarios
		usuarioSeleccionado = null
	}
	
	def void blanquearContrasenha()
	{
		administradorDeUsuarios.blanquearContrasenha(usuarioSeleccionado)
	}
	
	def buscarPorNombreDeUsuario() 
	{
		administradorDeUsuarios.buscarUsuarioDeNombre(nombreDeUsuarioABuscar)
		ObservableUtils.firePropertyChanged(this, "usuarios", usuarios)
	}
	
	def void setNombreABuscar(String nombre) 
	{
		nombreDeUsuarioABuscar = nombre
		administradorDeUsuarios.buscarUsuarioDeNombre(nombreDeUsuarioABuscar)
		ObservableUtils.firePropertyChanged(this, "usuarios", usuarios)
	}
	
	def void agregarNuevoUsuario() 
	{
		var usuarioNuevo = new Usuario
		administradorDeUsuarios.agregarUsuarioNuevo(usuarioNuevo)
		avisarModificacionesDeUsuarios
	}
	
	def void avisarModificacionesDeUsuarios() 
	{
		ObservableUtils.firePropertyChanged(this, "usuarios", usuarios)
		ObservableUtils.firePropertyChanged(this, "cantidadDeUsuariosRegistrados", cantidadDeUsuariosRegistrados)
		ObservableUtils.firePropertyChanged(this, "cantidadDeUsuariosActivos", cantidadDeUsuariosActivos)
		ObservableUtils.firePropertyChanged(this, "cantidadDeUsuariosInactivos", cantidadDeUsuariosInactivos)
		ObservableUtils.firePropertyChanged(this, "cantidadDeUsuariosBaneados", cantidadDeUsuariosBaneados)
		ObservableUtils.firePropertyChanged(this, "baneado", baneado)
		ObservableUtils.firePropertyChanged(this, "activo", activo)
		
	}

@Dependencies("usuarioSeleccionado")
	def String getNombre() 
	{
		if (hayUsuarioSeleccionado)
		{
			usuarioSeleccionado.nombre
		}
		else
		{
			""
		}
	}
	
@Dependencies("usuarioSeleccionado")
	def boolean getHayUsuarioSeleccionado()
	{
		usuarioSeleccionado!=null
	}
	
	def Date getFechaDeLaUltimaPublicacion ()
	{
		//administradorDeCalificaciones.fechaDeLaUltimaPublicacionDe(usuarioSeleccionado)
		// fechaDeLaUltimaPublicacionDe (implementacion de AdmCalificacion)
	}
	
@Dependencies("usuarioSeleccionado")
	def getActivo() 
	{
		if (hayUsuarioSeleccionado)
		{
			usuarioSeleccionado.activo
		}
	}
	
@Dependencies("usuarioSeleccionado")
	def void setActivo(boolean bool) 
	{
		usuarioSeleccionado.activo = bool
		usuarioSeleccionado.desbanearUsuario
		avisarModificacionesDeUsuarios()
	}

@Dependencies("usuarioSeleccionado")
	def getBaneado() 
	{
		if (hayUsuarioSeleccionado)
		{
			usuarioSeleccionado.baneado
		}
	}
		
@Dependencies("usuarioSeleccionado")
	def void setBaneado(boolean bool) 
	{
		usuarioSeleccionado.baneado = bool
		usuarioSeleccionado.activo = false
		avisarModificacionesDeUsuarios()
	}

@Dependencies("usuarioSeleccionado")
	def getFechaDeRegistroDelUsuario()
	{
		if (hayUsuarioSeleccionado)
		{
			usuarioSeleccionado.fechaDeRegistro
		}
	}

@Dependencies("usuarioSeleccionado")
	def List<Usuario> getUsuarios()
	{
		if (hayUsuarioABuscar)
		{
			administradorDeUsuarios.buscarUsuarioDeNombre(nombreDeUsuarioABuscar)
		}
		else 
		{
			administradorDeUsuarios.usuarios
		}
	}
	
	def hayUsuarioABuscar() 
	{
		nombreDeUsuarioABuscar!=""
	}


}
