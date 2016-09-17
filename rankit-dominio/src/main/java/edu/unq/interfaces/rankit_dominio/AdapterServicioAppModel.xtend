package edu.unq.interfaces.rankit_dominio


import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils

@Observable
@Accessors
class AdapterServicioAppModel implements GenericaAppModel{
	private PuntuableAppModel miAppModel;
	
	new(PuntuableAppModel model) {
		this.miAppModel=model
	}
	
	override String getLabelNombre1() {
		"Servicios Inscriptos: "
	}
	
	override String getLabelValor1() {
		miAppModel.inscriptos.toString
	}
	
	override String getLabelNombre2() {
		"Habilitados: "
	}
	
	override String getLabelValor2() {
		miAppModel.habilitados.toString
	}
	
	override String getLabelNombre3() {
		"Deshabilitados"
	}
	
	override String getLabelValor3() {
		miAppModel.deshabilitados.toString
	}
	
	override String getLabelNombre4() {
		""
	}
	
	override String getLabelValor4() {
	   ""
	}
	
	override tituloContenedorBusqueda() {
	   "Servicios"
	}
	
	override textoPrimerParametroDeBusqueda() {
	    "Buscar por nombre de Servicio "
	}
	
	override getPrimerParametroDeBusqueda() {
	   miAppModel.nombreBuscado
	}
	def setPrimerParametroDeBusqueda(String nombre) {
	   miAppModel.nombreBuscado=nombre
	}
	
	override textoSegundoParametroDeBusqueda() {
		""
	}
	
	override getSegundoParametroDeBusqueda() {
		""
	}
	
	override nuevo() {
		miAppModel.nuevo
	}
	
	override eliminar() {
          miAppModel.eliminar
	} 
	
	def void avisarCambios(){
		ObservableUtils.firePropertyChanged(this, "labelValor1", labelValor1)
	}
	
}