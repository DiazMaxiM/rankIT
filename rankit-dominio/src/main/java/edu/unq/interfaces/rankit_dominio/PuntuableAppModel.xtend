package edu.unq.interfaces.rankit_dominio


import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class PuntuableAppModel {
	 AdmPuntuables administradorPuntuables;
	  Puntuable    puntuableSeleccionado;
}