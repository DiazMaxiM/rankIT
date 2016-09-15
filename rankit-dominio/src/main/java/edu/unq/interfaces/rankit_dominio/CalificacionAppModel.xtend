package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Dependencies
/**
 * @author Maximiliano Diaz
 * 
 * Esta clase es la intermediaria entre el modelo y la Vista
 */
@Observable
@Accessors
class CalificacionAppModel {
	
	private AdmCalificaciones administradorCalificacion;
	private Calificacion calificacionSeleccionada;
	private Usuario usuarioLogeado;
	private AdmPuntuables admPuntuables;
	private String nombreUsuarioBusqueda;
	private String nombreEvaluadoBusqueda;
	/**
	 * @param AdmCalificaciones
	 * @param AdmPuntuable
	 * @param Usuario usuario logeado en el sistema
	 * 
	 * Constructor del AppModel
	 */
	new(AdmCalificaciones calificaciones, AdmPuntuables puntuables,Usuario usuario) {
		administradorCalificacion = calificaciones
		admPuntuables= puntuables
		usuarioLogeado=	usuario
	}
	/**
	 * @return String valor de la calificacion convertida a string
	 * 
	 * re defino el getter para poder adaptarlo al NumericField
	 * 
	 */
	@Dependencies("calificacionSeleccionada")
	def String getPuntos(){
		if (hayCalificacionSeleccionada){
			return calificacionSeleccionada.puntos.toString
		}
		""
	}
	
	def void setPuntos(String numero){
		var Integer valor=0;
		if (numero != null && numero!=""){
			valor=Integer.parseInt(numero);
		}
		 calificacionSeleccionada.puntos=valor
	}
	/**
	 * 
	 * TODO: Consultar porque con la annotation no funciona
	 * 
	 */
	
	def setNombreUsuarioBusqueda(String nombre){
		nombreUsuarioBusqueda= nombre
		ObservableUtils.firePropertyChanged(this,"listaCalificacionesFiltradas",listaCalificacionesFiltradas)		
	}
	def setNombreEvaluadoBusqueda(String nombre){
		nombreEvaluadoBusqueda= nombre
		ObservableUtils.firePropertyChanged(this,"listaCalificacionesFiltradas",listaCalificacionesFiltradas)		
	}
	/**
	 * @return lista de calificaciones filtradas por los parametros ingresados en la busqueda de la pantalla
	 */
	def listaCalificacionesFiltradas(){
		administradorCalificacion.filtrarCalificaciones(nombreEvaluadoBusqueda,nombreUsuarioBusqueda)
	}
	
	def void setCalificacionSeleccionada(Calificacion calificacionSel){
		calificacionSeleccionada = calificacionSel
		if (calificacionSel!=null){
			ObservableUtils.firePropertyChanged(this,"contenidoOfensivo",contenidoOfensivo)
		}		
	}
	def Boolean getContenidoOfensivo(){
		calificacionSeleccionada.contenidoOfensivo
	}

	def void setContenidoOfensivo(Boolean bool){
		administradorCalificacion.contenidoOfensivo(calificacionSeleccionada,bool) 
		actualizarEstadoSituacion
	}
	@Dependencies("calificacionSeleccionada")
	def Boolean getHayCalificacionSeleccionada(){
		calificacionSeleccionada != null
	}	
	
	def int getCalificacionesRegistradas(){
		administradorCalificacion.getCalificacionesRegistradas()
	}
	def int getCalificacionesOfensivas(){
 		administradorCalificacion.getCalificacionesOfensivas()
	}
	
	def eliminarCalificacionSeleccionada(){
		administradorCalificacion.eliminarCalificacion(calificacionSeleccionada)
		actualizarEstadoSituacion
	}

	def agregarNuevaCalificacion(){
		setCalificacionSeleccionada(null)
		administradorCalificacion.agregarCalificacion(new Calificacion(usuarioLogeado))
		actualizarEstadoSituacion
	}
	
	def actualizarEstadoSituacion(){	
		ObservableUtils.firePropertyChanged(this,"puntos",puntos)
		ObservableUtils.firePropertyChanged(this,"listaCalificacionesFiltradas",listaCalificacionesFiltradas)
		ObservableUtils.firePropertyChanged(this,"calificacionesRegistradas",calificacionesRegistradas)
		ObservableUtils.firePropertyChanged(this,"calificacionesOfensivas",calificacionesOfensivas)	
	}
}