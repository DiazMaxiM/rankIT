package edu.unq.interfaces.rankit_dominio

import java.util.List

class AdmPuntuablesBasicos {
	List<PuntuablesBasicos> puntuables
	new(List<PuntuablesBasicos> basicos) {
	  	this.puntuables=basicos
	 }
	
	def PuntuablesBasicos devolverPuntuableConElNombre(String nombre) {
		var puntuable= puntuables.findFirst[puntuable|puntuable.nombre.equals(nombre)]
		puntuable
		
	}
	
}