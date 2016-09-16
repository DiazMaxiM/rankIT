package edu.unq.interfaces.rankit_dominio

import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class PuntuableAppModel {
	val Puntuable miPuntuableNull = new PuntuableNull
	Usuario usuarioLogeado
	AdmPuntuables administradorDePuntuables
	AdmCalificaciones administradorCalificacion
	Puntuable puntuableSeleccionado = miPuntuableNull
	String nombreBuscado = ""

	new(AdmPuntuables adm1, AdmCalificaciones adm2, Usuario usuarioLogeado) {
		this.administradorDePuntuables = adm1
		this.administradorCalificacion = adm2
		this.usuarioLogeado = usuarioLogeado

	}

	@Dependencies("puntuableSeleccionado")
	def setPuntuableSeleccionado(Puntuable seleccionado) {
		puntuableSeleccionado = seleccionado
		ObservableUtils.firePropertyChanged(this, "ratingPromedio", ratingPromedio)
		ObservableUtils.firePropertyChanged(this, "cantidadDeCalificacionesDelPuntuable",
			cantidadDeCalificacionesDelPuntuable)
		ObservableUtils.firePropertyChanged(this, "fechaDeRegistro", fechaDeRegistro)
		verificarSiTieneNombreAsignado

	}

	@Dependencies("puntuableSeleccionado")
	def getHayPuntuableSeleccionado() {
		!puntuableSeleccionado.equals(miPuntuableNull)
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

	def int getRatingPromedio() {
		administradorCalificacion.ratingPromedio(puntuableSeleccionado)
	}

	def int getCantidadDeCalificacionesDelPuntuable() {
		administradorCalificacion.cantidadDeCalificacionesDelPuntuable(puntuableSeleccionado)
	}

	def Date getFechaDeRegistro() {
		puntuableSeleccionado.fechaDeRegistro
	}

	@Dependencies("puntuableSeleccionado")
	def String getNombre() {
		puntuableSeleccionado.nombre
	}

	@Dependencies("puntuableSeleccionado")
	def void setHabilitado(boolean bool) {
		puntuableSeleccionado.habilitado = bool
		avisarCambiosDeLista()
	}

	@Dependencies("puntuableSeleccionado")
	def boolean getHabilitado() {
		puntuableSeleccionado.habilitado
	}

	@Dependencies("puntuableSeleccionado")
	def void setNombre(String nombreNuevo) {
		administradorDePuntuables.verificarLugaresDuplicados(nombreNuevo)
		administradorDePuntuables.verificarServiciosDuplicados(nombreNuevo)
		this.puntuableSeleccionado.nombre = nombreNuevo
		verificarSiTieneNombreAsignado

	}

	@Dependencies("puntuableSeleccionado")
	def int getInscriptos() {
		administradorDePuntuables.inscriptos
	}

	@Dependencies("puntuableSeleccionado")
	def int getHabilitados() {
		administradorDePuntuables.habilitados
	}

	@Dependencies("puntuableSeleccionado")
	def int getDeshabilitados() {
		administradorDePuntuables.deshabilitados
	}

	def void buscar() {
		administradorDePuntuables.buscar(nombreBuscado)
		ObservableUtils.firePropertyChanged(this, "elementos", elementos)
	}

	@Dependencies("puntuableSeleccionado")
	def void verificarSiTieneNombreAsignado() {
		puntuableSeleccionado.verificarSiTieneNombre
	}

	def List<Puntuable> getElementos() {
		administradorDePuntuables.puntuables
	}

	def void eliminar() {
		administradorDePuntuables.eliminar(puntuableSeleccionado)
		puntuableSeleccionado = miPuntuableNull
		avisarCambiosDeLista()
	}

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
