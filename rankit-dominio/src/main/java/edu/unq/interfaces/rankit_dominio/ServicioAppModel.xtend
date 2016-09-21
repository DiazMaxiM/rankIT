package edu.unq.interfaces.rankit_dominio

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class ServicioAppModel extends PuntuableAppModel {	
	
	//Ventana

	
	override String getLabelNombre1() {
		"Servicios Inscriptos: "
	}
	
	override tituloContenedorBusqueda() {
	   "Servicios"
	}
	
	override textoPrimerParametroDeBusqueda() {
		"Buscar por nombre de Servicio "
	}
	
}