package edu.unq.interfaces.rankit_dominio


import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.model.UserException

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
	
	def setPuntuableSeleccionado(Puntuable seleccionado){
		puntuableSeleccionado = seleccionado
		ObservableUtils.firePropertyChanged(this,"ratingPromedio",ratingPromedio)
		ObservableUtils.firePropertyChanged(this,"cantidadDeCalificacionesDelPuntuable",cantidadDeCalificacionesDelPuntuable)
		
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
		//puntuableSeleccionado=null
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
	
 /** 
	@Dependencies("puntuableSeleccionado")
    def void setHabilitadoLugar(Boolean habilitado){
		puntuableSeleccionado.habilitado = habilitado
	}	
	
	@Dependencies("puntuableSeleccionado")
    def void setHabilitadoServicio(Boolean habilitado){
		puntuableSeleccionado.habilitado = habilitado
		
	}
	*/
	@Dependencies("puntuableSeleccionado")
	def setNombreLugar(String nombreNuevo){
		administradorDePuntuables.verificarLugaresDuplicados(nombreNuevo)
	    this.puntuableSeleccionado.nombre=nombreNuevo
		
	}
	
	
	@Dependencies("puntuableSeleccionado")
	def setNombreServicio(String nombreNuevo){
		administradorDePuntuables.verificarServiciosDuplicados(nombreNuevo)
	    this.puntuableSeleccionado.nombre=nombreNuevo
		
	}
	
	def getLugaresInscriptos(){
		administradorDePuntuables.lugaresInscriptos
	}
	
	def getLugaresHabilitados(){
		administradorDePuntuables.lugaresHabilitados
	}
	
	def getLugaresDeshabilitados(){
		administradorDePuntuables.lugaresDeshabilitados
	}
	
	
	def buscarPorNombreDeLugar(){
		administradorDePuntuables.buscarLugares(nombreDelLugarBuscado)
	}
	
	def buscarPorNombreDeServicio() {
		administradorDePuntuables.buscarServicios(nombreDelServicioBuscado)
	}
	
	def getServiciosHabilitados(){
		administradorDePuntuables.serviciosHabilitados
	}
	
	def getServiciosDeshabilitados(){
		administradorDePuntuables.serviciosDeshabilitados
	}
	
	def getServiciosInscriptos(){
		administradorDePuntuables.serviciosInscriptos
	}
	
	@Dependencies("puntuableSeleccionado")
	def avisarCambiosDeLugares(){
		ObservableUtils.firePropertyChanged(this,"lugaresInscriptos",lugaresInscriptos)
		ObservableUtils.firePropertyChanged(this,"lugaresHabilitados",lugaresHabilitados)
		ObservableUtils.firePropertyChanged(this,"lugaresDeshabilitados",lugaresDeshabilitados)
		
	}
	@Dependencies("puntuableSeleccionado")
	def avisarCambiosDeServicios() {
		ObservableUtils.firePropertyChanged(this,"serviciosInscriptos",serviciosInscriptos)
		ObservableUtils.firePropertyChanged(this,"serviciosHabilitados",serviciosHabilitados)
		ObservableUtils.firePropertyChanged(this,"serviciosDeshabilitados",serviciosDeshabilitados)
		
	}
	
	
}
