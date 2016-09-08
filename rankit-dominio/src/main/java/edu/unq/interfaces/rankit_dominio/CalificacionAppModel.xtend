package edu.unq.interfaces.rankit_dominio

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class CalificacionAppModel {
	
	AdmCalificaciones administradorCalificacion;
	Calificacion calificacionSeleccionada;
	
	new(AdmCalificaciones it) {
	administradorCalificacion = it
	}
	
}