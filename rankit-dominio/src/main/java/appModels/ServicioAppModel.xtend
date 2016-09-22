package appModels

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class ServicioAppModel extends PuntuableAppModel {

	// Ventana
	override String getDescripcionDato1ResumenDeSituacion() {
		"Servicios Inscriptos: "
	}

	override tituloContenedorBusqueda() {
		"Servicios"
	}

	override textoPrimerParametroDeBusqueda() {
		"Buscar por nombre de Servicio "
	}

}
