package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Dependencies
import java.util.List
import com.google.common.base.Strings

@Observable
@Accessors
class CalificacionAppModel implements GenericaAppModel  {

	AdmCalificaciones administradorCalificacion;
	Calificacion itemSeleccionado;
	Usuario usuarioLogeado;
	//AdmPuntuables admPuntuables;
	
	AdmPuntuables admPuntuables=new AdmPuntuables;
	
	String nombreUsuarioBusqueda;
	String nombreEvaluadoBusqueda;
	Boolean habilitadoEvaluadoBusqueda=true;
	Boolean habilitadoUsuarioBusqueda=true;

	new() {

	}
	
	new(AdmCalificaciones calificaciones, AdmPuntuables lugares,AdmPuntuables servicios, Usuario usuario) {
		administradorCalificacion = calificaciones
		admPuntuables.puntuables.addAll( lugares.puntuables)
		admPuntuables.puntuables.addAll( servicios.puntuables)
		usuarioLogeado = usuario
	}
	
	new(AdmCalificaciones calificaciones,  Usuario usuario) {
		administradorCalificacion = calificaciones
		usuarioLogeado = usuario
	}
	
	
	def List<Puntuable>getPuntuables(){
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
		var Integer valor = 0;
		if (!Strings.isNullOrEmpty(numero)) {
			valor = Integer.parseInt(numero)
		}
		itemSeleccionado.puntos = valor
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
		System.out.println(nombreEvaluadoBusqueda);
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
	
	def  filtradoObligatorioPorPuntuable(Puntuable puntuable) {
		admPuntuables.agregar(puntuable)
		nombreEvaluadoBusqueda = puntuable.nombre
		habilitadoEvaluadoBusqueda=false
		ObservableUtils.firePropertyChanged(this, "segundoParametroDeBusqueda", segundoParametroDeBusqueda)
		this
	}
	def  filtradoObligatorioPorUsuario(Usuario usuario) {
		nombreUsuarioBusqueda = usuario.nombre
		habilitadoUsuarioBusqueda=false
		ObservableUtils.firePropertyChanged(this, "primerParametroDeBusqueda", primerParametroDeBusqueda)
		this
	}
	
	override String getLabelNombre1() {
	"Calificaciones Registradas:"	
	}
	@Dependencies("calificacionesRegistradas")
	override String getLabelValor1() {
	  calificacionesRegistradas.toString	
	}
	
	override String getLabelNombre2() {
	"Ofensivas:"
	}
	@Dependencies("calificacionesOfensivas")
	override getLabelValor2() {
	 calificacionesOfensivas.toString	
	}
	
	override getLabelNombre3() {
	""
	}
	
	override getLabelValor3() {
	""
	}
	
	override getLabelNombre4() {
	""
	}
	
	override getLabelValor4() {
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
	 nombreUsuarioBusqueda=nombre
	 actualizarEstadoSituacion
	}
	override textoSegundoParametroDeBusqueda(){
		"Evaluado"
	}
	@Dependencies("filtradoObligatorioPorPuntuable")
	override getSegundoParametroDeBusqueda() {
	 nombreEvaluadoBusqueda
	}
	
	def setSegundoParametroDeBusqueda(String nombre) {
	 nombreEvaluadoBusqueda=nombre
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
	
	override getHabilitadoPrimerParametro() {
		habilitadoUsuarioBusqueda
	}
	
	override getHabilitadoSegundoParametro() {
		habilitadoEvaluadoBusqueda
	}
	
}
