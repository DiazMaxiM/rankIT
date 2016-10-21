package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class CalificacionDelUsuario {
	 PuntuablesBasicos evaluado
	 int promedio
	 Integer puntos
	 String detalle
	 Integer id
	 new(PuntuablesBasicos evaluado, int promedio, String detalle, Integer puntos, Integer id) {
		 this.evaluado=evaluado
		 this.promedio=promedio
		 this.puntos=puntos
		 this.detalle=detalle
		 this.id=id
	}
	
}