package edu.unq.interfaces.rankit_dominio

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Dependencies
import java.util.Date

@Observable
@Accessors

abstract class PuntuableAppModel implements GenericaAppModel {
	val Puntuable miPuntuableNull = new PuntuableNull
	Usuario usuarioLogeado
	AdmPuntuables administradorDePuntuables
	AdmCalificaciones administradorCalificacion
	Puntuable itemSeleccionado = miPuntuableNull
	String nombreBuscado
	
	new(AdmPuntuables adm1, AdmCalificaciones adm2, Usuario usuarioLogeado) {
		this.administradorDePuntuables = adm1
		this.administradorCalificacion = adm2
		this.usuarioLogeado = usuarioLogeado

	}
	
		def setItemSeleccionado(Puntuable seleccionado){
		   itemSeleccionado = seleccionado
		   if(hayItemSeleccionado){
		   	  verificarSiTieneNombreAsignado
		   }
		
	}
	
	@Dependencies("itemSeleccionado")
	def getHayItemSeleccionado() {
		!itemSeleccionado.equals(miPuntuableNull)
	}
	
	@Dependencies("itemSeleccionado")
	def getHayItemSeleccionadoConNombre(){
		!itemSeleccionado.isNoTieneNombre
	}
	
	override void nuevo() {
		var puntuable = new Puntuable
		administradorDePuntuables.agregar(puntuable)
		avisarCambiosDeLista
		actualizar
	}
    @Dependencies("itemSeleccionado")
	def int getRatingPromedio() {
		administradorCalificacion.ratingPromedio(itemSeleccionado)
	}
    @Dependencies("itemSeleccionado")
	def int getCantidadDeCalificacionesDelPuntuable() {
		administradorCalificacion.cantidadDeCalificacionesDelPuntuable(itemSeleccionado)
	}
	
	
   @Dependencies("hayItemSeleccionado,itemSeleccionado")
	def void setHabilitado(boolean bool) {
		itemSeleccionado.habilitado = bool
		ObservableUtils.firePropertyChanged(this,"habilitado",habilitado)
		avisarCambiosDeLista
		actualizar
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
	

   @Dependencies("hayItemSeleccionado,itemSeleccionado")
   def void setNombre(String nombreNuevo){
   	    verificarSiHayDuplicados(nombreNuevo)
   	    itemSeleccionado.nombre=nombreNuevo
   	    verificarSiTieneNombreAsignado
   	    ObservableUtils.firePropertyChanged(this,"nombre",nombre)
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


	@Dependencies("itemSeleccionado,hayItemSeleccionadoConNombre")
	def void verificarSiTieneNombreAsignado() {
		itemSeleccionado.verificarSiTieneNombre
	}
    @Dependencies("nombreBuscado,itemSeleccionado")
	def List<Puntuable> getElementos() {
		administradorDePuntuables.buscar(nombreBuscado)
	}

	override eliminar() {
		administradorDePuntuables.eliminar(itemSeleccionado)
		itemSeleccionado = miPuntuableNull
		avisarCambiosDeLista()
		actualizar
	}
	
    @Dependencies("itemSeleccionado")
	def void avisarCambiosDeLista() {
		ObservableUtils.firePropertyChanged(this, "inscriptos", inscriptos)
		ObservableUtils.firePropertyChanged(this, "habilitados", habilitados)
		ObservableUtils.firePropertyChanged(this, "deshabilitados", deshabilitados)
		ObservableUtils.firePropertyChanged(this, "elementos", elementos)


	}
     	def void actualizar(){
		ObservableUtils.firePropertyChanged(this, "labelValor1", labelValor1)
		ObservableUtils.firePropertyChanged(this, "labelValor2", labelValor2)
		ObservableUtils.firePropertyChanged(this, "labelValor3", labelValor3)
	}
	
	override String getLabelNombre1()

	override String getLabelValor1()

	override String getLabelNombre2()

	override String getLabelValor2()

	override String getLabelNombre3()

	override String getLabelValor3()

	override String getLabelNombre4()

	override String getLabelValor4()
	
	override String tituloContenedorBusqueda()
	
	override String textoPrimerParametroDeBusqueda()
	
	override String getPrimerParametroDeBusqueda()
	
	override String textoSegundoParametroDeBusqueda()
	
	override String getSegundoParametroDeBusqueda()
	
	override AdapterCalificacionAppModel getElementosNecesariosParaAdmCalificacionWindow()
	
	
	
}