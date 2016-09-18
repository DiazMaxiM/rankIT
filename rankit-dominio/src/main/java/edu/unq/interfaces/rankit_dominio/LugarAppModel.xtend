package edu.unq.interfaces.rankit_dominio

import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Dependencies
import java.util.Date
import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class LugarAppModel extends PuntuableAppModel {
	
	//Ventana
	override String getLabelNombre1() {
		"Lugares Inscriptos: "
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
	   "Lugares"
	}
	
	override textoPrimerParametroDeBusqueda() {
		"Buscar por nombre de Lugar "
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