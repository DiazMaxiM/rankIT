package appModels

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class LugarAppModel extends PuntuableAppModel {

	// Ventana
	override String getDescripcionDato1ResumenDeSituacion() {
		"Lugares Inscriptos: "
	}

	override tituloContenedorBusqueda() {
		"Lugares"
	}

	override textoPrimerParametroDeBusqueda() {
		"Buscar por nombre de Lugar "
	}

}
