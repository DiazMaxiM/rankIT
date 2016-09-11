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
	 String  nombreDelPuntuableBuscado=""
	
	new(AdmPuntuables adm1, AdmCalificaciones adm2){
		this.administradorDePuntuables= adm1
		this.administradorCalificacion=adm2
		
	}
	
	def setPuntuableSeleccionado(Puntuable seleccionado){
		puntuableSeleccionado = seleccionado
		ObservableUtils.firePropertyChanged(this,"ratingPromedio",ratingPromedio)
		ObservableUtils.firePropertyChanged(this,"cantidadDeCalificacionesDelPuntuable",cantidadDeCalificacionesDelPuntuable)	
	}
	
	def setNombreDelPuntuableBuscado(String nombre){
		 nombreDelPuntuableBuscado=nombre
		 ObservableUtils.firePropertyChanged(this," buscarPorNombreDeLugar", buscarPorNombreDeLugar)
	}
	
	def nuevoLugar() {
		var lugar = new Lugar
		administradorDePuntuables.agregarLugar(lugar)
		lugar
	}
	def eliminarLugar(){
		administradorDePuntuables.eliminarLugar(puntuableSeleccionado)
		puntuableSeleccionado=null
	}
	def nuevoServicio() {
		var servicio = new Servicio
		administradorDePuntuables.agregarServicio(servicio)
		servicio
	}
	
	def eliminarServicio(){
		administradorDePuntuables.eliminarServicio(puntuableSeleccionado)
		puntuableSeleccionado=null
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
	
	@Dependencies("puntuableSeleccionado")
    def void setHabilitado(Boolean habilitado){
		puntuableSeleccionado.habilitado = habilitado
		administradorDePuntuables.avisarCambiosDeLugares()
		
	}
	@Dependencies("puntuableSeleccionado")
	def setNombrePuntuable(String nombreNuevo){
		if(administradorDePuntuables.isLugaresDuplicados(nombreNuevo)){
			throw new UserException("Ya existe otro Lugar con el mismo nombre "+ nombreNuevo)
		}
	    this.puntuableSeleccionado.nombre=nombreNuevo
	}
	def buscarPorNombreDeLugar(){
		administradorDePuntuables.buscarLugares(nombreDelPuntuableBuscado)
		
		
	}
	
}
