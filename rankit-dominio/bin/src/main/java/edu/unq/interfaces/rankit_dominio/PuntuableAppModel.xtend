package edu.unq.interfaces.rankit_dominio


import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class PuntuableAppModel {
	 AdmPuntuables administradorDePuntuables
	 AdmCalificaciones administradorCalificacion
	 Puntuable    puntuableSeleccionado
	
	new(AdmPuntuables adm1, AdmCalificaciones adm2){
		this.administradorDePuntuables= adm1
		this.administradorCalificacion=adm2
		
	}
	
	def nuevoLugar() {
		var lugar = new Lugar
		administradorDePuntuables.agregarLugar(lugar)
		lugar
	}
	def eliminarLugar(){
		administradorDePuntuables.eliminarLugar(puntuableSeleccionado)
	}
	def nuevoServicio() {
		var servicio = new Servicio
		administradorDePuntuables.agregarServicio(servicio)
		servicio
	}
	
	def eliminarServicio(){
		administradorDePuntuables.eliminarServicio(puntuableSeleccionado)
	}
	
}
