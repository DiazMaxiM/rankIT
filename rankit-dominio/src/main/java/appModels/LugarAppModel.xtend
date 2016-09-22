package appModels


import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class LugarAppModel extends PuntuableAppModel {
	
	//Ventana
	override String getLabelNombre1() {
		"Lugares Inscriptos: "
	}
	
	override tituloContenedorBusqueda() {
	   "Lugares"
	}
	
	override textoPrimerParametroDeBusqueda() {
		"Buscar por nombre de Lugar "
	}
		
}
