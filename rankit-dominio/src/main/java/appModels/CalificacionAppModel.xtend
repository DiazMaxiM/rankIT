package appModels

import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import edu.unq.interfaces.rankit_dominio.Calificacion
import edu.unq.interfaces.rankit_dominio.Puntuable
import edu.unq.interfaces.rankit_dominio.Usuario
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class CalificacionAppModel implements GenericaAppModel {

	AdmCalificaciones administradorCalificacion;
	Calificacion itemSeleccionado;
	Usuario usuarioLogeado;
	// AdmPuntuables admPuntuables;
	AdmPuntuables admPuntuables = new AdmPuntuables;

	String nombreUsuarioBusqueda;
	String nombreEvaluadoBusqueda;
	Boolean habilitadoEvaluadoBusqueda = true;
	Boolean habilitadoUsuarioBusqueda = true;

	new() {
	}

	new(AdmCalificaciones calificaciones, AdmPuntuables lugares, AdmPuntuables servicios, Usuario usuario) {
		administradorCalificacion = calificaciones
		admPuntuables.puntuables.addAll(lugares.puntuables)
		admPuntuables.puntuables.addAll(servicios.puntuables)
		usuarioLogeado = usuario
	}

	def List<Puntuable> getPuntuables() {
		admPuntuables.puntuables
	}

	@Dependencies("itemSeleccionado")
	def String getPuntos() {
		if (hayItemSeleccionado) {
			return itemSeleccionado.puntos.toString
		}
		""
	}

	def void setPuntos(String numero) {
		itemSeleccionado.puntos = numero
	}

	def setNombreUsuarioBusqueda(String nombre) {
		nombreUsuarioBusqueda = nombre
		ObservableUtils.firePropertyChanged(this, "listaCalificacionesFiltradas", listaCalificacionesFiltradas)
	}

	def setNombreEvaluadoBusqueda(String nombre) {
		nombreEvaluadoBusqueda = nombre
		ObservableUtils.firePropertyChanged(this, "listaCalificacionesFiltradas", listaCalificacionesFiltradas)
	}

	def listaCalificacionesFiltradas() {
		administradorCalificacion.filtrarCalificaciones(nombreEvaluadoBusqueda, nombreUsuarioBusqueda)
	}

	def void setItemSeleccionado(Calificacion calificacionSel) {
		itemSeleccionado = calificacionSel
		if (calificacionSel != null) {
			ObservableUtils.firePropertyChanged(this, "contenidoOfensivo", contenidoOfensivo)
		}
	}

	def Boolean getContenidoOfensivo() {
		itemSeleccionado.contenidoOfensivo
	}

	def void setContenidoOfensivo(Boolean bool) {
		administradorCalificacion.contenidoOfensivo(itemSeleccionado, bool)
		actualizarEstadoSituacion
	}

	@Dependencies("itemSeleccionado")
	def Boolean getHayItemSeleccionado() {
		itemSeleccionado != null
	}

	def int getCalificacionesRegistradas() {
		administradorCalificacion.getCalificacionesRegistradas()
	}

	def int getCalificacionesOfensivas() {
		administradorCalificacion.getCalificacionesOfensivas()
	}

	def eliminarCalificacionSeleccionada() {
		administradorCalificacion.eliminarCalificacion(itemSeleccionado)
		actualizarEstadoSituacion
	}

	def agregarCalificacion(Calificacion nuevaCalificacion) {
		administradorCalificacion.agregarCalificacion(nuevaCalificacion)
		actualizarEstadoSituacion
	}

	def actualizarEstadoSituacion() {
		ObservableUtils.firePropertyChanged(this, "puntos", puntos)
		ObservableUtils.firePropertyChanged(this, "listaCalificacionesFiltradas", listaCalificacionesFiltradas)
		ObservableUtils.firePropertyChanged(this, "calificacionesRegistradas", calificacionesRegistradas)
		ObservableUtils.firePropertyChanged(this, "calificacionesOfensivas", calificacionesOfensivas)
	}

	def crearCalificacion() {
		agregarCalificacion(new Calificacion(this.usuarioLogeado))
	}

	def filtradoObligatorioPorPuntuable(Puntuable puntuable) {
		nombreEvaluadoBusqueda = puntuable.nombre
		this
	}

	def filtradoObligatorioPorUsuario(Usuario usuario) {
		nombreUsuarioBusqueda = usuario.nombre
		this
	}

	override String getDescripcionDato1ResumenDeSituacion() {
		"Calificaciones Registradas:"
	}

	@Dependencies("calificacionesRegistradas")
	override String getValorDato1ResumenDeSituacion() {
		calificacionesRegistradas.toString
	}

	override String getDescripcionDato2ResumenDeSituacion() {
		"Ofensivas:"
	}

	@Dependencies("calificacionesOfensivas")
	override getValorDato2ResumenDeSituacion() {
		calificacionesOfensivas.toString
	}

	override getDescripcionDato3ResumenDeSituacion() {
		""
	}

	override getValorDato3ResumenDeSituacion() {
		""
	}

	override getDescripcionDato4ResumenDeSituacion() {
		""
	}

	override getValorDato4ResumenDeSituacion() {
		""
	}

	override tituloContenedorBusqueda() {
		"Calificaciones"
	}

	override textoPrimerParametroDeBusqueda() {
		"Usuario"
	}

	override getPrimerParametroDeBusqueda() {
		nombreUsuarioBusqueda
	}

	def setPrimerParametroDeBusqueda(String nombre) {
		nombreUsuarioBusqueda = nombre
		actualizarEstadoSituacion
	}

	override textoSegundoParametroDeBusqueda() {
		"Evaluado"
	}

	@Dependencies("filtradoObligatorioPorPuntuable")
	override getSegundoParametroDeBusqueda() {
		nombreEvaluadoBusqueda
	}

	def setSegundoParametroDeBusqueda(String nombre) {
		nombreEvaluadoBusqueda = nombre
		actualizarEstadoSituacion
	}

	override nuevo() {
		administradorCalificacion.agregarCalificacion(new Calificacion(this.usuarioLogeado))
		actualizarEstadoSituacion
	}

	override eliminar() {
		this.eliminarCalificacionSeleccionada
		actualizarEstadoSituacion
	}

	override getElementosNecesariosParaAdmCalificacionWindow() {
	}

	override blanquearContrasenha() {
	}

}
