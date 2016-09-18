package edu.unq.interfaces.rankit_dominio


import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.utils.Observable
import java.util.Date
import java.util.List

@Observable
@Accessors
class PuntuableAppModel {
	val Puntuable miPuntuableNull = new PuntuableNull
	Usuario usuarioLogeado
	AdmPuntuables administradorDePuntuables
	AdmCalificaciones administradorCalificacion
	Puntuable itemSeleccionado = miPuntuableNull
	String nombreBuscado = ""

	new(AdmPuntuables adm1, AdmCalificaciones adm2, Usuario usuarioLogeado) {
		this.administradorDePuntuables = adm1
		this.administradorCalificacion = adm2
		this.usuarioLogeado = usuarioLogeado

	}

	@Dependencies("itemSeleccionado")
	def setItemSeleccionado(Puntuable seleccionado){
		   itemSeleccionado = seleccionado
		   ObservableUtils.firePropertyChanged(this,"ratingPromedio",ratingPromedio)
		   ObservableUtils.firePropertyChanged(this,"cantidadDeCalificacionesDelPuntuable",cantidadDeCalificacionesDelPuntuable)
		   ObservableUtils.firePropertyChanged(this,"fechaDeRegistro",fechaDeRegistro) 
		   ObservableUtils.firePropertyChanged(this,"hayItemSeleccionadoConNombre",hayItemSeleccionadoConNombre) 
		   verificarSiTieneNombreAsignado
		
	}
	

	@Dependencies("itemSeleccionado")
	def getHayItemSeleccionado() {
		!itemSeleccionado.equals(miPuntuableNull)
	}
	
	@Dependencies("itemSeleccionado")
	def getHayItemSeleccionadoConNombre(){
		!itemSeleccionado.isNoTieneNombre
	}


	def void setNombreBuscado(String nombre) {
		nombreBuscado = nombre
		administradorDePuntuables.buscar(nombreBuscado)
		ObservableUtils.firePropertyChanged(this, "elementos", elementos)
	}

	def void nuevo() {
		var puntuable = new Puntuable
		administradorDePuntuables.agregar(puntuable)
		avisarCambiosDeLista
	}
    @Dependencies("itemSeleccionado")
	def int getRatingPromedio() {
		administradorCalificacion.ratingPromedio(itemSeleccionado)
	}
    @Dependencies("itemSeleccionado")
	def int getCantidadDeCalificacionesDelPuntuable() {
		administradorCalificacion.cantidadDeCalificacionesDelPuntuable(itemSeleccionado)
	}
	
	@Dependencies("itemSeleccionado")
	def void setHabilitado(boolean bool) {
		itemSeleccionado.habilitado = bool
		avisarCambiosDeLista
	}
	
	 @Dependencies("itemSeleccionado")
	def Date getFechaDeRegistro() {
		itemSeleccionado.fechaDeRegistro
	}
	@Dependencies("itemSeleccionado")
	def String getNombre() {
		itemSeleccionado.nombre
	}

	@Dependencies("itemSeleccionado")
	def boolean getHabilitado() {
		itemSeleccionado.habilitado
	}
	

	@Dependencies("itemSeleccionado") 
	def void setNombre(String nombreNuevo){
		verificarSiHayDuplicados(nombreNuevo)
		this.itemSeleccionado.nombre=nombreNuevo
	    verificarSiTieneNombreAsignado

	}
	@Dependencies("itemSeleccionado")
	def verificarSiHayDuplicados(String nombre) {
		administradorDePuntuables.verificarSiHayDuplicados(nombre)
	}
	

	@Dependencies("itemSeleccionado")
	def int getInscriptos() {
		administradorDePuntuables.inscriptos
	}

	@Dependencies("itemSeleccionado")
	def int getHabilitados() {
		administradorDePuntuables.habilitados
	}

	@Dependencies("itemSeleccionado")
	def int getDeshabilitados() {
		administradorDePuntuables.deshabilitados
	}

	def void buscar() {
		administradorDePuntuables.buscar(nombreBuscado)
		ObservableUtils.firePropertyChanged(this, "elementos", elementos)
	}

	@Dependencies("itemSeleccionado,hayItemSeleccionadoConNombre")
	def void verificarSiTieneNombreAsignado() {
		itemSeleccionado.verificarSiTieneNombre
	}

	def List<Puntuable> getElementos() {
		administradorDePuntuables.puntuables
	}

	def void eliminar() {
		administradorDePuntuables.eliminar(itemSeleccionado)
		itemSeleccionado = miPuntuableNull
		avisarCambiosDeLista()
	}
    @Dependencies("itemSeleccionado")
	def void avisarCambiosDeLista() {
		ObservableUtils.firePropertyChanged(this, "inscriptos", inscriptos)
		ObservableUtils.firePropertyChanged(this, "habilitados", habilitados)
		ObservableUtils.firePropertyChanged(this, "deshabilitados", deshabilitados)
		ObservableUtils.firePropertyChanged(this, "elementos", elementos)


	}

	def AdmCalificaciones administradorCalificacionesParaCalificacionSeleccionada() {
		administradorCalificacion
	}
}
