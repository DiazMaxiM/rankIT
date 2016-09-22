package appModels

import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import edu.unq.interfaces.rankit_dominio.Puntuable
import edu.unq.interfaces.rankit_dominio.PuntuableNull
import edu.unq.interfaces.rankit_dominio.Usuario
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
abstract class PuntuableAppModel implements GenericaAppModel {
	var Puntuable miPuntuableNull = new PuntuableNull
	Usuario usuarioLogeado
	AdmPuntuables administradorDePuntuables
	AdmPuntuables admPuntuablesParaLasCalificaciones
	AdmCalificaciones administradorCalificacion
	Puntuable itemSeleccionado = miPuntuableNull
	String nombreBuscado

	new(AdmPuntuables admPuntuables, AdmPuntuables admDePuntuablesParaLasCalificaciones,
		AdmCalificaciones admCalificaciones, Usuario usuarioLogeado) {
		this.administradorDePuntuables = admPuntuables
		this.admPuntuablesParaLasCalificaciones = admDePuntuablesParaLasCalificaciones
		this.administradorCalificacion = admCalificaciones
		this.usuarioLogeado = usuarioLogeado

	}

	def void setItemSeleccionado(Puntuable puntuable) {
		itemSeleccionado = puntuable
		validarNombreDelItemSeleccionado
		avisarCambios

	}

	def void validarNombreDelItemSeleccionado() {
		itemSeleccionado.validarSiElPuntuableTieneNombre
	}

	@Dependencies("itemSeleccionado")
	def boolean getHayItemSeleccionado() {
		!itemSeleccionado.esIgualA(miPuntuableNull)
	}

	@Dependencies("itemSeleccionado")
	def boolean getHayItemSeleccionadoConNombre() {
		hayItemSeleccionado && tieneNombre
	}

	def private boolean tieneNombre() {
		itemSeleccionado.tieneNombre
	}

	@Dependencies("itemSeleccionado")
	def boolean getHabilitado() {
		itemSeleccionado.habilitado
	}

	@Dependencies("itemSeleccionado")
	def void setHabilitado(boolean bool) {
		itemSeleccionado.habilitado = bool
		avisarCambios
	}

	@Dependencies("itemSeleccionado")
	def int getRatingPromedio() {
		administradorCalificacion.ratingPromedio(itemSeleccionado)
	}

	@Dependencies("itemSeleccionado")
	def int getCantidadDeCalificacionesDelPuntuable() {
		administradorCalificacion.cantidadDeCalificacionesDelPuntuable(itemSeleccionado)
	}

	@Dependencies("nombreBuscado")
	def List<Puntuable> getElementos() {
		administradorDePuntuables.buscarPuntuables(nombreBuscado)
	}

	@Dependencies("itemSeleccionado")
	def String getNombre() {
		itemSeleccionado.nombre
	}

	@Dependencies("itemSeleccionado")
	def void setNombre(String nuevoNombre) {
		administradorDePuntuables.cambiarNombreSiPuedeDelPuntuable(itemSeleccionado, nuevoNombre)
		itemSeleccionado.nombre = nuevoNombre
		validarSiElItemSeleccionadoTieneNombre
		avisarCambios

	}

	def void validarSiElItemSeleccionadoTieneNombre() {
		itemSeleccionado.validarSiElPuntuableTieneNombre
	}

	def int inscriptos() {
		administradorDePuntuables.inscriptos
	}

	def int habilitados() {
		administradorDePuntuables.habilitados
	}

	def int deshabilitados() {
		administradorDePuntuables.deshabilitados
	}

	override String getDescripcionDato1ResumenDeSituacion()

	override String tituloContenedorBusqueda()

	override String textoPrimerParametroDeBusqueda()

	override blanquearContrasenha() {
	}

	override CalificacionAppModel getElementosNecesariosParaAdmCalificacionWindow() {
		var CalificacionAppModel calificacionAppModel = new CalificacionAppModel(administradorCalificacion,
			administradorDePuntuables, admPuntuablesParaLasCalificaciones, usuarioLogeado).
			filtradoObligatorioPorPuntuable(itemSeleccionado)
		calificacionAppModel
	}

	override String getPrimerParametroDeBusqueda() {
		nombreBuscado
	}

	def void setPrimerParametroDeBusqueda(String nombre) {
		itemSeleccionado = miPuntuableNull
		nombreBuscado = nombre
		avisarCambios
	}

	override String getValorDato1ResumenDeSituacion() {
		inscriptos.toString

	}

	override String getValorDato2ResumenDeSituacion() {
		habilitados.toString
	}

	override String getValorDato3ResumenDeSituacion() {
		deshabilitados.toString
	}

	override String getDescripcionDato2ResumenDeSituacion() {
		"Habilitados: "
	}

	override String getDescripcionDato3ResumenDeSituacion() {
		"Deshabilitados"
	}

	override String textoSegundoParametroDeBusqueda() {
		""
	}

	override String getSegundoParametroDeBusqueda() {
		""
	}

	override String getDescripcionDato4ResumenDeSituacion() {
		""
	}

	override String getValorDato4ResumenDeSituacion() {
		""
	}

	override void nuevo() {
		var puntuable = new Puntuable
		administradorDePuntuables.agregar(puntuable)
		avisarCambios
	}

	override void eliminar() {
		administradorDePuntuables.eliminar(itemSeleccionado)
		administradorCalificacion.eliminarCalificacionesDelPuntuable(itemSeleccionado)
		itemSeleccionado = miPuntuableNull
		avisarCambios

	}

	def void avisarCambios() {
		ObservableUtils.firePropertyChanged(this, "elementos", elementos)
		ObservableUtils.firePropertyChanged(this, "nombre", nombre)
		ObservableUtils.firePropertyChanged(this, "hayItemSeleccionado", hayItemSeleccionado)
		ObservableUtils.firePropertyChanged(this, "inscriptos", inscriptos)
		ObservableUtils.firePropertyChanged(this, "habilitados", habilitados)
		ObservableUtils.firePropertyChanged(this, "deshabilitados", deshabilitados)
		ObservableUtils.firePropertyChanged(this, "labelValor1", valorDato1ResumenDeSituacion)
		ObservableUtils.firePropertyChanged(this, "labelValor2", valorDato2ResumenDeSituacion)
		ObservableUtils.firePropertyChanged(this, "labelValor3", valorDato3ResumenDeSituacion)
	}

}
