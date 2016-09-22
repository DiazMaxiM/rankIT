package appModels

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import java.util.Date
import java.util.List
import edu.unq.interfaces.rankit_dominio.UsuarioNull
import edu.unq.interfaces.rankit_dominio.AdmUsuarios
import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import edu.unq.interfaces.rankit_dominio.Usuario

@Observable
@Accessors

class UsuarioAppModel implements GenericaAppModel
{  
	private edu.unq.interfaces.rankit_dominio.Usuario miUsuarioNull=new UsuarioNull
	private edu.unq.interfaces.rankit_dominio.AdmUsuarios administradorDeUsuarios
	private edu.unq.interfaces.rankit_dominio.Usuario itemSeleccionado=miUsuarioNull
	private edu.unq.interfaces.rankit_dominio.AdmCalificaciones administradorDeCalificaciones
	private String nombreDeUsuarioABuscar = ""
	private edu.unq.interfaces.rankit_dominio.AdmPuntuables administradorDeLugares
	private edu.unq.interfaces.rankit_dominio.AdmPuntuables administradorDeServicios
	edu.unq.interfaces.rankit_dominio.Usuario usuarioLogeado 
	
	new (AdmUsuarios admUsuarios,AdmCalificaciones administradorDeCalificaciones,AdmPuntuables admLugares,AdmPuntuables admServicios,Usuario usuarioLogeado)
	{
		this.administradorDeLugares= admLugares
		this.administradorDeServicios= admServicios
		this.administradorDeUsuarios= admUsuarios
		this.administradorDeCalificaciones= administradorDeCalificaciones
		this.usuarioLogeado= usuarioLogeado
	}

	
	@Dependencies("itemSeleccionado")
	def boolean getHayItemSeleccionado()
	{
		!itemSeleccionado.equals(miUsuarioNull)
	}
	
	
	@Dependencies("itemSeleccionado")  
	def boolean getHayItemSeleccionadoConNombre(){
		!itemSeleccionado.isNoTieneNombre
	}
	
	
@Dependencies("itemSeleccionado")
	def String getNombre() 
	{
		itemSeleccionado.nombre 
	}
	
@Dependencies("itemSeleccionado")
	def void setNombre(String nombreIngresado) 
	{
		administradorDeUsuarios.cambiarNombreSiPuede(itemSeleccionado, nombreIngresado)
		ObservableUtils.firePropertyChanged(this, "nombre",nombre)
	}
	
@Dependencies("itemSeleccionado")
	def getActivo() 
	{
		itemSeleccionado.activo
	}
	
@Dependencies("itemSeleccionado")
	def void setActivo(boolean bool) 
	{
			itemSeleccionado.activo = bool
			
		avisarModificacionesDeUsuarios()
	}

@Dependencies("itemSeleccionado")
	def getBaneado() 
	{
       itemSeleccionado.baneado
	}
		
@Dependencies("itemSeleccionado")
	def void setBaneado(boolean bool) 
	{
	    itemSeleccionado.banear=bool
		avisarModificacionesDeUsuarios()
	}

@Dependencies("itemSeleccionado")
	def getFechaDeRegistroDelUsuario()
	{
	   itemSeleccionado.fechaDeRegistro
	}
	def setFechaDeRegistroDelUsuario(Date fecha)
	{
	   itemSeleccionado.fechaDeRegistro=fecha
	}
@Dependencies("itemSeleccionado")	
	def Date getFechaDeLaUltimaPublicacion ()
	{
		administradorDeCalificaciones.fechaDeLaUltimaPublicacionDe(itemSeleccionado)
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
	
	
	//Vista
	
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
		"Usuarios:"
	}
	
	override textoPrimerParametroDeBusqueda() {
		"Busqueda por nombre de Usuario"
	}
	
	override getPrimerParametroDeBusqueda() {
		 nombreDeUsuarioABuscar
	}
	
	def void setPrimerParametroDeBusqueda(String nombre) {
		itemSeleccionado=miUsuarioNull
	    nombreDeUsuarioABuscar = nombre
	    ObservableUtils.firePropertyChanged(this, "hayItemSeleccionado",hayItemSeleccionado)
	    ObservableUtils.firePropertyChanged(this, "usuarios", usuarios)
	}
	override getSegundoParametroDeBusqueda() {
		""
	}
	
	override textoSegundoParametroDeBusqueda() {
		
	}
	
	override nuevo() {
		administradorDeUsuarios.agregarUsuarioNuevo()
		avisarModificacionesDeUsuarios
	}
	
	override eliminar() {
		administradorDeUsuarios.eliminarUsuario(itemSeleccionado)
		administradorDeCalificaciones.eliminarCalificacionesDelUsuario(itemSeleccionado)
		itemSeleccionado=miUsuarioNull
		avisarModificacionesDeUsuarios
		
	}
	
	override getElementosNecesariosParaAdmCalificacionWindow() {
		var CalificacionAppModel calificacionAppModel=new CalificacionAppModel(administradorDeCalificaciones,administradorDeLugares,administradorDeServicios,itemSeleccionado)
		.filtradoObligatorioPorUsuario(itemSeleccionado)
		calificacionAppModel
	}
	
	override blanquearContrasenha() {
		
	}
	
	def List<Usuario> getUsuarios()
	{
	  administradorDeUsuarios.buscarUsuarioDeNombre(nombreDeUsuarioABuscar)
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
	
	
}
