package edu.unq.interfaces.rankit_dominio


import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.model.UserException
import java.util.Date

@Observable
@Accessors
class PuntuableAppModel {
	 AdmPuntuables administradorDePuntuables
	 AdmCalificaciones administradorCalificacion
	 Puntuable    puntuableSeleccionado
	 String  nombreDelLugarBuscado=""
	 String  nombreDelServicioBuscado=""
	
	new(AdmPuntuables adm1, AdmCalificaciones adm2){
		this.administradorDePuntuables= adm1
		this.administradorCalificacion=adm2
		
	}
	@Dependencies("puntuableSeleccionado")
	def setPuntuableSeleccionado(Puntuable seleccionado){
		puntuableSeleccionado = seleccionado
		if(puntuableSeleccionado!=null){
		   ObservableUtils.firePropertyChanged(this,"ratingPromedio",ratingPromedio)
		   ObservableUtils.firePropertyChanged(this,"cantidadDeCalificacionesDelPuntuable",cantidadDeCalificacionesDelPuntuable)
		   ObservableUtils.firePropertyChanged(this,"fechaDeRegistro",fechaDeRegistro) 
		   verificarSiTieneNombreAsignado
		}
		
	}
	
	def setNombreDelLugarBuscado(String nombre){
		 nombreDelLugarBuscado=nombre
		 ObservableUtils.firePropertyChanged(this," buscarPorNombreDeLugar", buscarPorNombreDeLugar)
	}
	
	def setNombreDelServicioBuscado(String nombre){
		 nombreDelServicioBuscado=nombre
		 ObservableUtils.firePropertyChanged(this," buscarPorNombreDeServicio", buscarPorNombreDeServicio)
	}
	
	def nuevoLugar() {
		var lugar = new Lugar
		administradorDePuntuables.agregarLugar(lugar)
		avisarCambiosDeLugares
		lugar
	}
	def eliminarLugar(){
		administradorDePuntuables.eliminarLugar(puntuableSeleccionado)
	 //	puntuableSeleccionado=null
		avisarCambiosDeLugares
	}
	
	def nuevoServicio() {
		var servicio = new Servicio
		administradorDePuntuables.agregarServicio(servicio)
		avisarCambiosDeServicios
		servicio
	}
	
	def eliminarServicio(){
		administradorDePuntuables.eliminarServicio(puntuableSeleccionado)
		avisarCambiosDeServicios
		//puntuableSeleccionado=null
	}
	def getRatingPromedio(){
		administradorCalificacion.ratingPromedio(puntuableSeleccionado)
	}
	def getCantidadDeCalificacionesDelPuntuable(){
		administradorCalificacion.cantidadDeCalificacionesDelPuntuable(puntuableSeleccionado)
	}
	@Dependencies("puntuableSeleccionado")
	def getHayPuntuableSeleccionado(){
		puntuableSeleccionado!=null
	}
	
	def getFechaDeRegistro(){
		puntuableSeleccionado.fechaDeRegistro
	}
	@Dependencies("puntuableSeleccionado")
	def getNombre(){
		puntuableSeleccionado.nombre
	}
    @Dependencies("puntuableSeleccionado")
	def getHabilitado(){
		puntuableSeleccionado.habilitado
	}
	
	@Dependencies("puntuableSeleccionado")
    def void setHabilitado(Boolean bool){
		puntuableSeleccionado.habilitado = bool
		avisarCambiosDeServicios
		avisarCambiosDeLugares
	}
	def getTieneNombreAsignado(){
		puntuableSeleccionado.nombre!=""
	}
	@Dependencies("puntuableSeleccionado")
	def setNombre(String nombreNuevo){
		administradorDePuntuables.verificarLugaresDuplicados(nombreNuevo)
		administradorDePuntuables.verificarServiciosDuplicados(nombreNuevo)
		this.puntuableSeleccionado.nombre=nombreNuevo
		verificarSiTieneNombreAsignado
		
	}
    @Dependencies("puntuableSeleccionado")
	def getLugaresInscriptos(){
		administradorDePuntuables.lugaresInscriptos
	}
	@Dependencies("puntuableSeleccionado")
	def getLugaresHabilitados(){
		administradorDePuntuables.lugaresHabilitados
	}
	@Dependencies("puntuableSeleccionado")
	def getLugaresDeshabilitados(){
		administradorDePuntuables.lugaresDeshabilitados
	}
	
	
	def buscarPorNombreDeLugar(){
		administradorDePuntuables.buscarLugares(nombreDelLugarBuscado)
	}
	
	def buscarPorNombreDeServicio() {
		administradorDePuntuables.buscarServicios(nombreDelServicioBuscado)
	}
	@Dependencies("puntuableSeleccionado")
	def getServiciosHabilitados(){
		administradorDePuntuables.serviciosHabilitados
	}
	@Dependencies("puntuableSeleccionado")
	def getServiciosDeshabilitados(){
		administradorDePuntuables.serviciosDeshabilitados
	}
	@Dependencies("puntuableSeleccionado")
	def getServiciosInscriptos(){
		administradorDePuntuables.serviciosInscriptos
	}
	
	def avisarCambiosDeLugares(){
		ObservableUtils.firePropertyChanged(this,"lugaresInscriptos",lugaresInscriptos)
		ObservableUtils.firePropertyChanged(this,"lugaresHabilitados",lugaresHabilitados)
		ObservableUtils.firePropertyChanged(this,"lugaresDeshabilitados",lugaresDeshabilitados)
		
	}
	
	def avisarCambiosDeServicios() {
		ObservableUtils.firePropertyChanged(this,"serviciosInscriptos",serviciosInscriptos)
		ObservableUtils.firePropertyChanged(this,"serviciosHabilitados",serviciosHabilitados)
		ObservableUtils.firePropertyChanged(this,"serviciosDeshabilitados",serviciosDeshabilitados)
		
	}
	
	def verificarSiTieneNombreAsignado(){
		puntuableSeleccionado.verificarSiTieneNombre
	}
	
	def getCalificacionesDelPuntuable() {
        administradorCalificacion.calificacionesDelPutuable(puntuableSeleccionado).toList
	}
	

}