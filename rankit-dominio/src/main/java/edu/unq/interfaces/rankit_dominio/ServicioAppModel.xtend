package edu.unq.interfaces.rankit_dominio

import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Dependencies
import java.util.List
import java.util.Date
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class ServicioAppModel extends PuntuableAppModel {	
	
	//Ventana

	
	override String getLabelNombre1() {
		"Servicios Inscriptos: "
	}
	
	override String getLabelValor1() {
		inscriptos.toString
	}
	
	override String getLabelNombre2() {
		"Habilitados: "
	}
	
	override String getLabelValor2() {
		habilitados.toString
	}
	
	override String getLabelNombre3() {
		"Deshabilitados"
	}
	
	override String getLabelValor3() {
		deshabilitados.toString
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
	   nombreBuscado
	}
	def setPrimerParametroDeBusqueda(String nombre) {
	    nombreBuscado = nombre
	    ObservableUtils.firePropertyChanged(this,"elementos", elementos)
	}
	
	override textoSegundoParametroDeBusqueda() {
		""
	}
	
	override getSegundoParametroDeBusqueda() {
		""
	}
	
	override getElementosNecesariosParaAdmCalificacionWindow() {
		
	}
	


}