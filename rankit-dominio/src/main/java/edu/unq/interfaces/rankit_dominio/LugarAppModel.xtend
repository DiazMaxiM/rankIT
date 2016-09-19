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
	
	override String getLabelNombre2() {
		"Habilitados: "
	}
	
	
	override String getLabelNombre3() {
		"Deshabilitados"
	}
	
	override tituloContenedorBusqueda() {
	   "Lugares"
	}
	
	override textoPrimerParametroDeBusqueda() {
		"Buscar por nombre de Lugar "
	}


	

	
	
}