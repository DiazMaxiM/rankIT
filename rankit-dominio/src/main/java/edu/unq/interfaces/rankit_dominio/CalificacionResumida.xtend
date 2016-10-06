package edu.unq.interfaces.rankit_dominio

import edu.unq.interfaces.rankit_dominio.PuntuablesBasicos
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class CalificacionResumida {
	private PuntuablesBasicos puntuableBasico
	private int ranking
	private int calificaciones

	new(PuntuablesBasicos basicos, int ranking, int cantidadCalificaciones) {
		puntuableBasico = basicos
		this.ranking = ranking
		this.calificaciones = cantidadCalificaciones
	}

}
