package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import java.util.Date
import java.util.List

@Observable
@Accessors

class UsuarioAppModel implements GenericaAppModel
{   
	
	private AdmUsuarios administradorDeUsuarios
	private Usuario itemSeleccionado
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
	
	override eliminar() 
	{
		administradorDeUsuarios.eliminarUsuario(itemSeleccionado)
		avisarModificacionesDeUsuarios
		itemSeleccionado = null
	}
	
	override blanquearContrasenha()
	{
		administradorDeUsuarios.blanquearContrasenha(itemSeleccionado)
	}
	
	override buscar() 
	{   
		administradorDeUsuarios.buscarUsuarioDeNombre(nombreDeUsuarioABuscar)
//		var List<Usuario> resultado = administradorDeUsuarios.buscarUsuarioDeNombre(nombreDeUsuarioABuscar)
		ObservableUtils.firePropertyChanged(this, "usuarios", usuarios)
//		//return resultado
	}
	
	/** 
	 * No es necesario 
	 * */
	def void setNombreABuscar(String nombre) 
	{
		nombreDeUsuarioABuscar = nombre
		administradorDeUsuarios.buscarUsuarioDeNombre(nombreDeUsuarioABuscar)
		ObservableUtils.firePropertyChanged(this, "usuarios", usuarios)
	}
	
	override nuevo() 
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
	    ObservableUtils.firePropertyChanged(this, "labelValor1", labelValor1)
		ObservableUtils.firePropertyChanged(this, "labelValor2", labelValor2)
		ObservableUtils.firePropertyChanged(this, "labelValor3", labelValor3)
		ObservableUtils.firePropertyChanged(this, "labelValor4", labelValor4)
	}

@Dependencies("itemSeleccionado")
	def String getNombre() 
	{
		if (hayItemSeleccionado) itemSeleccionado.nombre else ""
	}
	
@Dependencies("itemSeleccionado")
	def void setNombre(String nombreIngresado) 
	{
		itemSeleccionado.cambiarNombre(nombreIngresado)
		ObservableUtils.firePropertyChanged(this, "usuarios", usuarios)
	}
	
@Dependencies("itemSeleccionado")
	def boolean getHayItemSeleccionado()
	{
		itemSeleccionado!=null
	}
	
	def Date getFechaDeLaUltimaPublicacion ()
	{
		if (hayItemSeleccionado)
		{
			//administradorDeCalificaciones.fechaDeLaUltimaPublicacionDe(usuarioSeleccionado)
		}
	}
 @Dependencies("itemSeleccionado")  
	def boolean  getHayItemSeleccionadoConNombre(){
		!itemSeleccionado.isNoTieneNombre
	}
@Dependencies("itemSeleccionado")
	def getActivo() 
	{
		if (hayItemSeleccionado) itemSeleccionado.activo
	}
	
@Dependencies("itemSeleccionado")
	def void setActivo(boolean bool) 
	{
		if (itemSeleccionado.esInactivo)
		{
			itemSeleccionado.activarUsuario
		}
		else
		{
			itemSeleccionado.inactivarUsuario
		}
		avisarModificacionesDeUsuarios()
	}

@Dependencies("itemSeleccionado")
	def getBaneado() 
	{
		if (hayItemSeleccionado) itemSeleccionado.baneado
	}
		
@Dependencies("itemSeleccionado")
	def void setBaneado(boolean bool) 
	{
		itemSeleccionado.baneado = bool
		itemSeleccionado.activo = false
		avisarModificacionesDeUsuarios()
	}

@Dependencies("itemSeleccionado")
	def getFechaDeRegistroDelUsuario()
	{
		if (hayItemSeleccionado) itemSeleccionado.fechaDeRegistro
	}

@Dependencies("itemSeleccionado")
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
	
	override getLabelNombre1() {
		"Usuarios Registrados:"
	}
	
	override getLabelValor1() {
		cantidadDeUsuariosRegistrados.toString
	}
	
	override getLabelNombre2() {
		"Activos:"
	}
	
	override getLabelValor2() {
		cantidadDeUsuariosActivos.toString
	}
	
	override getLabelNombre3() {
		"Inactivos:"
	}
	
	override getLabelValor3() {
		 cantidadDeUsuariosInactivos.toString
	}
	
	
	override getLabelNombre4() {
		"Baneados:"
	}
	
	override getLabelValor4() {
		cantidadDeUsuariosBaneados.toString
	}
	
	
	override tituloContenedorBusqueda() {
		"Usuarios"
	}
	
	override textoPrimerParametroDeBusqueda() {
		"Busqueda Por nombre de Usuario"
	}
	
	override getPrimerParametroDeBusqueda() {
		 nombreDeUsuarioABuscar
	}
	
	def void setPrimerParametroDeBusqueda(String nombre) {
	    nombreDeUsuarioABuscar = nombre
	}
	
	override textoSegundoParametroDeBusqueda() {
	}
	
	override getSegundoParametroDeBusqueda() {
		
	}
	
	
	override getElementosNecesariosParaAdmCalificacionWindow() {
		var CalificacionAppModel calificacionAppModel=new CalificacionAppModel(administradorDeCalificaciones,usuarioLogeado)
		.filtradoObligatorioPorUsuario(itemSeleccionado)
		calificacionAppModel
	}
	

}
