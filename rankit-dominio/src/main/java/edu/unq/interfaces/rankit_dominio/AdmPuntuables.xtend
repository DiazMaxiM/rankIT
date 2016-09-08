package edu.unq.interfaces.rankit_dominio

import java.util.List
import java.util.ArrayList

class AdmPuntuables {
	List<Puntuable> lugares = new ArrayList
	List<Puntuable> servicios = new ArrayList
	
	def agregarLugar(Lugar lugar) {
		lugares.add(lugar)
	}
	
	def eliminarLugar(Lugar lugar) {
		lugares.remove(lugar)
	}
	
	def agregarServicio(Servicio servicio){
		servicios.add(servicio)
	}
	def eliminarServicio(Servicio servicio){
		servicios.remove(servicio)
	}
	
}