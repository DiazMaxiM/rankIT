package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class RankIT {

	private var AdmUsuarios admUsuarios
	private var AdmCalificaciones admCalificaciones;
	private var AdmPuntuables admServicios;
	private var AdmPuntuables admLugares;
	private var Usuario usuarioLogeado;

}
