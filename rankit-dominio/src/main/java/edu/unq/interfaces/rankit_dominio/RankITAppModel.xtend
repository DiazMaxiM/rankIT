package edu.unq.interfaces.rankit_dominio

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Dependencies

@Observable
@Accessors
class RankITAppModel {
	
	private RankIT rankit;
	
	new(RankIT it) {
	rankit = it
	}
	@Dependencies("cantidadTotalDeUsuariosActivos")
	def String getResumenSituacionUsuario(){
		this.rankit.admUsuarios.cantidadTotalDeUsuariosActivos + " / " + this.rankit.admUsuarios.cantidadTotalDeUsuarios + "("+this.rankit.admUsuarios.cantidadTotalDeUsuariosBaneados+")"
	}
	def String getResumenSituacionCalificacion(){
		this.rankit.admCalificaciones.cantidadDeCalificacionesNoOfensivas + " / " + this.rankit.admCalificaciones.calificacionesRegistradas
	}
	def String getResumenSituacionServicio(){
			this.rankit.admServicios.habilitados + " / "+ this.rankit.admServicios.inscriptos
	}
	def String getResumenSituacionLugar(){
		this.rankit.admLugares.habilitados + " / "+ this.rankit.admLugares.inscriptos
			}
}